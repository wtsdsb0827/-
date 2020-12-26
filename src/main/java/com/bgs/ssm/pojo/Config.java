package com.bgs.ssm.pojo;

/*
    服务单信息表
 */
public class Config {

    private Integer conId;
    private String conReason;      //取消原因
    private String conRepair;      //维修措施
    private String conRepairkind;      //维修措施类型
    private String conRepairclass;     //维修措施大类
    private String conState;         //回访状态
    private Integer prodtypeId;        //品类表外键

    public Integer getConId() {
        return conId;
    }

    public void setConId(Integer conId) {
        this.conId = conId;
    }

    public String getConReason() {
        return conReason;
    }

    public void setConReason(String conReason) {
        this.conReason = conReason;
    }


    public String getConRepair() {
        return conRepair;
    }

    public void setConRepair(String conRepair) {
        this.conRepair = conRepair;
    }

    public String getConRepairkind() {
        return conRepairkind;
    }

    public void setConRepairkind(String conRepairkind) {
        this.conRepairkind = conRepairkind;
    }

    public String getConRepairclass() {
        return conRepairclass;
    }

    public void setConRepairclass(String conRepairclass) {
        this.conRepairclass = conRepairclass;
    }

    public String getConState() {
        return conState;
    }

    public void setConState(String conState) {
        this.conState = conState;
    }

    public Integer getProdtypeId() {
        return prodtypeId;
    }

    public void setProdtypeId(Integer prodtypeId) {
        this.prodtypeId = prodtypeId;
    }

    @Override
    public String toString() {
        return "Config{" +
                "conId=" + conId +
                ", conReason='" + conReason + '\'' +
                ", conRepair='" + conRepair + '\'' +
                ", conRepairkind='" + conRepairkind + '\'' +
                ", conRepairclass='" + conRepairclass + '\'' +
                ", conState='" + conState + '\'' +
                ", prodtypeId=" + prodtypeId +
                '}';
    }
}
