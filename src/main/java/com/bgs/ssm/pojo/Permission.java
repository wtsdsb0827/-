package com.bgs.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

/*
    菜单表
 */
public class Permission {
    private Integer permissionId;  //菜单ID
    private String permissionName; //菜单名
    private String permissonUrl;   //跳转路径
    private Integer permissionPid; //父ID

    private List<Permission> childList = new ArrayList<>();

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getPermissonUrl() {
        return permissonUrl;
    }

    public void setPermissonUrl(String permissonUrl) {
        this.permissonUrl = permissonUrl;
    }

    public Integer getPermissionPid() {
        return permissionPid;
    }

    public void setPermissionPid(Integer permissionPid) {
        this.permissionPid = permissionPid;
    }


    public List<Permission> getChildList() {
        return childList;
    }

    public void setChildList(List<Permission> childList) {
        this.childList = childList;
    }


    @Override
    public String toString() {
        return "Permission{" +
                "permissionId=" + permissionId +
                ", permissionName='" + permissionName + '\'' +
                ", permissonUrl='" + permissonUrl + '\'' +
                ", permissionPid=" + permissionPid +
                ", childList=" + childList +
                '}';
    }
}
