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
      <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
          <input type="text" name="staffName" id="staffName" placeholder="请输入姓名" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-inline">
          <input type="text" id="staffPhone" name="staffPhone" placeholder="请输入手机号" lay-verify="phone" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">生日</label>
        <div class="layui-input-inline">
          <input type="text" id="date" name="staffBirthday" placeholder="请选择生日" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">Q Q</label>
        <div class="layui-input-inline">
          <input type="text" id="staffQq" name="staffQq" placeholder="请输入QQ号码" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
          <input type="email" id="staffMailbox" name="staffMailbox" placeholder="请输入邮箱" lay-verify="email" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">微信</label>
        <div class="layui-input-inline">
          <input type="text" id="staffWechat" name="staffWechat" placeholder="请输入微信" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block" id="roleQuery"></div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">住址</label>
        <div class="layui-input-inline" style="width: 150px">
          <select name="staffAddress1" id="staffAddress">
            <option value="">请选择省</option>
            <option value="1" selected="">浙江省</option>
            <option value="2">江西省</option>
            <option value="3">福建省</option>
          </select>
        </div>
        <div class="layui-input-inline" style="width: 150px">
          <select name="staffAddress2">
            <option value="">请选择市</option>
            <option value="1">杭州</option>
            <option value="2">宁波</option>
            <option value="3">温州</option>
            <option value="4">台州</option>
            <option value="5">绍兴</option>
          </select>
        </div>
        <div class="layui-input-inline" style="width: 150px">
          <select name="staffAddress3">
            <option value="">请选择县/区</option>
            <option value="1">西湖区</option>
            <option value="2">余杭区</option>
            <option value="3">临安市</option>
          </select>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label" style="width: 50px;margin-left: 31px">年龄</label>
        <div class="layui-input-inline" style="width: 50px">
          <input type="number" id="staffAge" name="staffAge" lay-verify="required" style="width: 50px" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label" style="width: 50px">工龄：</label>
        <div class="layui-input-inline" style="width: 50px">
          <input type="number" id="staffWorkage" name="staffWorkage" lay-verify="required" style="width: 50px" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item" lay-filter="sex">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
          <input type="radio" name="staffSex" value="1" title="男" checked="checked">
          <input type="radio" name="staffSex" value="0" title="女">
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
        url:'${pageContext.request.contextPath}/oaIndex/userDataAdd',
        data:$("#formsubmit").serialize(),
        type:'post',
        dataType:'json'
      })
      var obj=document.getElementsByName('roleId');
      var roleArrayId='';
      for(var i=0; i<obj.length; i++){
        if(obj[i].checked)
          //如果选中，将value添加到变量s中
          roleArrayId+=obj[i].value+',';
      }
      for(var i=0;i<roleArrayId.length;i++){
        $.ajax({
          url:'${pageContext.request.contextPath}/oaIndex/userRoleIds',
          data:{"roleIds":roleArrayId[i],"staffId":${staffId}},
          type:"post"
        })
      }
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
    //角色复选框
    window.onload=function(){
        $.ajax({
          url:'${pageContext.request.contextPath}/oaIndex/roleQuery',
          type:'post',
          dataType:'json',
          success:function (data){
            let checkbox = '';
            for(let i=0;i<data.length;i++){
              sum = i+1;
              checkbox += '<input type="checkbox" name="roleId" value="'+data[i].roleId+'" title="'+data[i].roleName+'">'
            }
            $("#roleQuery").append(checkbox)
          }
        })
    }

    //地区
    /*var src='<option value="">请选择...</option>';
    $.ajax({
      url:'../接口',
      type:'get',
      dataType:'json',
      success:function(data){
        if(data.status==1){
          $.each(data.data,function(index,item){
            src+='<option value="'+item.currencyCode+'">'+item.currencyZhName+'</option>';
          });
          $('#currency').html(src);
          form.render();
        }

      }
    });


    //首先动态存储变量然后通过dom找到select被封装后的位置及元素来设置点击事件
    var currency = 'dd[lay-value=' + data.currency + ']';
    $('#currency').siblings("div.layui-form-select").find('dl').find(currency).click();*/
  </script>
</body>
</html>