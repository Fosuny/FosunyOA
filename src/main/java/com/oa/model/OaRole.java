package com.oa.model;

//角色表
public class OaRole {

    private Integer roleId;
    private String roleName;
    private String roleNickname;
    private String roleDescription;
    private Integer roleStatus;

    public String getRoleNickname() {
        return roleNickname;
    }

    public void setRoleNickname(String roleNickname) {
        this.roleNickname = roleNickname;
    }

    public Integer getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(Integer roleStatus) {
        this.roleStatus = roleStatus;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }

    @Override
    public String toString() {
        return "OaRole{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", roleNickname='" + roleNickname + '\'' +
                ", roleDescription='" + roleDescription + '\'' +
                ", roleStatus=" + roleStatus +
                '}';
    }
}
