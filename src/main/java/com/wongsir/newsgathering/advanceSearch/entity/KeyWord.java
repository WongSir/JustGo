package com.wongsir.newsgathering.advanceSearch.entity;

/** 
* @Description: 关键字实体类 
* @author hjd
* @date 2017年1月19日 下午2:02:50 
*  
*/
public class KeyWord {
	private String keyWord;
	
	public KeyWord(){
		
	}
	
	public KeyWord(String key){
		this.keyWord = key;
	}

	public String getKey() {
		return keyWord;
	}

	public void setKey(String key) {
		this.keyWord = key;
	}

	@Override
	public String toString() {
		return "KeyWord [key=" + keyWord + "]";
	}
	
}
