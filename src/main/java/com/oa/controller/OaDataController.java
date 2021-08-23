package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.model.OaStaff;
import com.oa.service.OaDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/dataOA")
public class OaDataController {

    @Autowired
    private OaDataService oaDataService;

    /*近七天职工离职入职情况========柱状图*/
    @ResponseBody
    @RequestMapping("/dataQuery")
    public String dataQuery() throws ParseException {
        Map<String,Object> map = new HashMap<String,Object>();
        Date toDay = new Date(System.currentTimeMillis());
        List<OaStaff> oaStaffs = oaDataService.dataQuery(toDay);
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd");
        List<String> datesz = new ArrayList<String>();
        for(int i=1;i<8;i++){/*从今天获取往前七天的日期*/
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(toDay);
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            toDay = calendar.getTime();
            datesz.add(sdf.format(toDay));
        }
        List<Integer> Onboarding = new ArrayList<Integer>();/*入职*/
        List<Integer> Resign = new ArrayList<Integer>();/*离职*/
        for(int i=0;i<datesz.size();i++){
            int r = 0;/*入职*/
            int s = 0;/*离职*/
            for(int l=0;l<oaStaffs.size();l++) {
                /*判断入职总人数*/
                if(oaStaffs.get(l).getStaffEntrydate()!=null){
                    if (sdf.parse(sdf.format(oaStaffs.get(l).getStaffEntrydate())).equals(sdf.parse(datesz.get(i)))) {
                        r = r + 1;
                    }
                }
                /*判断离职总人数*/
                if(oaStaffs.get(l).getStaffResignation()!=null){
                    if (sdf.parse(sdf.format(oaStaffs.get(l).getStaffResignation())).equals(sdf.parse(datesz.get(i)))) {
                        s = s + 1;
                    }
                }
            }
            Onboarding.add(r);/*入职人数累加*/
            Resign.add(s);/*离职人数累加*/
        }
        map.put("date",datesz);
        map.put("Onboarding",Onboarding);
        map.put("Resign",Resign);
        return JSON.toJSONString(map);
    }

    /*员工近七天离职与入职统计表======饼状图*/
    @ResponseBody
    @RequestMapping("/datapie")
    public String datapie() throws ParseException {
        Map<String,Object> map = new HashMap<String,Object>();
        Date toDay = new Date(System.currentTimeMillis());
        List<OaStaff> oaStaffs = oaDataService.dataQuery(toDay);
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd");
        List<String> datesz = new ArrayList<String>();
        for(int i=1;i<8;i++){/*从今天获取往前七天的日期*/
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(toDay);
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            toDay = calendar.getTime();
            datesz.add(sdf.format(toDay)+"离职");
            datesz.add(sdf.format(toDay)+"入职");
        }
        List<Integer> Onboarding = new ArrayList<Integer>();/*入职*/
        List<Integer> Resign = new ArrayList<Integer>();/*离职*/
        for(int i=0;i<datesz.size();i++){
            int r = 0;/*入职*/
            int s = 0;/*离职*/
            for(int l=0;l<oaStaffs.size();l++) {
                /*判断入职总人数*/
                if(oaStaffs.get(l).getStaffEntrydate()!=null){
                    if (sdf.parse(sdf.format(oaStaffs.get(l).getStaffEntrydate())).equals(sdf.parse(datesz.get(i)))) {
                        r = r + 1;
                    }
                }
                /*判断离职总人数*/
                if(oaStaffs.get(l).getStaffResignation()!=null){
                    if (sdf.parse(sdf.format(oaStaffs.get(l).getStaffResignation())).equals(sdf.parse(datesz.get(i)))) {
                        s = s + 1;
                    }
                }
            }
            Onboarding.add(r);/*入职人数累加*/
            Resign.add(s);/*离职人数累加*/
        }
        map.put("date",datesz);
        map.put("Onboarding",Onboarding);
        map.put("Resign",Resign);
        return JSON.toJSONString(map);
    }

}
