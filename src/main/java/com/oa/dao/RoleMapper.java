package com.oa.dao;

import com.oa.model.OaAuthority;
import com.oa.model.OaAuthorityRole;
import com.oa.model.OaRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleMapper {

    /*角色数据查询*/
    public List<OaRole> roleQuery(Map<String,Object> map);

    /*角色总条数查询*/
    public Integer roleCount(Map<String,Object> map);

    /*角色个人数据查询*/
    public List<OaRole> roleEditData(Integer roleId);

    /*角色修改数据上传*/
    public void roleUpdate(OaRole oaRole);

    /*角色最大ID值查询*/
    public Integer rolecou(Integer roleId);

    /*角色数据添加*/
    public void roledataadd(OaRole oaRole);

    /*角色权限数据回调*/
    public List<OaAuthorityRole> autroleQuery(Integer roleId);

    /*角色删除*/
    public Integer roledel(Integer roleId);
    /*查询是否存在需要被执行删除操作的关联的角色*/
    public Integer delsele(Integer roleId);
    /*如果关联表存在马上被删除的关联项，将被执行删除，否则就不执行*/
    public void deleterole(Integer roleId);

    /*ztree列表数据查询*/
    public List<OaAuthority> authoritytreeQuery();

    /*权限修改时数据回调*/
    public List<OaAuthority> updateQuery(Integer id);
    /*修改数据提交*/
    public void updateload(OaAuthority oaAuthority);

    /*权限节点删除*/
    public void delNodes(Integer id);

    /*权限节点增加*/
    public void authorityAdd(OaAuthority oaAuthority);

    /*权限表查询*/
    public List<OaAuthority> authorityQuery(Integer id);

    /*执行修改时删除数据*/
    public void delaut(Integer roleId);

    /*权限角色中间表添加*/
    public void insaut(@Param("roleId")Integer roleId, @Param("authorityId")Integer[] authorityId);

}
