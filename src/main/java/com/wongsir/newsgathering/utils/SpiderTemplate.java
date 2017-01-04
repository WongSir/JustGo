package com.wongsir.newsgathering.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/** 
* @Description: 通过加载json文件读取爬虫模板进行抓取信息 
* @author Wongsir
* @date 2017年1月4日 下午4:28:52 
*  
*/
public class SpiderTemplate {
	private Logger LOG = LogManager.getLogger(SpiderTemplate.class);
	String spiderInfoJson;
	public String jsonFileTemplate(int code){
		
		LOG.debug("正在读取爬虫模板");
    	try {
    		//根据前台传入的code进行业务逻辑处理
    		if(code==1){
    			spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
    					.getResource("/template/news.qq.com_time_autodetect.json").getFile()));
    		}else if(code==2){
    			spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
    					.getResource("/template/www.chinanews.com.json").getFile()));
    		}else if(code==3){
    			spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
    					.getResource("/template/www.oschina.net.json").getFile()));
    		}else if(code==4){
    			spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
    					.getResource("/template/www.shicimingju.com.json").getFile()));
    		}else{
    			spiderInfoJson = FileUtils.readFileToString(new File(this.getClass().getClassLoader()
    					.getResource("/template/news.qq.com.json").getFile()));
    		}
    		
		} catch (IOException e) {
			 LOG.fatal("初始化爬虫模板失败," + e.getLocalizedMessage());
	         e.printStackTrace();
		}
    	LOG.debug("spiderTemplate初始化成功," + this);
		return spiderInfoJson;
	}
	
}
