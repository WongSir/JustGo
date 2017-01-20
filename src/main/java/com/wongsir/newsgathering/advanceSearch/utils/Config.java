package com.wongsir.newsgathering.advanceSearch.utils;

import java.io.FileNotFoundException;
import java.io.InputStream;

/** 
* @Description: TODO 
* @author hjd
* @date 2017年1月19日 上午9:53:35 
*  
*/
public class Config {
	public static Rule defaultRule=null;

    static{

        InputStream is = Rule.class.getResourceAsStream("/rule.json");
        defaultRule=Rule.createFromInputStream(is);
    }
}
