package com.gs.spider.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/** 
* @Description: 通过加载json文件读取爬虫模板进行抓取信息 
* @author Wongsir
* @date 2016年12月21日 下午3:45:19 
*  
*/
public class SpiderTemplate {
	private Logger LOG = LogManager.getLogger(SpiderTemplate.class);
	String spiderInfoJson;
	public String jsonFileTemplate(){
		LOG.debug("正在读取爬虫模板");
    	try {
    		spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
					.getResource("/template/news.qq.com.json").getFile()));
		} catch (IOException e) {
			 LOG.fatal("初始化爬虫模板失败," + e.getLocalizedMessage());
	         e.printStackTrace();
		}
    	LOG.debug("spiderTemplate初始化成功," + this);
		return spiderInfoJson;
	}
	
}
