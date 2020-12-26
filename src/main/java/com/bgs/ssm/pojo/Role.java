package com.bgs.ssm.pojo;

/*
    角色表
 */
public class Role {
    private int roleId;
    private String roleName;    //角色名
    private String userName;    //用户名
    private String roleKind;    //角色类型


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRoleKind() {
        return roleKind;
    }

    public void setRoleKind(String roleKind) {
        this.roleKind = roleKind;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }


}
