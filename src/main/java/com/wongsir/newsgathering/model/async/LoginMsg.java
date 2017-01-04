package com.wongsir.newsgathering.model.async;

/** 
* @Description: 
* @author Wongsir
* @date 2017年1月4日 下午4:43:27 
*  
*/
public class LoginMsg extends BaseMsg {

    public LoginMsg(String clientId) {
        super(clientId);
        this.setType(MsgType.LOGIN);
    }
}
