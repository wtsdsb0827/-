package com.bgs.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

/*
    关系表
 */
public class Relation {

    private Integer  relationId;
    private Integer  permissionId;  //菜单表ID
    private String  relationState;  //关系表权限
    private Integer  roleId;    //角色ID


    private Integer permissionPid;
    private String  permissionName; //菜单名
    private String  permissonUrl;   //跳转路径

    private List<Relation> childList = new ArrayList<>();   //子节点

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getRelationState() {
        return relationState;
    }

    public void setRelationState(String relationState) {
        this.relationState = relationState;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionPid() {
        return permissionPid;
    }

    public void setPermissionPid(Integer permissionPid) {
        this.permissionPid = permissionPid;
    }

    public List<Relation> getChildList() {
        return childList;
    }

    public void setChildList(List<Relation> childList) {
        this.childList = childList;
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




    @Override
    public String toString() {
        return "Relation{" +
                "relationId=" + relationId +
                ", permissionId=" + permissionId +
                ", relationState='" + relationState + '\'' +
                ", roleId=" + roleId +
                ", permissionPid=" + permissionPid +
                ", permissionName='" + permissionName + '\'' +
                ", permissonUrl='" + permissonUrl + '\'' +
                ", childList=" + childList +
                '}';
    }
}
