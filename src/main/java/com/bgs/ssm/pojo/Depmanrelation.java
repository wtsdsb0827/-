package com.bgs.ssm.pojo;
/*
    部门、厂商、地区关系表
 */
public class Depmanrelation {


    private Integer  depmanrelationId;
    private Integer  deptId;
    private Integer  mantId;
    private Integer  proId;


    public Integer getDepmanrelationId() {
        return depmanrelationId;
    }

    public void setDepmanrelationId(Integer depmanrelationId) {
        this.depmanrelationId = depmanrelationId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getMantId() {
        return mantId;
    }

    public void setMantId(Integer mantId) {
        this.mantId = mantId;
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }
}
