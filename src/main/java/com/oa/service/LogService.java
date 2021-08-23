package com.oa.service;

import com.oa.model.LogMessage;

import java.util.List;

public interface LogService {

    /*查询日志表*/
    public List<LogMessage> logQuery();

    /*写日志*/
    public void writeLog(LogMessage message);

}
