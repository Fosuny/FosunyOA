package com.oa.model;

import java.util.Date;

//权限表
public class OaAuthority {

    private Integer authorityId;
    private String authorityUrl;
    private String authorityList;
    private Integer authorityLevel;
    private String authorityPermission;
    private String authorityListswitch;
    private Boolean open;
    private Boolean isparent;
    private Integer pId;
    private Date update;
    private String type;
    private Boolean checked;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Date getUpdate() {
        return update;
    }

    public void setUpdate(Date update) {
        this.update = update;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public Boolean getIsparent() {
        return isparent;
    }

    public void setIsparent(Boolean isparent) {
        this.isparent = isparent;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getAuthorityPermission() {
        return authorityPermission;
    }

    public void setAuthorityPermission(String authorityPermission) {
        this.authorityPermission = authorityPermission;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    public String getAuthorityUrl() {
        return authorityUrl;
    }

    public void setAuthorityUrl(String authorityUrl) {
        this.authorityUrl = authorityUrl;
    }

    public String getAuthorityList() {
        return authorityList;
    }

    public void setAuthorityList(String authorityList) {
        this.authorityList = authorityList;
    }

    public Integer getAuthorityLevel() {
        return authorityLevel;
    }

    public void setAuthorityLevel(Integer authorityLevel) {
        this.authorityLevel = authorityLevel;
    }

    public String getAuthorityListswitch() {
        return authorityListswitch;
    }

    public void setAuthorityListswitch(String authorityListswitch) {
        this.authorityListswitch = authorityListswitch;
    }

    @Override
    public String toString() {
        return "OaAuthority{" +
                "authorityId='" + authorityId + '\'' +
                ", authorityUrl='" + authorityUrl + '\'' +
                ", authorityList='" + authorityList + '\'' +
                ", authorityLevel=" + authorityLevel +
                ", authorityPermission='" + authorityPermission + '\'' +
                ", authorityListswitch='" + authorityListswitch + '\'' +
                ", open=" + open +
                ", isparent=" + isparent +
                ", pId='" + pId + '\'' +
                ", update=" + update +
                ", type='" + type + '\'' +
                ", checked=" + checked +
                '}';
    }
}
