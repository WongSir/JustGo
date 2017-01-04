package com.wongsir.newsgathering.dao;

import org.springframework.stereotype.Component;

import com.wongsir.newsgathering.model.commons.Webpage;

import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.PageModelPipeline;

/** 
* @Description: mysql数据库
* @author Wongsir
* @date 2017年1月4日
*  
*/
@Component("CommonWebpageMysqlPipeline")
public class CommonWebpageMysqlPipeline implements PageModelPipeline<Webpage>{


	@Override
	public void process(Webpage t, Task task) {
		// TODO Auto-generated method stub
		
	}

}
