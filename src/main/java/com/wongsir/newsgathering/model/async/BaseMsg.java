package com.wongsir.newsgathering.model.async;

import java.io.Serializable;

/** 
* @Description: 
* @author Wongsir
* @date 2017年1月4日 下午4:41:20 
*  
*/
public abstract class BaseMsg implements Serializable {
    protected static final long serialVersionUID = 1L;
    private MsgType type;
    //必须唯一，否者会出现channel调用混乱
    private String clientId;

    //初始化客户端id
    public BaseMsg(String clientId) {
        this.clientId = clientId;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public MsgType getType() {
        return type;
    }

    public void setType(MsgType type) {
        this.type = type;
    }
}
