package com.wongsir.newsgathering.KeySearch.model;

/** 
* @Description: 通过百度新闻搜索的新闻实体 
* @author Wongsir
* @date 2017年1月5日 
*  
*/
public class BaiduNewsEntity {
	private String title;//新闻标题
	private String href;//网页链接
	private String author;//新闻来源
	private String time;//发布时间
	private String summary;//新闻摘要
	private String sameNum;//相同新闻数量
	private String sameHref;//相同新闻链接
	private String cacheHref;//百度快照链接
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getSameHref() {
		return sameHref;
	}
	public void setSameHref(String sameHref) {
		this.sameHref = sameHref;
	}
	public String getCacheHref() {
		return cacheHref;
	}
	public void setCacheHref(String cacheHref) {
		this.cacheHref = cacheHref;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BaiduNewsEntity [title=" + title + ", href=" + href + ", author=" + author + ", time=" + time
				+ ", summary=" + summary + ", sameNum=" + sameNum + ", sameHref=" + sameHref + ", cacheHref="
				+ cacheHref + "]";
	}
	public String getSameNum() {
		return sameNum;
	}
	public void setSameNum(String sameNum) {
		this.sameNum = sameNum;
	}
	
	
}
