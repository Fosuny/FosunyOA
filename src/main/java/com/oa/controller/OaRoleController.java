package com.oa.controller;

import com.alibaba.fastjson.JSON;
import com.oa.aop.Log;
import com.oa.model.OaAuthority;
import com.oa.model.OaAuthorityRole;
import com.oa.model.OaRole;
import com.oa.model.TreeBean;
import com.oa.service.RoleService;
import com.oa.util.AuthorityUtil;
import com.oa.util.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

//角色And权限控制器
@Controller
@RequestMapping("/oaRole")
public class OaRoleController {

    @Autowired
    private RoleService roleService;

    //权限管理---角色管理跳转
    @Log(title = "roleList",action = "角色列表页")
    @RequiresPermissions("admin")
    @RequestMapping("/roleList")
    public String roleList(){

        return "role/role-list";
    }

    //权限管理----角色查询数据
    @Log(title = "roleData",action = "角色数数据调出")
    @ResponseBody
    @RequestMapping("/roleData")
    public JSON roleData(OaRole oaRole, Integer page, Integer limit, Map<String, Object> map){
        Integer curr = page;
        limit = 10;
        if(page == null){
            curr = 1;
        }
        curr = (page*limit)-limit;
        map.put("curr",curr);
        map.put("limit",limit);
        map.put("oaRole",oaRole);
        List<OaRole> list = roleService.roleQuery(map);
        Integer roleCount = roleService.roleCount(map);
        PageUtil oaRoles = new PageUtil();
        oaRoles.setData(list);
        oaRoles.setCount(roleCount);
        Object json = JSON.toJSON(oaRoles);
        return (JSON)json;
    }

    //权限管理---角色添加
    @Log(title = "roleAdd",action = "角色添加")
    @RequestMapping("roleAdd")
    public String roleAdd(Model model,Integer roleId){
        Integer rolecou = roleService.rolecou(roleId)+1;
        model.addAttribute("roleId",rolecou);
        return "role/role-add";
    }

    /*角色拥有权限添加*/
    @Log(title = "roleautadd",action = "角色拥有权限添加")
    @ResponseBody
    @RequestMapping("/roleautadd")
    public String roleautadd(Integer roleId,Integer[] nodes){
        roleService.insaut(roleId,nodes);
        return null;
    }

    //权限管理---角色数据添加
    @Log(title = "roledataadd",action = "角色数据添加")
    @ResponseBody
    @RequestMapping("/roleDataAdd")
    public String roledataadd(OaRole oaRole){
        roleService.roledataadd(oaRole);
        return null;
    }

    //角色权限数据回调
    @Log(title = "treedataUpdate",action = "角色权限数据回调")
    @ResponseBody
    @RequestMapping("/treedatauupdate")
    public JSON treedataUpdate(Integer roleId){
        List<OaAuthority> oaAuthorities = roleService.authoritytreeQuery();
        List<OaAuthorityRole> oaautQuery = roleService.autroleQuery(roleId);
        List<TreeBean> treeBeanList = new ArrayList<>();
        for(int i=0;i<oaAuthorities.size();i++){
            TreeBean treeBean = new TreeBean();
            treeBean.setId(oaAuthorities.get(i).getAuthorityId());
            treeBean.setName(oaAuthorities.get(i).getAuthorityList());
            treeBean.setpI(oaAuthorities.get(i).getpId());
            treeBean.setIsParent(oaAuthorities.get(i).getIsparent());
            treeBean.setOpen(oaAuthorities.get(i).getOpen());

            for(int l=0;l<oaautQuery.size();l++){
                if(oaautQuery.get(l).getAuthorityId().equals(oaAuthorities.get(i).getAuthorityId())){
                    treeBean.setChecked(true);
                }else {
                    treeBean.setChecked(false);
                }
            }

            treeBeanList.add(treeBean);

        }
        Object json = JSON.toJSON(treeBeanList);
        return (JSON)json;
    }

    //权限管理---角色修改
    @Log(title = "roleEdit",action = "角色修改")
    @RequestMapping("/roleEdit")
    public String roleEdit(Integer roleId, Model model){
        model.addAttribute("roleId",roleId);
        return "role/role-edit";
    }

    //权限管理---角色数据
    @Log(title = "roleEditData",action = "角色数据回显")
    @ResponseBody
    @RequestMapping("/roleEditData")
    public JSON roleEditData(Integer roleId){
        List<OaRole> list = roleService.roleEditData(roleId);
        Object json = JSON.toJSON(list.get(0));
        return (JSON)json;
    };

    //权限管理---角色修改数据上传
    @Log(title = "reloUpdate",action = "角色修改数据上传")
    @RequestMapping("/roleUpdate")
    @ResponseStatus
    public String reloUpdate(Integer roleId,OaRole oaRole){
        oaRole.setRoleId(roleId);
        roleService.roleUpdate(oaRole);
        return null;
    }

    //权限管理---角色删除
    @Log(title = "roledel",action = "角色删除")
    @ResponseBody
    @RequestMapping("/roledel")
    public String roledel(Integer roleId){
        Integer delsele = roleService.delsele(roleId);
        if(delsele != 0 ){
            roleService.deleterole(roleId);
        }
        roleService.roledel(roleId);
        return null;
    }

    //权限管理---菜单权限
    @Log(title = "menuList",action = "菜单权限")
    @RequiresRoles("CTO")/*角色昵称*/
    @RequiresPermissions("admin")/*权限标识符*/
    @RequestMapping("/menuList")
    public String menuList(){
        return "menu/menu-list";
    }

    //权限管理---权限添加
    @Log(title = "menuAdd",action = "权限添加")
    @RequiresRoles("CTO")/*角色昵称*/
    @RequiresPermissions("admin")/*权限标识符*/
    @RequestMapping("/menuAdd")
    public String menuAdd(){
        return "menu/menu-add";
    }

    //权限管理---权限修改
    @Log(title = "menuEdit",action = "权限修改")
    @RequiresRoles("CTO")/*角色昵称*/
    @RequiresPermissions("admin")/*权限标识符*/
    @RequestMapping("/menuEdit")
    public String menuEdit(Integer id,Model model){
        model.addAttribute("id",id);
        return "menu/menu-edit";
    }

    //权限管理---权限修改
    @Log(title = "menuEditQuery",action = "权限数据回显")
    @ResponseBody
    @RequestMapping("/menuEditQuery")
    public JSON menuEditQuery(Integer id){
        List<OaAuthority> oaAuthorities = roleService.updateQuery(id);
        return (JSON)JSON.toJSON(oaAuthorities.get(0));
    }

    //权限管理---权限修改数据提交
    @Log(title = "updateload",action = "权限修改数据提交")
    @ResponseBody
    @RequestMapping("/updateload")
    public String updateload(OaAuthority oaAuthority){
        roleService.updateload(oaAuthority);
        return null;
    }


    //角色ZTREE权限列表页
    @Log(title = "ztreelist",action = "角色ZTREE权限列表页")
    @RequestMapping("/ztreeList")
    public String ztreelist(Model model,Integer roleId){
        model.addAttribute("roleId",roleId);
        return "role/metroList";
    }

    //角色ZTREE功能列表页
    @Log(title = "ztreelistFeatures",action = "角色ZTREE功能列表页")
    @RequestMapping("/ztreeFeatures")
    public String ztreelistFeatures(){
        return "role/metroFeatures";
    }

    //zTree列表数据
    @Log(title = "treedata",action = "zTree列表数据")
    @ResponseBody
    @RequestMapping("/treedata")
    public JSON treedata(){
        List<OaAuthority> oaAuthorities = roleService.authoritytreeQuery();
        List<TreeBean> treeBeanList = new ArrayList<>();
        for(int i=0;i<oaAuthorities.size();i++){
            TreeBean treeBean = new TreeBean();
            treeBean.setId(oaAuthorities.get(i).getAuthorityId());
            treeBean.setName(oaAuthorities.get(i).getAuthorityList());
            treeBean.setpI(oaAuthorities.get(i).getpId());
            treeBean.setIsParent(oaAuthorities.get(i).getIsparent());
            treeBean.setOpen(oaAuthorities.get(i).getOpen());
            treeBeanList.add(treeBean);
        }
        Object json = JSON.toJSON(treeBeanList);
        return (JSON)json;
    }

    //角色表权限勾选操作
    @ResponseBody
    @RequestMapping("/ztreecheck")
    public String ztreecheck(){

        return null;
    }

    /*权限Tree删除节点操作*/
    @Log(title = "ztreedelNode",action = "权限Tree删除节点操作")
    @ResponseBody
    @RequestMapping("/ztreedelNode")
    public String ztreedelNode(Integer id){
        roleService.delNodes(id);
        return null;
    }

    /*权限节点添加*/
    @Log(title = "authorityAdd",action = "权限节点添加")
    @ResponseBody
    @RequestMapping("/ztreeAddNode")
    public String authorityAdd(OaAuthority oaAuthority){
        /*列表节点新增默认为开启装填*/
        oaAuthority.setAuthorityListswitch("enable");
        /*获取当前系统时间，作为添加该节点的日期*/
        roleService.authorityAdd(oaAuthority);
        return null;
    }

    /*ztree点击节点，节点传回数据，根据传回数据查询权限表，并返回数据,点击子节点查询子节点权限数据，点击父节点就查询父节点下的所有子节点数据并传回*/
    /*权限表查询*/
    @Log(title = "authorityQuery",action = "查询点点击节点的子节点数据")
    @ResponseBody
    @RequestMapping("/authorityQuery")
    public JSON authorityQuery(Integer id){
        /*查询权限表*/
        if(id==null){
            id=1;
        }
        List<OaAuthority> oaAuthorities = roleService.authorityQuery(id);
        Object json = JSON.toJSON(oaAuthorities);
        return (JSON)json;
    }

    /*角色修改权限编辑*/
    @Log(title = "insauth",action = "角色修改权限编辑")
    @ResponseBody
    @RequestMapping("/insaut")
    public String insauth(Integer roleId,Integer[] nodes){
        roleService.delaut(roleId);
        roleService.insaut(roleId,nodes);
        return null;
    }

}
