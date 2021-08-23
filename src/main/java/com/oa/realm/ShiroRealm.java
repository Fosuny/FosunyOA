package com.oa.realm;

import com.oa.model.OaRole;
import com.oa.model.OaUser;
import com.oa.service.LoginService;
import com.oa.service.RoleService;
import com.oa.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.SimpleByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private LoginService loginService;

    @Override/*用户Realm名称*/
    public String getName() {
        return "UserIdRealm";
    }

    /*认证*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        SimpleAuthenticationInfo authenticationInfo = null;
        UsernamePasswordToken usernameToken = (UsernamePasswordToken)token;
        /*获取用户输入的用户名，根据用户名查找用户数据，并把密码进行判断*/
        List<OaUser> oaUsers = loginService.userQuery(usernameToken.getUsername());

        /*判断用户是否为空*/
        if (oaUsers != null) {
            authenticationInfo = new SimpleAuthenticationInfo(oaUsers.get(0).getUserLogin(),oaUsers.get(0).getUserPassword().toCharArray(), getName());
        }

        return authenticationInfo;
    }

    /*授权*/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo simpleAuthorizationInfo = null;
        /*获取用户的登录名*/
        Object primaryPrincipal = principals.getPrimaryPrincipal();

        List<OaRole> oaRoles = loginService.roleauthQuery(primaryPrincipal);

        if (primaryPrincipal != null) {
            /*OaUser user = (OaUser) primaryPrincipal;*/
            /*获取该用户的权限和角色*/
            simpleAuthorizationInfo = new SimpleAuthorizationInfo();

            List<String> roleList = new ArrayList<String>();

            List<String> permissionList =new  ArrayList<String>();

           for (int i=0;i<oaRoles.size();i++) {

                /*此项为角色昵称*/
                roleList.add(oaRoles.get(i).getRoleNickname());

                /*此处为权限标识符*/
                permissionList.add(oaRoles.get(i).getRoleDescription());

            }
            /*将角色昵称和权限字符串放到SimpleAuthorizationInfo对象中*/
            simpleAuthorizationInfo.addRoles(roleList);
            simpleAuthorizationInfo.addStringPermissions(permissionList);
        }

        return simpleAuthorizationInfo;
    }

    /*加密规则*/
    /*@Override
    public CredentialsMatcher getCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        // 设置加密方式
        hashedCredentialsMatcher.setHashAlgorithmName(Md5Hash.ALGORITHM_NAME);
        // 设置散列次数
        hashedCredentialsMatcher.setHashIterations(2);

        return hashedCredentialsMatcher;
    }*/


}