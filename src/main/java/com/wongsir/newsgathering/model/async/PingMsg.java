package com.wongsir.newsgathering.model.async;

/** 
* @Description: 
* @author Wongsir
* @date 2017年1月4日
*  
*/
public class PingMsg extends InfoMsg {
    public PingMsg(String clientId) {
        super(clientId);
        this.setType(MsgType.PING);
    }
}
