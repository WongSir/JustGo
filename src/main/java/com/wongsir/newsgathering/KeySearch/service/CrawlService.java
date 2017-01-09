package com.wongsir.newsgathering.KeySearch.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.wongsir.newsgathering.KeySearch.exception.RuleException;
import com.wongsir.newsgathering.KeySearch.model.BaiduNewsEntity;
import com.wongsir.newsgathering.KeySearch.model.Rule;
import com.wongsir.newsgathering.KeySearch.util.TextUtil;

/** 
* @Description: 通过百度新闻搜索的信息抓取业务处理类 
* @author Wongsir
* @date 2017年1月5日 
*  分为两部分：一部分先获取到全部新闻链接，，另一部分再根据每条链接逐条获取详细信息
*/
public class CrawlService {
	/**
	 * 单例业务处理类
	 */
	public CrawlService(){
		
	}
	
	public static List<BaiduNewsEntity> crawl(Rule rule){
		//进行对rule的必要校验
		validateRule(rule);
		
		List<BaiduNewsEntity> linkDatas = new ArrayList<BaiduNewsEntity>();
		BaiduNewsEntity linkData = null;
		int flag =0;//用以标记
		try {
			/**
			 * 解析rule
			 */
			String url = rule.getUrl();
			String[] params = rule.getParams();
			String[] values = rule.getValues();
			String resultTagName = rule.getResultTagName();
			int type = rule.getType();
			int requestType = rule.getRequestMethod();
			
			//通过Jsoup请求连接
			Connection conn = Jsoup.connect(url);
			
			//设置查询参数
			if(params !=null){
				for(int i =0;i<params.length;i++){
					conn.data(params[i],values[i]);
				}
			}else{
				System.out.println("请输入关键字");
			}
			
			//设置请求类型
			Document doc = null;
			switch(requestType){
			case Rule.GET:
				doc = conn.timeout(1000000).get();
				break;
			case Rule.POST:
				doc = conn.timeout(1000000).post();
				break;
			}
			
			//处理返回数据
			Elements results = new Elements();
			switch(type){
			case Rule.CLASS:
				results = doc.getElementsByClass(resultTagName);
				break;
			case Rule.ID:
				Element result = doc.getElementById(resultTagName);
				break;
			case Rule.SELECTION:
				results = doc.select(resultTagName);
				break;
			default:
				//当resultTagName为空时默认去body标签
				if(TextUtil.isEmpty(resultTagName)){
					results = doc.getElementsByTag("body");
				}
			}
			
			for(Element result : results){
				Elements links = result.getElementsByTag("a");
				for(Element link : links){
					//必要的筛选
					String href = link.attr("href");
					String title = link.text();
					
//					//对非新闻链接和非新闻标题进行过滤
//					if((title == null) || title.contains("百度快照")){
//						continue;
//					}
//					
//					if(title.contains("条相同新闻")){
//						//使用正则表达式从字符串中取出数字
//						String regEx="[^0-9]";   
//						Pattern p = Pattern.compile(regEx);   
//						Matcher m = p.matcher(title);   
//						String count = m.replaceAll("").trim();
//						
//						linkData = new BaiduNewsEntity();
//						linkData.setSameNum(count);
//						linkDatas.add(linkData);
//						continue;
//					}
//					else{
//						String count="0";
//						BaiduNewsEntity	countData = new BaiduNewsEntity();
//						countData.setSameNum(count);
//						linkDatas.add(linkData);
//					}
//					
					linkData = new BaiduNewsEntity();
					linkData.setHref(href);
					linkData.setTitle(title);
					
					
					linkDatas.add(linkData);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return linkDatas;
		
	}
	
	/**
	 * 对传入的参数进行必要的校验
	 */
	private static void validateRule(Rule rule)
	{
		String url = rule.getUrl();
		if (TextUtil.isEmpty(url))
		{
			throw new RuleException("url不能为空！");
		}
		if (!url.startsWith("http://"))
		{
			throw new RuleException("url的格式不正确！");
		}

		if (rule.getParams() != null && rule.getValues() != null)
		{
			if (rule.getParams().length != rule.getValues().length)
			{
				throw new RuleException("参数的键值对个数不匹配！");
			}
		}

	}
	
	
}
