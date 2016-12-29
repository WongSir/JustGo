package com.gs.spider.dao;

import org.springframework.stereotype.Component;

import com.gs.spider.model.commons.Webpage;

import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.PageModelPipeline;

/** 
* @Description: mysql数据库
* @author Wongsir
* @date 2016年12月6日 下午6:09:17 
*  
*/
@Component("CommonWebpageMysqlPipeline")
public class CommonWebpageMysqlPipeline implements PageModelPipeline<Webpage>{


	@Override
	public void process(Webpage t, Task task) {
		// TODO Auto-generated method stub
		
	}

}
