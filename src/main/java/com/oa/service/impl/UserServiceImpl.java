package com.oa.service.impl;

import com.oa.dao.UserMapper;
import com.oa.model.*;
import com.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //角色数据
    public List<OaRole> roleQuery(){
        return userMapper.roleQuery();
    }

    //权限管理---职工数据
    public List<OaStaff> userQuery(Map<String,Object> map) {
        return userMapper.userQuery(map);
    }

    //权限管理---职工总数
    public String userCount(Map<String,Object> map){
        return userMapper.userCount(map);
    }

    //权限管理---职工编辑数据
    public List<OaStaff> userEdit(Integer oaStaff){
        return userMapper.userEdit(oaStaff);
    }

    //权限管理---职工角色
    public List<OaRoleStaff> staffRole(Integer staffId) {
        return userMapper.staffRole(staffId);
    }

    //权限管理---职工编辑数据上传
    public void updateEditUpload(OaStaff oaStaff){
        userMapper.updateEditUpload(oaStaff);
    }

    //权限管理---职工新增
    public void staffAdd(OaStaff oaStaff) {
        userMapper.staffAdd(oaStaff);
    }

    //权限管理---用户新增
    public void userAdd(OaUser oaUser){
        userMapper.userAdd(oaUser);
    }

    //权限管理---职工删除
    public void userdel(Integer staffId){
        userMapper.userdel(staffId);
    }

    //权限管理---职工角色关联表
    public void staffRoleAdd(OaRoleStaff oaRoleStaff){
        userMapper.staffRoleAdd(oaRoleStaff);
    }

    //权限管理---职工表最大ID
    public Integer staffmax(){
        return userMapper.staffmax();
    };

    /*权限管理===================================修改时查询删除并添加修改后新数据*/
    //查询操作
    public Integer seleroleuser(Integer staffId){
        return userMapper.seleroleuser(staffId);
    };
    //删除操作
    public void delroleuser(Integer staffId){
        userMapper.delroleuser(staffId);
    };
    //增加操作
    public void insroleuser(OaRoleStaff oaRoleStaff){
        userMapper.insroleuser(oaRoleStaff);
    };
    /*↑=====================================================================↑*/

}
