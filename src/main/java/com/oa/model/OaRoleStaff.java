package com.oa.model;

//角色和职工关联表
public class OaRoleStaff {

    private Integer staffRoleId;
    private Integer roleId;
    private Integer staffId;

    public Integer getStaffRoleId() {
        return staffRoleId;
    }

    public void setStaffRoleId(Integer staffRoleId) {
        this.staffRoleId = staffRoleId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    @Override
    public String toString() {
        return "OaRoleStaff{" +
                "staffRoleId=" + staffRoleId +
                ", roleId=" + roleId +
                ", staffId=" + staffId +
                '}';
    }
}
