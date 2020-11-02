package com.bgs.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

public class RelationCompDept {

    private Integer  reId;
    private Integer  departmentId;
    private Integer  reDeptid;      //部门外键
    private Integer  reRoleid;      //角色外键

    private String  companyName;   //公司名称
    private String  departmentName;     //部门名称
    private Integer  departmentPid;    //PID

    private List<RelationCompDept> childList = new ArrayList<>();

    public Integer getReId() {
        return reId;
    }

    public void setReId(Integer reId) {
        this.reId = reId;
    }

    public Integer getReDeptid() {
        return reDeptid;
    }

    public void setReDeptid(Integer reDeptid) {
        this.reDeptid = reDeptid;
    }

    public Integer getReRoleid() {
        return reRoleid;
    }

    public void setReRoleid(Integer reRoleid) {
        this.reRoleid = reRoleid;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public Integer getDepartmentPid() {
        return departmentPid;
    }

    public void setDepartmentPid(Integer departmentPid) {
        this.departmentPid = departmentPid;
    }

    public List<RelationCompDept> getChildList() {
        return childList;
    }

    public void setChildList(List<RelationCompDept> childList) {
        this.childList = childList;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    @Override
    public String toString() {
        return "RelationCompDept{" +
                "reId=" + reId +
                ", departmentId=" + departmentId +
                ", reDeptid=" + reDeptid +
                ", reRoleid=" + reRoleid +
                ", departmentName='" + departmentName + '\'' +
                ", companyName='" + companyName + '\'' +
                ", departmentPid=" + departmentPid +
                ", childList=" + childList +
                '}';
    }
}
