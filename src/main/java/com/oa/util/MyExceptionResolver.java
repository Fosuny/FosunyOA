package com.oa.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/*自定义 --异常处理类*/
public class MyExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex) {
        System.out.println("==============异常开始=============");
        //如果是shiro无权操作，因为shiro 在操作auno等一部分不进行转发至无权限url
        if(ex instanceof UnauthorizedException){
            /*跳转到显示您无权访问页面-403页面*/
            ModelAndView mv = new ModelAndView("abnormalPage/403");
            return mv;
        }
        ex.printStackTrace();
        System.out.println("==============异常结束=============");
        /*原来值为error异常页，自己修改为500服务器错误页*/
        ModelAndView mv = new ModelAndView("abnormalPage/500");
        mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));
        return mv;
    }

}