package com.oa.dao;

import com.oa.model.OaStaff;

import java.util.Date;
import java.util.List;

public interface OaDataMapper {

    /*员工离职入职统计表*/
    public List<OaStaff> dataQuery(Date toDay);

}
