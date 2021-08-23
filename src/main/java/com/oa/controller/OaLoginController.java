package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.aop.Log;
import com.oa.dao.LoginMapper;
import com.oa.model.OaStaff;
import com.oa.model.OaUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

//登陆跳转
@Controller
@RequestMapping("/loginOA")
public class OaLoginController {

    @Autowired
    private LoginMapper loginMapper;

    //登录页面跳转
    @RequestMapping("/loginBefore")
    public String loginoa(){
        return "login";
    }

    /*查询用户名*/
    @ResponseBody
    @RequestMapping("/loginName")
    public String loginName(String userLogin){
        List<OaStaff> oaStaffs = loginMapper.usernameQuery(userLogin);
        return JSON.toJSONString(oaStaffs.get(0));
    }

    /*获取用户登陆输入的账户密码*/
    @Log(title = "loginAfter",action = "尝试登陆操作")
    @RequestMapping("/loginAfter")
    public String loginAfter(HttpServletRequest request, HttpSession session, OaUser oaUser){

        /*令牌,新建一个token对象，用户获取用户前端输入的数据和数据库的数据进行比较*/
        UsernamePasswordToken token = new UsernamePasswordToken();
        token.setUsername(oaUser.getUserLogin());
        token.setPassword(oaUser.getUserPassword().toCharArray());
        Subject subject = SecurityUtils.getSubject();
        /*把令牌给登录对象*/
        subject.login(token);
        Object userinfo = subject.getPrincipal();
        if(userinfo != null){
            OaUser user = new OaUser();
            user.setUserId(oaUser.getUserId());
            user.setUserLogin(oaUser.getUserLogin());
            user.setUserPassword(oaUser.getUserPassword());
            session.setAttribute("user",user);
        }

        return "redirect:/oaIndex/indexOne";
    }

    /*获取用户登陆后的信息*/
    @ResponseBody
    @RequestMapping("/loginUsermis")
    public String loginUsermis(HttpSession session){
        OaUser user = (OaUser) session.getAttribute("user");
        List<OaStaff> oaStaffs = loginMapper.usernameQuery(user.getUserLogin());
        return JSON.toJSONString(oaStaffs.get(0));
    }

    /*用户头像*/
    @ResponseBody
    @RequestMapping("/useravatar")
    public String useravatar(HttpSession session){
        OaUser user = (OaUser) session.getAttribute("user");
        List<OaUser> oaUsers = loginMapper.useravatar(user.getUserLogin());
        return JSON.toJSONString(oaUsers.get(0));
    }

    /*用户登出*/
    @Log(title = "logout",action = "退出登录")
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("userinfo");
        return "redirect:/loginOA/loginBefore";
    }

    /*修改密码*/
    @RequestMapping("/editPwd")
    public String editPwd(String oldPassword,String password,String repassword){

        return null;
    }

}
