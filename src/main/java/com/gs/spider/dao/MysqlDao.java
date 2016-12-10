package com.gs.spider.dao;

import com.gs.spider.model.commons.Webpage;

/** 
* @Description: TODO 
* @author Wongsir
* @date 2016年12月6日 下午6:27:31 
*  
*/
public interface MysqlDao {

//	@Insert("insert into")
	public int add(Webpage pageEntity);
}
