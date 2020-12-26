package com.bgs.ssm.pojo;

/*
    用户角色关系表
 */
public class Urelation {

    private int urelationId;
    private int uid;
    private int rid;


    public int getUrelationId() {
        return urelationId;
    }

    public void setUrelationId(int urelationId) {
        this.urelationId = urelationId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }
}
