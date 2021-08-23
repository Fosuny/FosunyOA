package com.oa.controller;

import com.oa.aop.Log;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//用户个人区域
@Controller
@RequestMapping("/oanav")
public class UserOanav {

    //便签
    @Log(title = "note",action = "便签页")
    @RequestMapping("/note")
    public String note(){
        return "nav/note";
    }

    //个人待办
    @Log(title = "todo",action = "待办事项")
    @RequestMapping("/todo")
    public String todo(){
        return "nav/todo";
    }

    //个人中心
    @Log(title = "userInfo",action = "个人信息")
    @RequestMapping("/userInfo")
    public String userInfo(){
        return "nav/userInfo";
    }

    //内网聊天
    @Log(title = "messaging",action = "聊天页")
    @RequestMapping("/messaging")
    public String messaging(){
        return "nav/messaging";
    }

    //密码修改
    @Log(title = "editPwd",action = "密码修改")
    @RequestMapping("/editPwd")
    public String editPwd(){
        return "nav/editPwd";
    }

    /*密码修改大页面*/
    @Log(title = "editpassword",action = "密码修改")
    @RequestMapping("/editPassword")
    public String editpassword(){
        return "set/user/password";
    }

    /*个人资料大页面*/
    @Log(title = "editinfo",action = "个人信息")
    @RequestMapping("/editInfo")
    public String editinfo(){
        return "set/user/info";
    }

    /*404错误页*/
    @RequestMapping("404")
    public String error(){
        return "abnormalPage/404";
    }

}
