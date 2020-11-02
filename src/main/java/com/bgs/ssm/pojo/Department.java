package com.bgs.ssm.pojo;

public class Department {

    private Integer  departmentId;
    private String  departmentName;
    private String  departmentPhone;
    private Integer  departmentPid;
    private Integer  departmentCity;
    private Integer  departmentArea;
    private String  departmentAddress;
    private String  departmentSevicelist;
    private String  departmentHeaddepartment;
    private String  departmentState;
    private String  departmentBusinesscenter;

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentPhone() {
        return departmentPhone;
    }

    public void setDepartmentPhone(String departmentPhone) {
        this.departmentPhone = departmentPhone;
    }

    public Integer getDepartmentPid() {
        return departmentPid;
    }

    public void setDepartmentPid(Integer departmentPid) {
        this.departmentPid = departmentPid;
    }

    public Integer getDepartmentCity() {
        return departmentCity;
    }

    public void setDepartmentCity(Integer departmentCity) {
        this.departmentCity = departmentCity;
    }

    public Integer getDepartmentArea() {
        return departmentArea;
    }

    public void setDepartmentArea(Integer departmentArea) {
        this.departmentArea = departmentArea;
    }

    public String getDepartmentAddress() {
        return departmentAddress;
    }

    public void setDepartmentAddress(String departmentAddress) {
        this.departmentAddress = departmentAddress;
    }

    public String getDepartmentSevicelist() {
        return departmentSevicelist;
    }

    public void setDepartmentSevicelist(String departmentSevicelist) {
        this.departmentSevicelist = departmentSevicelist;
    }

    public String getDepartmentHeaddepartment() {
        return departmentHeaddepartment;
    }

    public void setDepartmentHeaddepartment(String departmentHeaddepartment) {
        this.departmentHeaddepartment = departmentHeaddepartment;
    }

    public String getDepartmentState() {
        return departmentState;
    }

    public void setDepartmentState(String departmentState) {
        this.departmentState = departmentState;
    }

    public String getDepartmentBusinesscenter() {
        return departmentBusinesscenter;
    }

    public void setDepartmentBusinesscenter(String departmentBusinesscenter) {
        this.departmentBusinesscenter = departmentBusinesscenter;
    }

    @Override
    public String toString() {
        return "Department{" +
                "departmentId=" + departmentId +
                ", departmentName='" + departmentName + '\'' +
                ", departmentPhone='" + departmentPhone + '\'' +
                ", departmentPid=" + departmentPid +
                ", departmentCity=" + departmentCity +
                ", departmentArea=" + departmentArea +
                ", departmentAddress='" + departmentAddress + '\'' +
                ", departmentSevicelist='" + departmentSevicelist + '\'' +
                ", departmentHeaddepartment='" + departmentHeaddepartment + '\'' +
                ", departmentState='" + departmentState + '\'' +
                ", departmentBusinesscenter='" + departmentBusinesscenter + '\'' +
                '}';
    }
}
