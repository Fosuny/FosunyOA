package com.oa.dao;

import com.oa.model.*;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    //角色查询
    public List<OaRole> roleQuery();

    //权限管理---职工数据
    public List<OaStaff> userQuery(Map<String,Object> map);

    //权限管理---职工总数
    public String userCount(Map<String,Object> map);

    //权限管理---职工编辑数据
    public  List<OaStaff> userEdit(Integer oaStaff);

    //权限管理---职工角色
    public List<OaRoleStaff> staffRole(Integer staffId);

    //权限管理---职工编辑数据上传
    public void updateEditUpload(OaStaff oaStaff);

    //权限管理---职工新增
    public void staffAdd(OaStaff oaStaff);

    //权限管理----用户新增
    public void userAdd(OaUser oaUser);

    //权限管理----职工删除
    public void userdel(Integer staffId);

    //权限管理----职工角色关联表数据添加
    public void staffRoleAdd(OaRoleStaff oaRoleStaff);

    //权限管理----职工表ID最大值
    public Integer staffmax();

    /*权限管理===================================修改时查询删除并添加修改后新数据*/
    //查询操作
    public Integer seleroleuser(Integer staffId);
    //删除操作
    public void delroleuser(Integer staffId);
    //增加操作
    public void insroleuser(OaRoleStaff oaRoleStaff);
    /*↑=====================================================================↑*/

}
