package com.oa.service.impl;

import com.oa.dao.OaDataMapper;
import com.oa.model.OaStaff;
import com.oa.service.OaDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OaDataServiceImpl implements OaDataService{

    @Autowired
    private OaDataMapper oaDataMapper;

    /*近七天内职工入职离职情况分析表*/
    public List<OaStaff> dataQuery(Date toDay) {
        return oaDataMapper.dataQuery(toDay);
    }
}
