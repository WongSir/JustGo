package com.wongsir.newsgathering.model.async;

/** 
* @Description:  
* @author Wongsir
* @date 2017年1月4日 下午4:41:50 
*  
*/
public class CallbackMsg extends BaseMsg {

    public CallbackMsg(String clientId) {
        super(clientId);
        this.setType(MsgType.CALLBACK);
    }
}
