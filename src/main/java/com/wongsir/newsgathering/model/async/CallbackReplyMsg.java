package com.wongsir.newsgathering.model.async;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/** 
* @Description: 
* @author Wongsir
* @date 2017年1月4日 下午4:42:27 
*  
*/
public class CallbackReplyMsg extends InfoMsg {
    private Logger LOG = LogManager.getLogger(CallbackReplyMsg.class);

    public CallbackReplyMsg(String clientId) {
        super(clientId);
        this.setType(MsgType.CALLBACK_REPLY);
    }
}
