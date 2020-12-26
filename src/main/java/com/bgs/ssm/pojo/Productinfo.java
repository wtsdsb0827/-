package com.bgs.ssm.pojo;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/*
    品类信息表
 */
public class Productinfo {

    private int productinfoId;
    private String productinfoType;        //产品类型（品类）
    private String productinfoSecond;      //二级产品品类
    private String productinfoGroup;      //商品组
    private String productinfoState;      //产品状态


    private Integer productinfoTyper;        //产品类型（品类）
    private Integer productinfoSeconder;      //二级产品品类
    private Integer productinfoGrouper;      //商品组


    public Integer getProductinfoTyper() {
        return productinfoTyper;
    }

    public void setProductinfoTyper(Integer productinfoTyper) {
        this.productinfoTyper = productinfoTyper;
    }

    public Integer getProductinfoSeconder() {
        return productinfoSeconder;
    }

    public void setProductinfoSeconder(Integer productinfoSeconder) {
        this.productinfoSeconder = productinfoSeconder;
    }

    public Integer getProductinfoGrouper() {
        return productinfoGrouper;
    }

    public void setProductinfoGrouper(Integer productinfoGrouper) {
        this.productinfoGrouper = productinfoGrouper;
    }

    public String getProductinfoState() {
        return productinfoState;
    }

    public void setProductinfoState(String productinfoState) {
        this.productinfoState = productinfoState;
    }

    public int getProductinfoId() {
        return productinfoId;
    }

    public void setProductinfoId(int productinfoId) {
        this.productinfoId = productinfoId;
    }

    public String getProductinfoType() {
        return productinfoType;
    }

    public void setProductinfoType(String productinfoType) {
        this.productinfoType = productinfoType;
    }

    public String getProductinfoSecond() {
        return productinfoSecond;
    }

    public void setProductinfoSecond(String productinfoSecond) {
        this.productinfoSecond = productinfoSecond;
    }

    public String getProductinfoGroup() {
        return productinfoGroup;
    }

    public void setProductinfoGroup(String productinfoGroup) {
        this.productinfoGroup = productinfoGroup;
    }

}
