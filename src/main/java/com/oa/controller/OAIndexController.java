package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.aop.Log;
import com.oa.model.OaRole;
import com.oa.model.OaRoleStaff;
import com.oa.model.OaStaff;
import com.oa.model.OaUser;
import com.oa.service.RoleService;
import com.oa.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping(path = "/oaIndex")
public class OAIndexController {

    @Autowired
    private UserService userService;

    //常量池
    public static final String[] POOL = new String[]{"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};

    //16进制随机数(用于ID取名)
    public static String generateNiceString(){
        StringBuilder charBuilder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 16; i++) {
            charBuilder.append(POOL[random.nextInt(POOL.length)]);
        }
        return charBuilder.toString();
    }

    //框架页面
    @Log(title = "indexOne",action = "框架主页")
    @RequestMapping("/indexOne")
    public String indexOne(){
        return "index";
    }

    //home主页面
    @Log(title = "home",action = "系统主页")
    @RequestMapping("/home")
    public String home(){
        return "home/index";
    }

    //权限管理---用户管理
    @Log(title = "userList",action = "用户管理列表页")
    @RequiresRoles("CTO")/*角色昵称*/
    @RequiresPermissions("admin")/*权限标识符*/
    @RequestMapping("/userList")
    public String userList(Model model,Map<String,Object> map,Integer curr){
        String count = userService.userCount(map);
        model.addAttribute("count",count);
        model.addAttribute("curr",curr);
        return "user/user-list";
    }

    //权限管理---用户数据
    @Log(title = "userData",action = "用户数据")
    @ResponseBody
    @RequestMapping("/userData")
    public JSON userData(OaStaff oaStaff,Integer page,Integer limit,Map<String,Object> map){
        Integer curr = page;
        limit = 10;
        if(page == null){
            curr = 1;
        }
        curr = (page*limit)-limit;
        map.put("staffName",oaStaff.getStaffName());
        map.put("staffMailbox",oaStaff.getStaffMailbox());
        map.put("StaffStatus",oaStaff.getStaffStatus());
        map.put("curr",curr);
        map.put("limit",limit);
        List<OaStaff> oaStaffs = userService.userQuery(map);
        String userCount = userService.userCount(map);
        Object json = JSON.toJSON(oaStaffs);
        return (JSON)json;
    }

    //权限管理---用户添加
    @Log(title = "userAdd",action = "用户添加页面")
    @RequestMapping("/userAdd")
    public String userAdd(Model model,Integer staffId){
        Integer staffmax = userService.staffmax()+1;
        model.addAttribute("staffId",staffmax);
        return "user/user-add";
    }

    //权限管理---用户数据添加
    @Log(title = "userDataAdd",action = "新建用户的数据提交")
    @RequestMapping("/userDataAdd")
    public String userAdd(OaStaff oaStaff, Integer staffAddress1, Integer staffAddress2, Integer staffAddress3, OaUser oaUser){
        String staffUsersId = generateNiceString();
        oaStaff.setStaffEntrydate(new Date(System.currentTimeMillis()));
        oaStaff.setStaffUsersId(staffUsersId);
        oaStaff.setStaffStatus(1);
        oaUser.setUserNickname(staffUsersId);
        oaUser.setUserLogin(oaStaff.getStaffPhone());
        oaUser.setUserPassword("123456");
        oaUser.setUserImage("dog.png");
        oaUser.setUserId(staffUsersId);
        oaStaff.setStaffAddress(staffAddress1+" "+staffAddress2+" "+staffAddress3);
        oaStaff.setStaffId(userService.staffmax()+1);
        userService.staffAdd(oaStaff);
        userService.userAdd(oaUser);
        return null;
    }

    //角色用户中间表
    @Log(title = "userRoleIds",action = "用户添加数据角色数据添加")
    @RequestMapping("/userRoleIds")
    public String userRoleIds(OaRoleStaff oaRoleStaff,Integer roleIds,Integer staffId){

        oaRoleStaff.setStaffId(staffId);
        oaRoleStaff.setRoleId(roleIds);
        userService.staffRoleAdd(oaRoleStaff);
        return null;
    }

    //角色数据
    @Log(title = "roleQuery",action = "用户新增修改时的角色数据调出")
    @ResponseBody
    @RequestMapping("/roleQuery")
    public JSON roleQuery(){
        List<OaRole> queryrole = userService.roleQuery();
        Object json = JSON.toJSON(queryrole);
        return (JSON)json;
    }

    //权限管理---用户编辑
    @Log(title = "userEdit",action = "用户编辑页面跳转")
    @RequiresRoles("CTO")/*角色昵称*/
    @RequiresPermissions("admin")/*权限标识符*/
    @RequestMapping("/userEdit")
    public String userEdit(Integer staffId, Model model){
        model.addAttribute("staffId",staffId);
        return "user/user-edit";
    }

    //权限管理---用户编辑数据
    @Log(title = "userEditData",action = "用户修改界面数据回显")
    @ResponseBody
    @RequestMapping("/userEditData")
    public String userEditData(Integer staffId){
        List<OaStaff> oaStaffs = userService.userEdit(staffId);
        Object json = JSON.toJSON(oaStaffs.get(0));
        return json.toString();
    }

    //权限管理---用户所属角色信息
    @Log(title = "roleIdsbox",action = "用户所拥有的的权限数据回显")
    @ResponseBody
    @RequestMapping("/roleIdsbox")
    public JSON roleIdsbox(Integer staffId){
        List<OaRoleStaff> oaRoleStaffs = userService.staffRole(staffId);
        Object json = JSON.toJSON(oaRoleStaffs);
        return (JSON)json;
    }

    //权限管理---用户修改数据上传
    @Log(title = "userEditUpload",action = "用户修改数据上传")
    @RequestMapping("/userEditUpload")
    public String userEditUpload(String staffAddress1,String staffAddress2,String staffAddress3,OaStaff oaStaff,Integer staffId){
        oaStaff.setStaffAddress(staffAddress1+" "+staffAddress2+" "+staffAddress3);
        userService.updateEditUpload(oaStaff);
        return "redirect:userList?";
    }

    //权限管理----用户角色修改
    @Log(title = "userEditRoleUpdate",action = "用户角色修改后数据上传")
    @RequestMapping("/userEditRoleUpdate")
    public String userEditRoleUpdate(OaRoleStaff oaRoleStaff,Integer roleId,Integer staffId){
        oaRoleStaff.setRoleId(roleId);
        oaRoleStaff.setStaffId(staffId);
        Integer userrolecount = userService.seleroleuser(staffId);
        if(userrolecount>0){
            userService.delroleuser(staffId);
            userService.insroleuser(oaRoleStaff);
        }else {
            userService.insroleuser(oaRoleStaff);
        }
        return null;
    }

    //权限管理---用户删除
    @Log(title = "userdel",action = "删除用户操作")
    @RequestMapping("/userdel")
    public String userdel(Integer staffId){
        userService.userdel(staffId);
        return null;
    }
}
