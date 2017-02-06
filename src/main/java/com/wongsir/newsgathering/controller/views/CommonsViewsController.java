package com.wongsir.newsgathering.controller.views;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wongsir.newsgathering.advanceSearch.entity.SearchItem;
import com.wongsir.newsgathering.advanceSearch.service.AdvanceSearchService;
import com.wongsir.newsgathering.advanceSearch.service.SpiderSearch;
import com.wongsir.newsgathering.controller.BaseController;
import com.wongsir.newsgathering.model.async.State;
import com.wongsir.newsgathering.model.async.Task;
import com.wongsir.newsgathering.model.commons.SpiderInfo;
import com.wongsir.newsgathering.model.commons.Webpage;
import com.wongsir.newsgathering.model.utils.ResultBundle;
import com.wongsir.newsgathering.model.utils.ResultListBundle;
import com.wongsir.newsgathering.service.commons.spider.CommonsSpiderService;
import com.wongsir.newsgathering.service.commons.spiderinfo.SpiderInfoService;
import com.wongsir.newsgathering.service.commons.webpage.CommonWebpageService;
import com.wongsir.newsgathering.utils.SpiderTemplate;

/** 
* @Description: CommonsViewsController 
* @author Wongsir
* @date 2017年1月4日 下午4:20:50 
*  
*/
@Controller
@RequestMapping("views/")
public class CommonsViewsController extends BaseController {
	private static final Gson gson = new Gson();
	private Logger LOG = LogManager.getLogger(CommonsViewsController.class);
	@Autowired
	private CommonsSpiderService commonsSpiderService;
	@Autowired
	private CommonWebpageService commonWebpageService;
	@Autowired
	private SpiderInfoService spiderInfoService;
	@Autowired
	private AdvanceSearchService advanceSearchService;
	@Autowired
	private SpiderSearch spiderSearch;
	
	/*
	 * @Autowired private CommonsSpiderService spiderService;
	 */
	
	/**
	 * 资讯列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "newsList", method = RequestMethod.GET)
	public ModelAndView newsList(@RequestParam(required = false) String query,
			@RequestParam(required = false) String domain,
			@RequestParam(defaultValue = "1", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("newsList");
		modelAndView.addObject("query", query);
		modelAndView.addObject("page", page);
		modelAndView.addObject("domain", domain);
		if (StringUtils.isNotBlank(query)) { // 根据关键词进行全文搜索
			 modelAndView.addObject("resultBundle", commonWebpageService.searchByQueryAndPage(query, 10, page).getResultList());
		} else if (StringUtils.isNotBlank(domain)) {
			modelAndView.addObject("resultBundle",
					commonWebpageService.getWebpageByDomain(domain, 10, page).getResultList());
		} else { // 根据页码查询数据
			modelAndView.addObject("resultBundle", commonWebpageService.listAll(10, page).getResultList());
		}
		return modelAndView;
	}

	/**
	 * 爬虫快速入口
	 * 
	 * @return
	 */
	@RequestMapping(value = "entry")
	public ModelAndView entry() {
		ModelAndView modelAndView = new ModelAndView("crawl");
		return modelAndView;
	}
	
	/**
	 * 通过快速入口爬取
	 * @param code
	 * @param count
	 * @return
	 */
	@RequestMapping(value = "crawlingEntry", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	public ModelAndView crawlingEntry(@RequestParam(defaultValue = "4", required = false) int code,@RequestParam(defaultValue = "300", required = false) int count) {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/views/newsList");
		SpiderTemplate spiderTemplate = new SpiderTemplate();
    	String spiderInfoJson = spiderTemplate.jsonFileTemplate(code);
    	ResultBundle<String> result = new  ResultBundle<String>();
    	result = commonsSpiderService.startWithTemplate(spiderInfoJson,count);
//    	modelAndView.addObject("resultBundle", result);
    	try {
			Thread.sleep(10 * 1000L);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 网站列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "siteList", method = RequestMethod.GET)
	public ModelAndView siteList(@RequestParam(defaultValue = "50", required = false, value = "size") int size) {
		ModelAndView modelAndView = new ModelAndView("siteList");
		modelAndView.addObject("siteList", commonWebpageService.countDomain(size).getResult());
		return modelAndView;
	}
	
	/**
	 * 高级配置
	 * @param jsonSpiderInfo json格式的爬虫模板
	 * @return
	 */
	@RequestMapping(value="advanceConfig", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView advanceConfig(String jsonSpiderInfo){
		ModelAndView modelAndView = new ModelAndView("advanceConfig");
		if (StringUtils.isNotBlank(jsonSpiderInfo)) {
            SpiderInfo spiderInfo = gson.fromJson(jsonSpiderInfo, SpiderInfo.class);
            //对可能含有html的字段进行转义
            spiderInfo.setPublishTimeReg(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeReg()));
            spiderInfo.setCategoryReg(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryReg()));
            spiderInfo.setContentReg(StringEscapeUtils.escapeHtml4(spiderInfo.getContentReg()));
            spiderInfo.setTitleReg(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleReg()));
            spiderInfo.setPublishTimeXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeXPath()));
            spiderInfo.setCategoryXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryXPath()));
            spiderInfo.setContentXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getContentXPath()));
            spiderInfo.setTitleXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleXPath()));
            for (SpiderInfo.FieldConfig config : spiderInfo.getDynamicFields()) {
                config.setRegex(StringEscapeUtils.escapeHtml4(config.getRegex()));
                config.setXpath(StringEscapeUtils.escapeHtml4(config.getXpath()));
            }
            modelAndView.addObject("spiderInfo", spiderInfo);
            modelAndView.addObject("jsonSpiderInfo", jsonSpiderInfo);
        } else {
            modelAndView.addObject("spiderInfo", new SpiderInfo());
        }
        return modelAndView;
	}
	
	/**
	 * 编辑高级配置
	 * @param spiderInfoId 模板id
	 * @return
	 */
	@RequestMapping(value="editConfigById", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView editConfigById(String spiderInfoId){
		 ModelAndView modelAndView = new ModelAndView("advanceConfig");
	        SpiderInfo spiderInfo = spiderInfoService.getById(spiderInfoId).getResult();
	        //对可能含有html的字段进行转义
	        spiderInfo.setPublishTimeReg(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeReg()));
	        spiderInfo.setCategoryReg(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryReg()));
	        spiderInfo.setContentReg(StringEscapeUtils.escapeHtml4(spiderInfo.getContentReg()));
	        spiderInfo.setTitleReg(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleReg()));
	        spiderInfo.setPublishTimeXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeXPath()));
	        spiderInfo.setCategoryXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryXPath()));
	        spiderInfo.setContentXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getContentXPath()));
	        spiderInfo.setTitleXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleXPath()));
	        for (SpiderInfo.FieldConfig config : spiderInfo.getDynamicFields()) {
	            config.setRegex(StringEscapeUtils.escapeHtml4(config.getRegex()));
	            config.setXpath(StringEscapeUtils.escapeHtml4(config.getXpath()));
	        }
	        modelAndView.addObject("spiderInfo", spiderInfo);
	        modelAndView.addObject("jsonSpiderInfo", gson.toJson(spiderInfo));
	        return modelAndView;
	}
	
	/**
	 * 高级搜索
	 * @return
	 */
	@RequestMapping(value="",method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView advanceSearch(String key){
		ModelAndView modelAndView = new ModelAndView("advanceSearch");
		modelAndView.addObject("key",key);
//		List<SearchItem> list = new ArrayList<SearchItem>();
//		try {
//			list = spiderSearch.searchByKey(key);
//			modelAndView.addObject("spiderSearch", list);
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		modelAndView.addObject("spiderSearch", spiderSearch.searchByKey(key));
		return modelAndView;
	}
	
	
	@RequestMapping(value="advanceSearch/findAll")
	public List<SearchItem> findAllSearch(){
		List<SearchItem> list = new ArrayList<SearchItem>();
		list = advanceSearchService.findAllSearch();
		System.out.println(list);
		return list;
	}
	

	/**
	 * 模板列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "templateList", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView templateList(String domain, @RequestParam(defaultValue = "1", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("templateList");
		if (StringUtils.isBlank(domain)) {
			modelAndView.addObject("templateList", spiderInfoService.listAll(10, page).getResultList());
		} else {
			modelAndView.addObject("templateList", spiderInfoService.getByDomain(domain, 10, page).getResultList());
		}
		modelAndView.addObject("page", page);
		modelAndView.addObject("domain", domain);
		return modelAndView;
	}
	
	
	/**
     * 根据网页id展示网页
     *
     * @param id 网页id
     * @return 展示页
     */
    @RequestMapping(value = "showWebpageById", method = {RequestMethod.GET})
    public ModelAndView showWebpageById(String id) {
        ModelAndView modelAndView = new ModelAndView("showWebpageById");
        modelAndView.addObject("webpage", commonWebpageService.getWebpageById(id).getResult());
        modelAndView.addObject("relatedWebpageList", commonWebpageService.moreLikeThis(id, 15, 1).getResultList());
        return modelAndView;
    }
    
    
    /**
     * 获取query的关联信息
     *
     * @param query 查询queryString
     * @param size  结果集数量
     * @return 相关信息
     */
    @RequestMapping(value = "showRelatedInfo", method = {RequestMethod.GET})
    public ModelAndView showRelatedInfo(String query, @RequestParam(required = false, defaultValue = "10") int size) {
        ModelAndView modelAndView = new ModelAndView("showRelatedInfo");
        Pair<Map<String, List<Terms.Bucket>>, List<Webpage>> result = commonWebpageService.relatedInfo(query, size).getResult();
        String title = "";
        String[] queryArray = query.split(":");
        String field = queryArray[0];
        String queryWord = queryArray[1];
        switch (field) {
            case "keywords":
                title += "关键词:";
                break;
            case "namedEntity.nr":
                title += "人物:";
                break;
            case "namedEntity.ns":
                title += "地点:";
                break;
            case "namedEntity.nt":
                title += "机构:";
                break;
        }
        title += queryWord + "的相关信息";
        modelAndView.addObject("relatedPeople", result.getKey().get("relatedPeople"));
        modelAndView.addObject("title", title);
        modelAndView.addObject("relatedLocation", result.getKey().get("relatedLocation"));
        modelAndView.addObject("relatedInstitution", result.getKey().get("relatedInstitution"));
        modelAndView.addObject("relatedKeywords", result.getKey().get("relatedKeywords"));
        modelAndView.addObject("relatedWebpageList", result.getValue());
        return modelAndView;
    }
    
    
    
    

	/**
	 * 域名列表
	 *
	 * @return
	 */
	@RequestMapping(value = "domainList", method = RequestMethod.GET)
	public ModelAndView domainList(@RequestParam(defaultValue = "50", required = false, value = "size") int size) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/domainList");
		modelAndView.addObject("domainList", commonWebpageService.countDomain(size).getResult());
		return modelAndView;
	}

	/**
	 * 所有的抓取任务列表
	 *
	 * @return
	 */
	@RequestMapping(value = "tasks", method = RequestMethod.GET)
	public ModelAndView tasks(@RequestParam(required = false, defaultValue = "false") boolean showRunning) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/listTasks");
		ResultListBundle<Task> listBundle;
		if (!showRunning) {
			listBundle = commonsSpiderService.getTaskList(true);
		} else {
			listBundle = commonsSpiderService.getTasksFilterByState(State.RUNNING, true);
		}
		ResultBundle<Long> runningTaskCount = commonsSpiderService.countByState(State.RUNNING);
		modelAndView.addObject("resultBundle", listBundle);
		modelAndView.addObject("runningTaskCount", runningTaskCount.getResult());
		modelAndView.addObject("spiderInfoList",
				listBundle.getResultList().stream()
						.map(task -> StringEscapeUtils.escapeHtml4(gson.toJson(task.getExtraInfoByKey("spiderInfo"))))
						.collect(Collectors.toList()));
		return modelAndView;
	}

	/**
	 * 编辑爬虫模板
	 *
	 * @param jsonSpiderInfo
	 *            json格式的爬虫模板
	 * @return
	 */
	@RequestMapping(value = "editSpiderInfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView editSpiderInfo(String jsonSpiderInfo) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/editSpiderInfo");
		if (StringUtils.isNotBlank(jsonSpiderInfo)) {
			SpiderInfo spiderInfo = gson.fromJson(jsonSpiderInfo, SpiderInfo.class);
			// 对可能含有html的字段进行转义
			spiderInfo.setPublishTimeReg(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeReg()));
			spiderInfo.setCategoryReg(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryReg()));
			spiderInfo.setContentReg(StringEscapeUtils.escapeHtml4(spiderInfo.getContentReg()));
			spiderInfo.setTitleReg(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleReg()));
			spiderInfo.setPublishTimeXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeXPath()));
			spiderInfo.setCategoryXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryXPath()));
			spiderInfo.setContentXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getContentXPath()));
			spiderInfo.setTitleXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleXPath()));
			for (SpiderInfo.FieldConfig config : spiderInfo.getDynamicFields()) {
				config.setRegex(StringEscapeUtils.escapeHtml4(config.getRegex()));
				config.setXpath(StringEscapeUtils.escapeHtml4(config.getXpath()));
			}
			modelAndView.addObject("spiderInfo", spiderInfo);
			modelAndView.addObject("jsonSpiderInfo", jsonSpiderInfo);
		} else {
			modelAndView.addObject("spiderInfo", new SpiderInfo());
		}
		return modelAndView;
	}

	/**
	 * 编辑爬虫模板
	 *
	 * @param spiderInfoId
	 *            爬虫模板id
	 * @return
	 */
	@RequestMapping(value = "editSpiderInfoById", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView editSpiderInfoById(String spiderInfoId) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/editSpiderInfo");
		SpiderInfo spiderInfo = spiderInfoService.getById(spiderInfoId).getResult();
		// 对可能含有html的字段进行转义
		spiderInfo.setPublishTimeReg(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeReg()));
		spiderInfo.setCategoryReg(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryReg()));
		spiderInfo.setContentReg(StringEscapeUtils.escapeHtml4(spiderInfo.getContentReg()));
		spiderInfo.setTitleReg(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleReg()));
		spiderInfo.setPublishTimeXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getPublishTimeXPath()));
		spiderInfo.setCategoryXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getCategoryXPath()));
		spiderInfo.setContentXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getContentXPath()));
		spiderInfo.setTitleXPath(StringEscapeUtils.escapeHtml4(spiderInfo.getTitleXPath()));
		for (SpiderInfo.FieldConfig config : spiderInfo.getDynamicFields()) {
			config.setRegex(StringEscapeUtils.escapeHtml4(config.getRegex()));
			config.setXpath(StringEscapeUtils.escapeHtml4(config.getXpath()));
		}
		modelAndView.addObject("spiderInfo", spiderInfo);
		modelAndView.addObject("jsonSpiderInfo", gson.toJson(spiderInfo));
		return modelAndView;
	}

	@RequestMapping(value = "listSpiderInfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView listSpiderInfo(String domain, @RequestParam(defaultValue = "1", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/listSpiderInfo");
		if (StringUtils.isBlank(domain)) {
			modelAndView.addObject("spiderInfoList", spiderInfoService.listAll(10, page).getResultList());
		} else {
			modelAndView.addObject("spiderInfoList", spiderInfoService.getByDomain(domain, 10, page).getResultList());
		}
		modelAndView.addObject("page", page);
		modelAndView.addObject("domain", domain);
		return modelAndView;
	}

	@RequestMapping(value = "updateBySpiderInfoID", method = { RequestMethod.GET })
	public ModelAndView updateBySpiderInfoID(
			@RequestParam(required = false, defaultValue = "") String spiderInfoIdUpdateBy,
			@RequestParam(required = false, defaultValue = "") String spiderInfoJson) {
		ModelAndView modelAndView = new ModelAndView("panel/commons/ updateBySpiderInfoID");
		modelAndView.addObject("spiderInfoJson", spiderInfoJson);
		modelAndView.addObject("spiderInfoIdUpdateBy", spiderInfoIdUpdateBy);
		return modelAndView;
	}
}
