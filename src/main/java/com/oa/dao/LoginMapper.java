package com.oa.dao;

import com.oa.model.OaRole;
import com.oa.model.OaStaff;
import com.oa.model.OaUser;

import java.util.List;

public interface LoginMapper {

    /*查询用户名*/
    public List<OaStaff> usernameQuery(String userLogin);

    /*查询用户名*/
    public List<OaUser> useravatar(String userLogin);

    /*查询用户表所有数据*/
    public List<OaUser> userQuery(String username);

    /*查询角色英文昵称和权限字符串*/
    public List<OaRole> roleauthQuery(Object primaryPrincipal);

}
