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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css" type="text/css">
</head>
<body>
<form action="#" method="post" onsubmit="return false" id="formsubmit">
  <ul id="treeDemo" class="ztree" style="margin-left: 30px;margin-top: 20px;position: absolute"></ul>
    <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;width: 450px;position: absolute;margin-top: 0px;margin-left: 200px">
      <input id="roleId" type="hidden" name="roleId" value="${roleId}"/>
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
      <fieldset class="layui-elem-field">
        <legend>备注</legend>
        <div class="layui-field-box">
          <div class="layui-form-mid layui-word-aux">
            角色一般代表用户可拥有的权限的多少，拥有的权限越多，可操作性系统的能力也就越多；能力越大，责任就越大，在给角色赋予权限的时候
          </div>
        </div>
      </fieldset>
    </div>
</form>

  <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
  <script type="text/javascript">
    var nodes = '';
    var setting = {
      view: {
        selectedMulti: false
      },
      check: {
        enable: true
      },
      data: {
        simpleData: {
          enable: true,       //设置是否使用简单数据模式(Array)
          idKey: "id",	//设置节点唯一标识属性名称
          pIdKey: "pI"		//设置父节点唯一标识属性名称
        },
        key: {
          name: "name",//zTree 节点数据保存节点名称的属性名称
          title: "name"//zTree 节点数据保存节点提示信息的属性名称
        }
      },
      async: {
        enable: true,//开启异步加载
        url:"${pageContext.request.contextPath}/oaRole/treedata",//设置异步获取节点的 URL 地址
        autoParam:[],//根据需要自动提交参数
        contentType:"application/json",//设置 Ajax 提交参数的数据类型为 JSON 格式
        dataType:"text",//设置 Ajax 获取的数据类型为 纯文本
      },
      callback: {
        onClick: function(event, treeId, treeNode){
          layui.use('layer', function(){
            var layer = layui.layer;
            layer.msg(treeNode.name,{
              time:500
            })
          });
        },
        onCheck:function(event, treeId, treeNode){
          var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
          var node = treeObj.getCheckedNodes(true);
          nodes = node;
          return nodes;
        }
      },
      edit: {
        enable: false
      }
    };

    $(document).ready(function(){
      $.fn.zTree.init($("#treeDemo"), setting);
    });

    var newCount = 1;
  </script>
  <script>
    $("#LAY-user-front-submit").click(function (){
      $.ajax({
        url:'${pageContext.request.contextPath}/oaRole/roleDataAdd',
        data:$("#formsubmit").serialize(),
        type:'post',
        dataType:'json'
      })
      let d = "roleId=${roleId}";
      $.each(nodes,function (i,nodes) {
        d += "&nodes="+nodes.id;
      })
      $.ajax({
        url:'${pageContext.request.contextPath}/oaRole/roleautadd?roleId=${roleId}',
        data:d,
        type:'post'
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
  </script>
</body>
</html>