package com.wongsir.newsgathering.gather.commons;

import com.wongsir.newsgathering.model.async.Task;
import com.wongsir.newsgathering.model.commons.SpiderInfo;

import us.codecraft.webmagic.Page;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
@FunctionalInterface
public interface PageConsumer {
    void accept(Page page, SpiderInfo info, Task task);
}
