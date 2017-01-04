package com.wongsir.newsgathering.model.utils;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
@FunctionalInterface
public interface MySupplier<T> {

    /**
     * Gets a result.
     *
     * @return a result
     */
    T get() throws Exception;
}
