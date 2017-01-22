package com.wongsir.newsgathering.advanceSearch.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wongsir.newsgathering.advanceSearch.entity.SearchItem;
import com.wongsir.newsgathering.advanceSearch.service.AdvanceSearchService;
import com.wongsir.newsgathering.advanceSearch.service.SpiderSearch;

/** 
* @Description: TODO 
* @author hjd
* @date 2017年1月19日 下午2:43:13 
*  
*/
@RestController
@RequestMapping("views/")
public class AdvanceSearchController {
	@Autowired
	private AdvanceSearchService advanceSearchService;
	@Autowired
	private SpiderSearch spiderSearch;
	
	@RequestMapping(value="advanceSearch")
	public ModelAndView advanceSearch(){
		ModelAndView modelAndView = new ModelAndView("advanceSearch");
		return modelAndView;
	}
	
	/**
	 * 根据关键字搜索并抓取
	 * @param key
	 * @return
	 */
	@RequestMapping(value="advanceSearch/searchAndCraweling",method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchAndCraweling(@RequestParam String key){
		if(key==null || key==""){
			ModelAndView modelAndView = new ModelAndView("advanceSearch");
			return modelAndView;
		}else{
			ModelAndView modelAndView = new ModelAndView("searchList");
			modelAndView.addObject("key",key);
			List<SearchItem> list = new ArrayList<SearchItem>();
			int flag=1; //flag=1,该关键词没搜索过
			if(flag != advanceSearchService.judgeKey(key)){
				advanceSearchService.deleteSearchItem(key);
			}
			spiderSearch.searchByKey(key);
			list = advanceSearchService.query(key);
			modelAndView.addObject("spiderSearch",list);
			return modelAndView;
		}
		
		
//		list = spiderSearch.searchByKey(key); //抓取
		
//		return "views/searchList";
//		return modelAndView;
//		return list;
	}
	
	@RequestMapping(value="advanceSearch/searchList")
	public ModelAndView searchList(){
		ModelAndView modelAndView = new ModelAndView("searchList");
		return modelAndView;
	} 
	
//	
//	@RequestMapping(value="advanceSearch/findAllSearch")
//	public List<SearchItem> findAllSearch(){
//		List<SearchItem> list = new ArrayList<SearchItem>();
//		list = advanceSearchService.findAllSearch();
//		return list;
//	}
//	
//	/**
//	 * 查询所有关键字
//	 * @return
//	 */
//	@RequestMapping(value="advanceSearch/findAllKey")
//	public List<KeyWord> findAllKey(){
//		List<KeyWord> keys = new ArrayList<KeyWord>();
//		keys = advanceSearchService.findAllKey();
//		return keys;
//	}
//	
	
}
