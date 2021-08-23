package com.oa.model;

import java.util.Date;

//用户待办事项表
public class OaUpcoming {

    private Integer upcomingId;
    private String upcomingName;
    private Date upcomingDate;
    private String upcomingDescription;
    private Integer upcomingStatus;

    public Integer getUpcomingId() {
        return upcomingId;
    }

    public void setUpcomingId(Integer upcomingId) {
        this.upcomingId = upcomingId;
    }

    public String getUpcomingName() {
        return upcomingName;
    }

    public void setUpcomingName(String upcomingName) {
        this.upcomingName = upcomingName;
    }

    public Date getUpcomingDate() {
        return upcomingDate;
    }

    public void setUpcomingDate(Date upcomingDate) {
        this.upcomingDate = upcomingDate;
    }

    public String getUpcomingDescription() {
        return upcomingDescription;
    }

    public void setUpcomingDescription(String upcomingDescription) {
        this.upcomingDescription = upcomingDescription;
    }

    public Integer getUpcomingStatus() {
        return upcomingStatus;
    }

    public void setUpcomingStatus(Integer upcomingStatus) {
        this.upcomingStatus = upcomingStatus;
    }

    @Override
    public String toString() {
        return "OaUpcoming{" +
                "upcomingId=" + upcomingId +
                ", upcomingName='" + upcomingName + '\'' +
                ", upcomingDate=" + upcomingDate +
                ", upcomingDescription='" + upcomingDescription + '\'' +
                ", upcomingStatus=" + upcomingStatus +
                '}';
    }
}
