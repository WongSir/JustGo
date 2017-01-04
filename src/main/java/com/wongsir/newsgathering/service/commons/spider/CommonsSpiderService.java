package com.wongsir.newsgathering.service.commons.spider;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.google.common.base.Preconditions;
import com.google.gson.Gson;
import com.wongsir.newsgathering.gather.async.AsyncGather;
import com.wongsir.newsgathering.gather.commons.CommonSpider;
import com.wongsir.newsgathering.model.commons.SpiderInfo;
import com.wongsir.newsgathering.model.commons.Webpage;
import com.wongsir.newsgathering.model.utils.ResultBundle;
import com.wongsir.newsgathering.model.utils.ResultBundleBuilder;
import com.wongsir.newsgathering.model.utils.ResultListBundle;
import com.wongsir.newsgathering.service.commons.AsyncGatherService;
import com.wongsir.newsgathering.service.commons.spiderinfo.SpiderInfoService;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
@Component
public class CommonsSpiderService extends AsyncGatherService {
    private Logger LOG = LogManager.getLogger(CommonsSpiderService.class);
    @Autowired
    private CommonSpider commonSpider;
    @Autowired
    private ResultBundleBuilder bundleBuilder;
    @Autowired
    private SpiderInfoService spiderInfoService;
    private Gson gson = new Gson();

    @Autowired
    public CommonsSpiderService(@Qualifier("commonSpider") AsyncGather asyncGather) {
        super(asyncGather);
    }

    /**
     * 启动爬虫
     *
     * @param spiderInfo 爬虫模板信息spiderinfo
     * @return 任务id
     */
    public ResultBundle<String> start(SpiderInfo spiderInfo) {
        //如果id为空则直接存储
        if (StringUtils.isBlank(spiderInfo.getId())) {
            validateSpiderInfo(spiderInfo);
            String spiderInfoId = spiderInfoService.index(spiderInfo).getResult(); //获取创建index时ES自动生成的随机id作为模板列表spiderinfo的id
            spiderInfo.setId(spiderInfoId);
            System.out.println("执行start，通过json校验");
        } else {
            //如果id不为空则更新这个id的爬虫模板
            spiderInfoService.update(spiderInfo);
        }
        return bundleBuilder.bundle(spiderInfo.toString(), () -> commonSpider.start(spiderInfo));
    }

    /**
     * 启动爬虫
     * 使用Gson提供了fromJson()方法来实现从Json相关对象到Java实体的方法
     * @param spiderInfoJson 使用json格式进行序列化的spiderinfo
     * @return 任务id
     */
    public ResultBundle<String> start(String spiderInfoJson) {
        Preconditions.checkArgument(StringUtils.isNotBlank(spiderInfoJson), "爬虫配置模板为空");
        SpiderInfo spiderInfo = gson.fromJson(spiderInfoJson, SpiderInfo.class);
        spiderInfo.setMaxPageGather(10);
        return start(spiderInfo);
    }

    /**
     * 通过读取模板启动爬虫
     * @param spiderInfoJson 经gson解析后的json模板
     * @param count 接收的前台传过来的抓取数量
     * @return
     */
    public ResultBundle<String> startWithTemplate(String spiderInfoJson,int count) {
        Preconditions.checkArgument(StringUtils.isNotBlank(spiderInfoJson), "爬虫配置模板为空");
        SpiderInfo spiderInfo = gson.fromJson(spiderInfoJson, SpiderInfo.class);
        spiderInfo.setMaxPageGather(count);
        return start(spiderInfo);
    }
    
    
    /**
     * 停止爬虫
     *
     * @param uuid 任务id(爬虫uuid)
     * @return
     */
    public ResultBundle<String> stop(String uuid) {
        return bundleBuilder.bundle(uuid, () -> {
            commonSpider.stop(uuid);
            return "OK";
        });
    }

    /**
     * 删除爬虫
     *
     * @param uuid 爬虫uuid 任务id
     * @return
     */
    public ResultBundle<String> delete(String uuid) {
        return bundleBuilder.bundle(uuid, () -> {
            commonSpider.delete(uuid);
            return "OK";
        });
    }

    /**
     * 删除所有爬虫
     *
     * @return
     */
    public ResultBundle<String> deleteAll() {
        return bundleBuilder.bundle(null, () -> {
            commonSpider.deleteAll();
            return "OK";
        });
    }

    /**
     * 获取爬虫运行时信息
     *
     * @param uuid 爬虫uuid 任务id
     * @return
     */
    public ResultBundle<Map<Object, Object>> runtimeInfo(String uuid, boolean containsExtraInfo) {
        return bundleBuilder.bundle(uuid, () -> commonSpider.getSpiderRuntimeInfo(uuid, containsExtraInfo));
    }

    /**
     * 列出所有爬虫的运行时信息
     *
     * @return
     */
    public ResultBundle<Map<String, Map<Object, Object>>> list(boolean containsExtraInfo) {
        return bundleBuilder.bundle(null, () -> commonSpider.listAllSpiders(containsExtraInfo));
    }

    /**
     * 测试爬虫模板
     *
     * @param spiderInfoJson
     * @return
     */
    public ResultListBundle<Webpage> testSpiderInfo(String spiderInfoJson) {
        SpiderInfo spiderInfo = gson.fromJson(spiderInfoJson, SpiderInfo.class);
        validateSpiderInfo(spiderInfo);
        return bundleBuilder.listBundle(spiderInfoJson, () -> commonSpider.testSpiderInfo(spiderInfo));
    }

    /**
     * 获取忽略url黑名单
     *
     * @return
     */
    public ResultListBundle<String> getIgnoredUrls() {
        return bundleBuilder.listBundle(null, () -> commonSpider.getIgnoredUrls());
    }

    /**
     * 添加忽略url黑名单
     *
     * @param postfix
     */
    public ResultBundle<String> addIgnoredUrl(String postfix) {
        return bundleBuilder.bundle(postfix, () -> {
            commonSpider.addIgnoredUrl(postfix);
            return "OK";
        });
    }

    /**
     * 验证爬虫模板
     *
     * @param spiderInfo 爬虫模板
     */
    private void validateSpiderInfo(SpiderInfo spiderInfo) {
        Preconditions.checkArgument(spiderInfo.getStartURL().size() > 0, "起始地址列表不能为空");
        Preconditions.checkArgument(StringUtils.isNotBlank(spiderInfo.getDomain()), "domain不可为空");
        Preconditions.checkArgument(!spiderInfo.getDomain().contains("/"), "域名不能包含/");
        Preconditions.checkArgument(spiderInfo.getThread() > 0, "线程数必须大于0");
        Preconditions.checkArgument(StringUtils.isNotBlank(spiderInfo.getSiteName()), "网站名称不可为空");
        Preconditions.checkArgument(spiderInfo.getTimeout() > 1000, "超时时间必须大于1秒");
        if (spiderInfo.getDynamicFields() != null) {
            Preconditions.checkArgument(
                    //每一个动态字段都必须有name,而且正则和xpath不可同时为空
                    spiderInfo.getDynamicFields().stream()
                            .filter(fieldConfig ->
                                    StringUtils.isBlank(fieldConfig.getName()) ||
                                            (StringUtils.isBlank(fieldConfig.getRegex()) && StringUtils.isBlank(fieldConfig.getXpath()))
                            )
                            .count() == 0,
                    "动态字段配置含有无效配置,每一个动态字段都必须有name,而且正则和xpath不可同时为空,请检查");
        }
    }
}
