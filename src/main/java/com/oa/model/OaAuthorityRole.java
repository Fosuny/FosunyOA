package com.oa.model;

//权限和角色关联表
public class OaAuthorityRole {

    private Integer authorityRoleId;
    private Integer roleId;
    private Integer authorityId;

    public Integer getAuthorityRoleId() {
        return authorityRoleId;
    }

    public void setAuthorityRoleId(Integer authorityRoleId) {
        this.authorityRoleId = authorityRoleId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    @Override
    public String toString() {
        return "OaAuthorityRole{" +
                "authorityRoleId=" + authorityRoleId +
                ", roleId=" + roleId +
                ", authorityId=" + authorityId +
                '}';
    }
}
