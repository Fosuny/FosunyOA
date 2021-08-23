<%--
  Created by IntelliJ IDEA.
  User: SPR28
  Date: 2021/7/7
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layuiAdmin 网站用户 iframe 框</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">

</head>
<body>
<form action="#" method="post" onsubmit="return false" id="formsubmit">
    <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
      <input type="hidden" id="staffId" name="roleId" value="${roleId}" />
      <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
          <input type="text" name="roleName" id="roleName" placeholder="请输入角色名称" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-inline">
          <input type="text" id="roleNickname" name="roleNickname" placeholder="请输入角色昵称" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block" style="margin-right: 60px">
          <textarea name="roleDescription" id="roleDescription" placeholder="请输入角色描述" class="layui-textarea"></textarea>
        </div>
      </div>
      <div class="layui-form-item layui-hide">
        <input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
      </div>
    </div>
</form>

  <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
  <script>
    $("#LAY-user-front-submit").click(function (){
      $.ajax({
        url:'${pageContext.request.contextPath}/oaRole/roleUpdate',
        data:$("#formsubmit").serialize(),
        type:'post',
        dataType:'json'
      })
    })

    layui.config({
      base: '${pageContext.request.contextPath}/static/' //静态资源所在路径
    }).extend({
      index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'upload','laydate'], function(){
      var $ = layui.$
              ,form = layui.form
              ,upload = layui.upload
              ,laydate = layui.laydate;
      //日期
      laydate.render({
        elem: '#date'
      });

      upload.render({
        elem: '#layuiadmin-upload-useradmin'
        ,url: layui.setter.base + 'json/upload/demo.js'
        ,accept: 'images'
        ,method: 'get'
        ,acceptMime: 'image/*'
        ,done: function(res){
          $(this.item).prev("div").children("input").val(res.data.src)
        }
      });
    })
    //杰森单个数据
    $(document).ready(function (){
      $.ajax({
        url:'${pageContext.request.contextPath}/oaRole/roleEditData?roleId=${roleId}',
        type:'post',
        dataType: 'json',
        success:function (data){
            $("#roleName").val(data.roleName);
            $("#roleNickname").val(data.roleNickname);
            $("#roleDescription").val(data.roleDescription);
        }
      })
    })
  </script>
</body>
</html>