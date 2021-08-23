package com.oa.model;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/*用户操作日志*/
public class LogMessage {

    private String operationUser;//操作人
    private String path;//请求路径
    private String time;//方法执行时间
    private String parameter;//方法入参
    private String title;//操作方法
    private String action;//方法描述
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date dateTime;//操作时间
    public String getOperationUser() {
        return operationUser;
    }
    public LogMessage() {
        super();
        // TODO Auto-generated constructor stub
    }
    public LogMessage(String operationUser, String path, String time,
                      String parameter, String title, String action,Date dateTime) {
        super();
        this.operationUser = operationUser;
        this.path = path;
        this.time = time;
        this.parameter = parameter;
        this.title = title;
        this.action = action;
        this.dateTime = dateTime;
    }
    public void setOperationUser(String operationUser) {
        this.operationUser = operationUser;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
    public String getParameter() {
        return parameter;
    }
    public void setParameter(String parameter) {
        this.parameter = parameter;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAction() {
        return action;
    }
    public void setAction(String action) {
        this.action = action;
    }
    public Date getDateTime() {
        return dateTime;
    }
    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
}
