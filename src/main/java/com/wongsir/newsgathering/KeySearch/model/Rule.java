package com.wongsir.newsgathering.KeySearch.model;

/** 
* @Description: 规则实体类，用于指定查询所需的参数，如url,method,params等 
* @author Wongsir
* @date 2017年1月5日 
*  
*/
public class Rule {
	
	public final static int GET = 0 ;
	public final static int POST = 1 ;
	

	public final static int CLASS = 0;
	public final static int ID = 1;
	public final static int SELECTION = 2;
	
	private String url;//链接
	private String[] params;//参数集合
	private String[] values;//参数对应的值
	private String resultTagName;//对返回的Html，第一次过滤所用的标签，请先设置type。
	/**
	 * class / id /selection
	 * 设置resultTagName的类型，默认为ID
	 */
	private int type = ID;
	/**
	 * GET / POST
	 * 请求的类型，默认GET
	 */
	private int requestMethod = GET ;
	
	public Rule(){
		
	}

	public Rule(String url, String[] params, String[] values, String resultTagName, int type, int requestMethod) {
		super();
		this.url = url;
		this.params = params;
		this.values = values;
		this.resultTagName = resultTagName;
		this.type = type;
		this.requestMethod = requestMethod;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String[] getParams() {
		return params;
	}

	public void setParams(String[] params) {
		this.params = params;
	}

	public String[] getValues() {
		return values;
	}

	public void setValues(String[] values) {
		this.values = values;
	}

	public String getResultTagName() {
		return resultTagName;
	}

	public void setResultTagName(String resultTagName) {
		this.resultTagName = resultTagName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getRequestMethod() {
		return requestMethod;
	}

	public void setRequestMethod(int requestMethod) {
		this.requestMethod = requestMethod;
	}
	
	
}
