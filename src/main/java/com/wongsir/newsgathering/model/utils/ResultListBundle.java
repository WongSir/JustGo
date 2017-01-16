package com.wongsir.newsgathering.model.utils;

import java.util.Collection;
import java.util.LinkedList;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
public class ResultListBundle<T> extends ResultBundle<T> {
    /**
     * 结果
     */
    private Collection<T> resultList;

    public ResultListBundle(Collection<T> resultList, String keyword, long time) {
        this.resultList = resultList;
        this.keyword = keyword;
        this.time = time;
        this.count = resultList.size();
        this.success = true;
    }

    public ResultListBundle(String keyword, long time, boolean success, String errorMsg) {
        resultList = new LinkedList<>();
        this.success = success;
        this.errorMsg = errorMsg;
        this.keyword = keyword;
        this.time = time;
        this.count = 0;
    }

    public Collection<T> getResultList() {
        return resultList;
    }

    public void setResultList(Collection<T> resultList) {
        this.resultList = resultList;
    }

    @Override
    public String toString() {
        return "ResultListBundle{" +
                "resultList=" + resultList +
                '}';
    }
}