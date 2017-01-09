package com.wongsir.newsgathering.KeySearch.test;

import java.util.List;

import com.wongsir.newsgathering.KeySearch.model.BaiduNewsEntity;
import com.wongsir.newsgathering.KeySearch.model.Rule;
import com.wongsir.newsgathering.KeySearch.service.CrawlService;

/** 
* @Description: 测试类 
* @author Wongsir
* @date 2017年1月6日 
*  
*/
public class Test {
	
	/**
	 * 使用百度新闻搜索，
	 */
	@org.junit.Test
	public void getDatasByCssQueryUserBaidu(){
		Rule rule = new Rule("http://news.baidu.com/ns",new String[] {"word","pn"},
				new String[] {"猪肉","200"},"result",Rule.CLASS,Rule.GET);
		List<BaiduNewsEntity> crawls = CrawlService.crawl(rule);
		printf(crawls);
	}
	
	
	@org.junit.Test
	public void getBaiduNews(){
		while(true){
			Rule rule = new Rule("http://news.so.com/ns",new String[] {"q","pn"},
					new String[] {"支付宝","3"},null,-1,Rule.GET);
			List<BaiduNewsEntity> crawls = CrawlService.crawl(rule);
			printf(crawls);
		}
	}
	
	public void printf(List<BaiduNewsEntity> datas)
	{
		for (BaiduNewsEntity data : datas)
		{
			System.out.println(data.getHref());
			System.out.println(data.getTitle());
			System.out.println(data.getSameNum());
			System.out.println("***********************************");
		}

	}
}
