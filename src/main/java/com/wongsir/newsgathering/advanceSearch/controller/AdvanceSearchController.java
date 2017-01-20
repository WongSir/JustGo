package com.wongsir.newsgathering.advanceSearch.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wongsir.newsgathering.advanceSearch.entity.KeyWord;
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
//	@Autowired
//	private AdvanceSearchService advanceSearchService;
//	@Autowired
//	private SpiderSearch spiderSearch;
//	
//	/**
//	 * 根据关键字搜索并抓取
//	 * @param key
//	 * @return
//	 */
//	@RequestMapping(value="advanceSearch/{key}")
//	public List<SearchItem> searchAndCrawling(@PathVariable String key){
//		List<SearchItem> list = new ArrayList<SearchItem>();
//		int flag=1; //flag=1,该关键词没搜索过
//		if(flag != advanceSearchService.judgeKey(key)){
//			advanceSearchService.deleteSearchItem(key);
//		}
//		try {
//			spiderSearch.searchByKey(key); //抓取
//			list = advanceSearchService.query(key);
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
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
