package com.wongsir.newsgathering.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;

/** 
* @Description: TODO 
* @author Wongsir
* @date 2017年1月4日 下午4:35:03 
*  
*/
@Component
public interface NLPExtractor {
	/**
     * 抽取命名实体
     *
     * @param content 文章正文
     * @return map的key是一下三种nr, ns, nt  其value就是对应的词表
     */
    Map<String, Set<String>> extractNamedEntity(String content);

    /**
     * 抽取摘要
     *
     * @param content 文章正文
     * @return 摘要句子列表
     */
    List<String> extractSummary(String content);

    /**
     * 抽取关键词
     *
     * @param content 文章正文
     * @return 关键词列表
     */
    List<String> extractKeywords(String content);
}
