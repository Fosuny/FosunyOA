package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.model.LogMessage;
import com.oa.service.LogService;
import com.oa.util.LogPageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/system")
public class OASystemLog {

    @Autowired
    private LogService logService;

    /*操作日志页面舔砖*/
    @RequestMapping("/logtable")
    public String logtable(){
        return "system/log/operationlog";
    }

    /*操作日志数据读取*/
    @ResponseBody
    @RequestMapping("/logDataQuery")
    public String logDataQuery(HttpServletRequest request, LogPageUtil logPageUtil){

        /*查询日志表*/
        List<LogMessage> oaOperationLogs = logService.logQuery();
        logPageUtil.setData(oaOperationLogs);

        return JSON.toJSONString(logPageUtil);
    }

}
