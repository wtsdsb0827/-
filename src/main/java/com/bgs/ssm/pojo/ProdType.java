package com.bgs.ssm.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*
    品类表
 */
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
public class ProdType implements Serializable {

    private Integer prodtypeId;
    private Integer prodtypePid;
    private String prodtypeName;   //品类名
    private Integer prodtypeIdTwo;       //将添加的二级品类的自增ID赋值给该属性


    private Integer conId;
    private String conReason;      //取消原因
    private String conState;      //取消原因


    private Integer repairId;
    private String repairDoing;//维修措施
    private String repairKind; //维修措施类型
    private String repairClass;//维修措施大类
    private String repairState;//服务单信息状态


    private Integer visitId;       //回访内容ID
    private String visitName;      //回访内容名称
    private String visitState;     //回访内容状态


    private List<ProdType> childList = null;       //存储子节点


    @Override
    public String toString() {
        return "ProdType{" +
                "prodtypeId=" + prodtypeId +
                ", prodtypePid=" + prodtypePid +
                ", prodtypeName='" + prodtypeName + '\'' +
                ", conId=" + conId +
                ", conReason='" + conReason + '\'' +
                ", conState='" + conState + '\'' +
                ", repairId=" + repairId +
                ", repairDoing='" + repairDoing + '\'' +
                ", repairKind='" + repairKind + '\'' +
                ", repairClass='" + repairClass + '\'' +
                ", repairState='" + repairState + '\'' +
                ", visitId=" + visitId +
                ", visitName='" + visitName + '\'' +
                ", visitState='" + visitState + '\'' +
                '}';
    }


    public Integer getProdtypeIdTwo() {
        return prodtypeIdTwo;
    }

    public void setProdtypeIdTwo(Integer prodtypeIdTwo) {
        this.prodtypeIdTwo = prodtypeIdTwo;
    }

    public List<ProdType> getChildList() {
        return childList;
    }

    public void setChildList(List<ProdType> childList) {
        this.childList = childList;
    }

    public String getConState() {
        return conState;
    }

    public void setConState(String conState) {
        this.conState = conState;
    }

    public Integer getRepairId() {
        return repairId;
    }

    public void setRepairId(Integer repairId) {
        this.repairId = repairId;
    }

    public String getRepairDoing() {
        return repairDoing;
    }

    public void setRepairDoing(String repairDoing) {
        this.repairDoing = repairDoing;
    }

    public String getRepairKind() {
        return repairKind;
    }

    public void setRepairKind(String repairKind) {
        this.repairKind = repairKind;
    }

    public String getRepairClass() {
        return repairClass;
    }

    public void setRepairClass(String repairClass) {
        this.repairClass = repairClass;
    }

    public String getRepairState() {
        return repairState;
    }

    public void setRepairState(String repairState) {
        this.repairState = repairState;
    }

    public Integer getVisitId() {
        return visitId;
    }

    public void setVisitId(Integer visitId) {
        this.visitId = visitId;
    }

    public String getVisitState() {
        return visitState;
    }

    public void setVisitState(String visitState) {
        this.visitState = visitState;
    }

    public String getVisitName() {
        return visitName;
    }

    public void setVisitName(String visitName) {
        this.visitName = visitName;
    }

    public Integer getConId() {
        return conId;
    }

    public void setConId(Integer conId) {
        this.conId = conId;
    }

    public Integer getProdtypeId() {
        return prodtypeId;
    }

    public void setProdtypeId(Integer prodtypeId) {
        this.prodtypeId = prodtypeId;
    }

    public Integer getProdtypePid() {
        return prodtypePid;
    }

    public void setProdtypePid(Integer prodtypePid) {
        this.prodtypePid = prodtypePid;
    }

    public String getProdtypeName() {
        return prodtypeName;
    }

    public void setProdtypeName(String prodtypeName) {
        this.prodtypeName = prodtypeName;
    }

    public String getConReason() {
        return conReason;
    }

    public void setConReason(String conReason) {
        this.conReason = conReason;
    }


}
