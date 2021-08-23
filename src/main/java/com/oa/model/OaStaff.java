package com.oa.model;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//职工表
public class OaStaff {

    private Integer staffId;
    private String staffName;
    private Integer staffSex;
    private Integer staffAge;
    private Integer staffWorkage;
    @JSONField(format = "yyyy-MM-dd")
    private Date staffBirthday;
    private String staffPhone;
    private String staffQq;
    private String staffWechat;
    private String staffMailbox;
    private String staffAddress;
    @JSONField(format = "yyyy-MM-dd")
    private Date staffEntrydate;
    @JSONField(format = "yyyy-MM-dd")
    private Date staffResignation;
    private Integer staffStatus;
    private String staffUsersId;
    private String count;

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public Integer getStaffSex() {
        return staffSex;
    }

    public void setStaffSex(Integer staffSex) {
        this.staffSex = staffSex;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public Integer getStaffAge() {
        return staffAge;
    }

    public void setStaffAge(Integer staffAge) {
        this.staffAge = staffAge;
    }

    public Integer getStaffWorkage() {
        return staffWorkage;
    }

    public void setStaffWorkage(Integer staffWorkage) {
        this.staffWorkage = staffWorkage;
    }

    public Date getStaffBirthday() {
        return staffBirthday;
    }

    public void setStaffBirthday(Date staffBirthday) {
        this.staffBirthday = staffBirthday;
    }

    public String getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

    public String getStaffQq() {
        return staffQq;
    }

    public void setStaffQq(String staffQq) {
        this.staffQq = staffQq;
    }

    public String getStaffWechat() {
        return staffWechat;
    }

    public void setStaffWechat(String staffWechat) {
        this.staffWechat = staffWechat;
    }

    public String getStaffMailbox() {
        return staffMailbox;
    }

    public void setStaffMailbox(String staffMailbox) {
        this.staffMailbox = staffMailbox;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public Date getStaffEntrydate() {
        return staffEntrydate;
    }

    public void setStaffEntrydate(Date staffEntrydate) {
        this.staffEntrydate = staffEntrydate;
    }

    public Date getStaffResignation() {
        return staffResignation;
    }

    public void setStaffResignation(Date staffResignation) {
        this.staffResignation = staffResignation;
    }

    public Integer getStaffStatus() {
        return staffStatus;
    }

    public void setStaffStatus(Integer staffStatus) {
        this.staffStatus = staffStatus;
    }

    public String getStaffUsersId() {
        return staffUsersId;
    }

    public void setStaffUsersId(String staffUsersId) {
        this.staffUsersId = staffUsersId;
    }

    @Override
    public String toString() {
        return "OaStaff{" +
                "staffId=" + staffId +
                ", staffName='" + staffName + '\'' +
                ", staffSex=" + staffSex +
                ", staffAge=" + staffAge +
                ", staffWorkage=" + staffWorkage +
                ", staffBirthday=" + staffBirthday +
                ", staffPhone='" + staffPhone + '\'' +
                ", staffQq='" + staffQq + '\'' +
                ", staffWechat='" + staffWechat + '\'' +
                ", staffMailbox='" + staffMailbox + '\'' +
                ", staffAddress='" + staffAddress + '\'' +
                ", staffEntrydate=" + staffEntrydate +
                ", staffResignation=" + staffResignation +
                ", staffStatus=" + staffStatus +
                ", staffUsersId='" + staffUsersId + '\'' +
                ", count='" + count + '\'' +
                '}';
    }

}
