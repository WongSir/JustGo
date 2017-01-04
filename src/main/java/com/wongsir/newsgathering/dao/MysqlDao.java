package com.wongsir.newsgathering.dao;

import com.wongsir.newsgathering.model.commons.Webpage;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
public interface MysqlDao {

//	@Insert("insert into")
	public int add(Webpage pageEntity);
}
