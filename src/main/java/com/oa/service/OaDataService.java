package com.oa.service;

import com.oa.model.OaStaff;

import java.util.Date;
import java.util.List;

public interface OaDataService {

    public List<OaStaff> dataQuery(Date toDay);

}
