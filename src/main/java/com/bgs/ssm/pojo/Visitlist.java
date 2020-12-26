package com.bgs.ssm.pojo;

/*
    回访单表
 */
public class Visitlist {
    private Integer visitId;
    private String visitName;
    private Integer prodtypeId;
    private String visitState;


    public Integer getVisitId() {
        return visitId;
    }

    public void setVisitId(Integer visitId) {
        this.visitId = visitId;
    }

    public String getVisitName() {
        return visitName;
    }

    public void setVisitName(String visitName) {
        this.visitName = visitName;
    }

    public Integer getProdtypeId() {
        return prodtypeId;
    }

    public void setProdtypeId(Integer prodtypeId) {
        this.prodtypeId = prodtypeId;
    }

    public String getVisitState() {
        return visitState;
    }

    public void setVisitState(String visitState) {
        this.visitState = visitState;
    }

    @Override
    public String toString() {
        return "Visitlist{" +
                "visitId=" + visitId +
                ", visitName='" + visitName + '\'' +
                ", prodtypeId=" + prodtypeId +
                ", visitState='" + visitState + '\'' +
                '}';
    }
}
