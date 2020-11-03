package com.bgs.ssm.pojo;

public class Brand {

    private Integer  brandId;
    private String  brandName;
    private String  brandState;
    private Integer  roleId;

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandState() {
        return brandState;
    }

    public void setBrandState(String brandState) {
        this.brandState = brandState;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }


    @Override
    public String toString() {
        return "Brand{" +
                "brandId=" + brandId +
                ", brandName='" + brandName + '\'' +
                ", brandState='" + brandState + '\'' +
                ", roleId=" + roleId +
                '}';
    }
}
