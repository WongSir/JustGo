package com.wongsir.newsgathering.model.async;

/** 
* @Description: 
* @author Wongsir
* @date 2017年1月4日 下午4:42:50 
*  
*/
public class InfoMsg extends BaseMsg {
    private String info;

    public InfoMsg(String clientId) {
        super(clientId);
        this.setType(MsgType.INFO);
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
