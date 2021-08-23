package com.oa.service.impl;

import com.oa.dao.LogMapper;
import com.oa.model.LogMessage;
import com.oa.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    /*查询日志表*/
    public List<LogMessage> logQuery(){
        return logMapper.logQuery();
    }

    /*写日志*/
    public void writeLog(LogMessage message){
        logMapper.writeLog(message);
    };

}
