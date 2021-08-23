package com.oa.aop;

import com.oa.dao.LogMapper;
import com.oa.model.LogMessage;
import com.oa.model.OaStaff;
import com.oa.model.OaUser;
import com.oa.service.LogService;
import com.oa.service.LoginService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/*LOG日志记录*/
@Aspect
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class LogAspect {

    @Autowired
    private LogService logService;//日志 mapper

    @Autowired
    private LoginService loginService;

    private String requestPath = null ; // 请求地址
    private long startTimeMillis = 0; // 开始时间
    private long endTimeMillis = 0; // 结束时间
    private String user = null; // 操作人
    private HttpServletRequest request = null;//请求

    //声明切点
    @Pointcut("execution(* com.oa.controller.*.*(..))")
    public void logpect() {
        System.out.println("切点方法======>↑=↓<======切点方法");
    }

    /**
     * @param joinPoint
     * @Description 气质通知  方法调用前触发   记录开始时间,从session中获取操作人
     */
    @Before(value = "logpect()")
    public void before(JoinPoint joinPoint){
        startTimeMillis = System.currentTimeMillis();

    }

    /**
     * @param joinPoint
     * @Description 获取入参方法参数
     * @return
     */
    public Map<String, Object> getNameAndValue(JoinPoint joinPoint) {
        Map<String, Object> param = new HashMap<>();
        Object[] paramValues = joinPoint.getArgs();
        String[] paramNames = ((CodeSignature)joinPoint.getSignature()).getParameterNames();
        for (int i = 0; i < paramNames.length; i++) {
            if(paramValues[i] instanceof Integer || paramValues[i] instanceof String) {
                param.put(paramNames[i], paramValues[i]);
            }
        }
        return param;
    }

    /**
     * @param joinPoint
     * @Description 后置通知    方法调用后触发   记录结束时间 ,操作人 ,入参等
     */
    @After(value = "logpect()")
    public void logAfter(JoinPoint joinPoint){

        request = getHttpServletRequest();
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Method[] methods = targetClass.getMethods();
        String title;
        String action;
        Class<?>[] clazzs;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                clazzs = method.getParameterTypes();
                if (clazzs!=null && clazzs.length == arguments.length && method.getAnnotation(Log.class)!=null) {
                    request = getHttpServletRequest();
                    requestPath=request.getServletPath();

                    if(request.getSession().getAttribute("user") != null) {
                        OaUser oaUser = (OaUser) request.getSession().getAttribute("user");
                        List<OaStaff> oaStaffs = loginService.usernameQuery(oaUser.getUserLogin());
                        user = oaStaffs.get(0).getStaffName();
                    }else {
                        String username = "正在或未进行登陆操作的用户";
                        user = username;
                    }


                    title = method.getAnnotation(Log.class).title();
                    action = method.getAnnotation(Log.class).action();
                    endTimeMillis = System.currentTimeMillis();
                    Date dateTime = new Date(System.currentTimeMillis());
                    LogMessage log=new LogMessage(user, requestPath,(endTimeMillis-startTimeMillis)+"ms",getNameAndValue(joinPoint).toString(), title, action,dateTime);
                    logService.writeLog(log);
                    break;
                }
            }
        }
        System.out.println("操作完成");
    }

    /**
     * @Description: 获取request
     */
    public HttpServletRequest getHttpServletRequest(){
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes)ra;
        HttpServletRequest request = sra.getRequest();
        return request;
    }
    /**
     * @param joinPoint
     * @return 环绕通知
     * @throws Throwable
     */
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        return null;
    }
    /**
     * @param joinPoint
     * @Description 异常通知
     */
    public void throwing(JoinPoint joinPoint) {
        System.out.println("异常通知");
    }

}