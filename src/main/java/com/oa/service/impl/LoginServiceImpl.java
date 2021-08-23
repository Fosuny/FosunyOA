package com.oa.service.impl;

import com.oa.dao.LoginMapper;
import com.oa.model.OaRole;
import com.oa.model.OaStaff;
import com.oa.model.OaUser;
import com.oa.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    /*查询用户名*/
    public List<OaStaff> usernameQuery(String userLogin){
        return loginMapper.usernameQuery(userLogin);
    }

    /*查询用户名*/
    public List<OaUser> useravatar(String userLogin){
        return loginMapper.useravatar(userLogin);
    }

    /*查询用户表所有数据*/
    public List<OaUser> userQuery(String username){
        return loginMapper.userQuery(username);
    }

    /*查询角色英文昵称和权限字符串*/
    public List<OaRole> roleauthQuery(Object primaryPrincipal){
        return loginMapper.roleauthQuery(primaryPrincipal);
    };

}
