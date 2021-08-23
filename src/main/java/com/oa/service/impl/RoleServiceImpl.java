package com.oa.service.impl;

import com.oa.dao.RoleMapper;
import com.oa.model.OaAuthority;
import com.oa.model.OaAuthorityRole;
import com.oa.model.OaRole;
import com.oa.service.RoleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    /*角色数据查询*/
    public List<OaRole> roleQuery(Map<String, Object> map) {
        return roleMapper.roleQuery(map);
    }

    /*角色表总条数*/
    public Integer roleCount(Map<String,Object> map){
        return roleMapper.roleCount(map);
    }

    /*角色数据个人数据查询*/
    public List<OaRole> roleEditData(Integer roleId){
        return roleMapper.roleEditData(roleId);
    }

    /*角色修改数据上传*/
    public void roleUpdate(OaRole oaRole){
        roleMapper.roleUpdate(oaRole);
    }

    /*角色最大ID值查询*/
    public Integer rolecou(Integer roleId){
        return roleMapper.rolecou(roleId);
    }

    /*角色数据添加*/
    public void roledataadd(OaRole oaRole){
        roleMapper.roledataadd(oaRole);
    }

    /*角色权限数据回调*/
    public List<OaAuthorityRole> autroleQuery(Integer roleId){
        return roleMapper.autroleQuery(roleId);
    }

    /*角色删除*/
    public Integer roledel(Integer roleId){
        return roleMapper.roledel(roleId);
    }
    /*查询是否存在需要被执行删除操作的关联的角色*/
    public Integer delsele(Integer roleId){
        return roleMapper.delsele(roleId);
    }
    /*如果关联表存在马上被删除的关联项，将被执行删除，否则就不执行*/
    public void deleterole(Integer roleId){
        roleMapper.deleterole(roleId);
    }

    /*ztree列表数据查询*/
    public List<OaAuthority> authoritytreeQuery(){
        return roleMapper.authoritytreeQuery();
    };

    /*权限修改前数据回调*/
    public List<OaAuthority> updateQuery(Integer id){
        System.out.println(id+"=======================================================================================================");
        return roleMapper.updateQuery(id);
    }
    /*修改数据提交*/
    public void updateload(OaAuthority oaAuthority){
        roleMapper.updateload(oaAuthority);
    };

    /*权限节点删除*/
    public void delNodes(Integer id){
        roleMapper.delNodes(id);
    }

    /*权限节点增加*/
    public void authorityAdd(OaAuthority oaAuthority){
        roleMapper.authorityAdd(oaAuthority);
    };

    /*权限表查询*/
    public List<OaAuthority> authorityQuery(Integer id){
        return roleMapper.authorityQuery(id);
    }

    /*执行修改时先执行删除*/
    public void delaut(Integer roleId){
        roleMapper.delaut(roleId);
    }

    /*权限角色中间表添加*/
    public void insaut(Integer roleId,Integer[] authorityId){
        roleMapper.insaut(roleId,authorityId);
    }
}
