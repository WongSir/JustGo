package com.gs.spider.dao;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.*;
import com.gs.spider.model.async.Task;
import com.gs.spider.model.commons.SpiderInfo;
import com.gs.spider.model.commons.Webpage;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MoreLikeThisQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.sort.SortOrder;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.ExecutionException;

import static org.elasticsearch.index.query.QueryBuilders.moreLikeThisQuery;

/**
 * CommonWebpageDAO
 *
 * @author Gao Shen
 * @version 16/4/18
 */
@Component
public class CommonWebpageDAO extends IDAO<Webpage> {
    private final static String INDEX_NAME = "commons", TYPE_NAME = "webpage";
    private final static String INDEX_NAME_SPIDER = "spiderinfo", TYPE_NAME_SPIDER = "spiderinfo";
    private static final int SCROLL_TIMEOUT = 1;
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(Date.class, (JsonDeserializer<Date>) (json, typeOfT, context) -> new Date(json.getAsJsonPrimitive().getAsLong()))
            .registerTypeAdapter(Date.class, (JsonSerializer<Date>) (src, typeOfSrc, context) -> new JsonPrimitive(src.getTime()))
            .setDateFormat(DateFormat.LONG).create();
    private Logger LOG = LogManager.getLogger(CommonWebpageDAO.class);

    @Autowired
    public CommonWebpageDAO(ESClient esClient) {
        super(esClient, INDEX_NAME, TYPE_NAME);
    }

    public CommonWebpageDAO() {
    }

    @Override
    public String index(Webpage webpage) {
        IndexResponse indexResponse = null;
        try {
            indexResponse = client.prepareIndex(INDEX_NAME, TYPE_NAME)
                    .setSource(gson.toJson(webpage))
                    .get();
            return indexResponse.getId();
        } catch (Exception e) {
            LOG.error("索引 Webpage 出错," + e.getLocalizedMessage());
        }
        return null;
    }

    @Override
    protected boolean check() {
        return esClient.checkCommonsIndex() && esClient.checkWebpageType();
    }

    /**
     * 根据uuid获取结果
     *
     * @param uuid 爬虫uuid
     * @param size 每页数量
     * @param page 页码
     * @return
     */
    public List<Webpage> getWebpageBySpiderUUID(String uuid, int size, int page) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.matchQuery("spiderUUID", uuid))
                .setSize(size).setFrom(size * (page - 1));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return warpHits2List(response.getHits());
    }

    /**
     * 根据ES中的id获取网页
     *
     * @param id 网页id
     * @return
     */
    public Webpage getWebpageById(String id) {
        GetResponse response = client.prepareGet(INDEX_NAME, TYPE_NAME, id).get();
        Preconditions.checkArgument(response.isExists(), "无法找到ID为%s的文章,请检查参数", id);
        return warpHits2Info(response.getSourceAsString(), id);
    }

    /**
     * 根据id删除网页
     *
     * @param id 网页id
     * @return 是否删除
     */
    public boolean deleteById(String id) {
        DeleteResponse response = client.prepareDelete(INDEX_NAME, TYPE_NAME, id).get();
        return response.getResult() == DeleteResponse.Result.DELETED;
    }

    /**
     * 根据domain获取结果,按照抓取时间排序
     *
     * @param domain 网站域名
     * @param size   每页数量
     * @param page   页码
     * @return
     */
    public List<Webpage> getWebpageByDomain(String domain, int size, int page) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.matchQuery("domain", domain))  //通过匹配“domain”字段查询数据
                .addSort("gatherTime", SortOrder.DESC)
                .setSize(size).setFrom(size * (page - 1));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return warpHits2List(response.getHits());
    }

    /**
     * 根据domain列表获取结果
     *
     * @param domain 网站域名列表
     * @param size   每页数量
     * @param page   页码
     * @return
     */
    public List<Webpage> getWebpageByDomains(Collection<String> domain, int size, int page) {
        if (domain.size() == 0) return Lists.newArrayList();
        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
        domain.forEach(s -> boolQueryBuilder.should(QueryBuilders.matchQuery("domain", s)));
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(boolQueryBuilder)
                .addSort("gatherTime", SortOrder.DESC)
                .setSize(size).setFrom(size * (page - 1));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return warpHits2List(response.getHits());
    }

    private Webpage warpHits2Info(SearchHit hit) {
        Webpage webpage = gson.fromJson(hit.getSourceAsString(), Webpage.class);
        webpage.setId(hit.getId());
        return webpage;
    }

    private Webpage warpHits2Info(String jsonSource, String id) {
        Webpage webpage = gson.fromJson(jsonSource, Webpage.class);
        webpage.setId(id);
        return webpage;
    }

    private List<Webpage> warpHits2List(SearchHits hits) {
        List<Webpage> webpageList = Lists.newLinkedList();
        hits.forEach(searchHitFields -> {
            webpageList.add(warpHits2Info(searchHitFields));
        });
        return webpageList;
    }

    /**
     * 搜索es库中文章
     *
     * @param query 关键词
     * @param size  页面容量
     * @param page  页码
     * @return
     */
    public List<Webpage> searchByQueryAndPage(String query, int size, int page) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.queryStringQuery(query).analyzer("query_ansj").defaultField("content"))  //设定“ansj分词器”、根据query的关键字在“content”中查询
                .setSize(size).setFrom(size * (page - 1));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return warpHits2List(response.getHits());
    }
    
    /**
     * 搜索es库中文章
     * @param query 关键词
     * @return
     */
    public List<Webpage> searchByQuery(String query) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.queryStringQuery(query).analyzer("query_ansj").defaultField("content"));  //设定“ansj分词器”、根据query的关键字在“content”中查询
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return warpHits2List(response.getHits());
    }

    
    //前缀查询用以查找 ”新闻来源“
    /**
     * 根据域名前缀查找网站名，以确定新闻来源
     * @param query 
     * @return
     */
    public SpiderInfo prefixQuery(String query){
    	 SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME_SPIDER)
                 .setTypes(TYPE_NAME_SPIDER)
                 .setQuery(QueryBuilders.prefixQuery("domain",""));
//    	responsebuilder.setQuery(QueryBuilders.prefixQuery("title", "mo"))
		return null;
    	
    }
    
    /**
     * 列出库中所有文章,并按照抓取时间排序
     *
     * @param size 页面容量
     * @param page 页码
     * @return
     */
    public List<Webpage> listAll(int size, int page) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)  //检索的目录
                .setTypes(TYPE_NAME) //检索的索引
                .setQuery(QueryBuilders.matchAllQuery()) //查询 --query
                .addSort("gatherTime", SortOrder.DESC)  //排序 --sort
                .setSize(size).setFrom(size * (page - 1)); //topN方式  
        SearchResponse response = searchRequestBuilder.execute().actionGet(); //执行
        return warpHits2List(response.getHits());
    }

    /**
     * 开始滚动数据
     *
     * @return 滚动id
     */
    public Pair<String, List<Webpage>> startScroll() {
        return startScroll(QueryBuilders.matchAllQuery(), 50);
    }

    /**
     * 开始滚动数据
     *
     * @param queryBuilder 查询句柄
     * @return 滚动id和当前的一批数据
     */
    public Pair<String, List<Webpage>> startScroll(QueryBuilder queryBuilder, int size) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(queryBuilder)
                .setSize(size)
                .setScroll(TimeValue.timeValueMinutes(SCROLL_TIMEOUT));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        return new MutablePair<>(response.getScrollId(), warpHits2List(response.getHits()));
    }

    /**
     * 更新网页
     *
     * @param webpage 网页
     * @return
     */
    public boolean update(Webpage webpage) throws ExecutionException, InterruptedException {
        UpdateRequest updateRequest = new UpdateRequest();
        updateRequest.index(INDEX_NAME);
        updateRequest.type(TYPE_NAME);
        updateRequest.id(webpage.getId());
        updateRequest.doc(gson.toJson(webpage));
        UpdateResponse response = client.update(updateRequest).get();
        return response.getResult() == UpdateResponse.Result.UPDATED;
    }

    /**
     * 批量更新网页
     *
     * @param webpageList 网页列表
     * @return
     */
    public boolean update(List<Webpage> webpageList) throws ExecutionException, InterruptedException {
        BulkRequestBuilder bulkRequest = client.prepareBulk();
        for (Webpage webpage : webpageList) {
            UpdateRequest updateRequest = new UpdateRequest();
            updateRequest.index(INDEX_NAME);
            updateRequest.type(TYPE_NAME);
            updateRequest.id(webpage.getId());
            updateRequest.doc(gson.toJson(webpage));
            bulkRequest.add(updateRequest);
        }
        BulkResponse bulkResponse = bulkRequest.get();
        return bulkResponse.hasFailures();
    }

    /**
     * 根据scrollId获取全部数据
     *
     * @param scrollId scrollId
     * @return 网页列表
     */
    public List<Webpage> scrollAllWebpage(String scrollId) {
        Preconditions.checkArgument(StringUtils.isNotBlank(scrollId), "scrollId不可为空");
        SearchResponse response = client.prepareSearchScroll(scrollId)
                .setScroll(TimeValue.timeValueMinutes(SCROLL_TIMEOUT))
                .execute().actionGet();
        return warpHits2List(response.getHits());
    }

    /**
     * 统计每个网站有多少文章
     *
     * @return 域名-文章数
     */
    public Map<String, Long> countDomain(int size) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.matchAllQuery())
                .addAggregation(AggregationBuilders.terms("domain").field("domain").size(size).order(Terms.Order.count(false)));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        Terms termsAgg = response.getAggregations().get("domain");
        List<Terms.Bucket> list = termsAgg.getBuckets();
        Map<String, Long> count = new HashMap<>();
        list.stream().filter(bucket -> ((String) bucket.getKey()).length() > 1).forEach(bucket -> {
            count.put((String) bucket.getKey(), bucket.getDocCount());
        });
        return count;
    }

    /**
     * 统计制度域名的网站的文章的词频
     *
     * @param domain 网站域名
     * @return 词-词频
     */
    public Map<String, Long> countWordByDomain(String domain) {
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.matchQuery("domain", domain))
                .addAggregation(AggregationBuilders.terms("content").field("content").size(200));
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        Terms termsAgg = response.getAggregations().get("content");
        List<Terms.Bucket> list = termsAgg.getBuckets();
        Map<String, Long> count = new HashMap<>();
        list.stream().filter(bucket -> ((String) bucket.getKey()).length() > 1).forEach(bucket -> {
            count.put((String) bucket.getKey(), bucket.getDocCount());
        });
        return count;
    }

    /**
     * 根据网站的文章ID获取相似网站的文章
     *
     * @param id   文章ID
     * @param size 页面容量
     * @param page 页码
     * @return
     */
    public List<Webpage> moreLikeThis(String id, int size, int page) {
        MoreLikeThisQueryBuilder.Item[] items = {new MoreLikeThisQueryBuilder.Item(INDEX_NAME, TYPE_NAME, id)};
        String[] fileds = {"content"};
        SearchResponse response = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
                .setQuery(moreLikeThisQuery(fileds, null, items)
                        .minTermFreq(1)
                        .maxQueryTerms(12))
                .setSize(size).setFrom(size * (page - 1))
                .execute()
                .actionGet();
        return warpHits2List(response.getHits());
    }

    /**
     * 统计指定网站每天抓取数量
     *
     * @param domain 网站域名
     * @return
     */
    public Map<Date, Long> countDomainByGatherTime(String domain) {
        AggregationBuilder aggregation =
                AggregationBuilders
                        .dateHistogram("agg")
                        .field("gatherTime")
                        .dateHistogramInterval(DateHistogramInterval.DAY).order(Histogram.Order.KEY_DESC);
        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(INDEX_NAME)
                .setTypes(TYPE_NAME)
                .setQuery(QueryBuilders.matchQuery("domain", domain))
                .addAggregation(aggregation);
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        Histogram agg = response.getAggregations().get("agg");
        Map<Date, Long> result = Maps.newHashMap();
        for (Histogram.Bucket entry : agg.getBuckets()) {
            DateTime key = (DateTime) entry.getKey();    // Key
            long docCount = entry.getDocCount();         // Doc count
            result.put(key.toDate(), docCount);
        }
        return result;
    }

    /**
     * 根据网站domain删除数据
     *
     * @param domain 网站域名
     * @param task   任务实体
     * @return 是否全部数据删除成功
     */
    public boolean deleteByDomain(String domain, Task task) {
        return deleteByQuery(QueryBuilders.matchQuery("domain", domain), task);
    }
}
