<%--
  Created by IntelliJ IDEA.
  User: SPR28
  Date: 2021/7/7
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <title>Layui-Tinymce</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<body>
<div style="width: 100%;margin: 0px auto; height: 100%;">
    <textarea name="" id="edit"></textarea>
    <!-- <div class="layui-btn-group" style="width: 100%;text-align: right;margin-top: 10px;padding: 0 10px;"> -->
        <!-- <button class="layui-btn" lay-event="setContent">设置内容</button>
        <button class="layui-btn" lay-event="insertContent">插入内容</button> -->
        <!-- <button class="layui-btn layui-btn-radius layui-btn-normal" lay-event="getContent">获取内容</button> -->
        <!-- <button class="layui-btn" lay-event="getText">获取文本</button>
        <button class="layui-btn" lay-event="clearContent">清空内容</button>
        <button class="layui-btn" lay-event="reload">重载编辑器</button>
        <button class="layui-btn" lay-event="destroy">销毁编辑器</button>
        <button class="layui-btn" lay-event="render">加载编辑器</button> -->
    <!-- </div> -->
    <button class="layui-btn layui-btn-radius layui-btn-normal" style="position: fixed;bottom: 30px;right: 20px;" lay-event="getContent">获取内容</button>
</div>
</body>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
    layui.extend({
        tinymce: '${pageContext.request.contextPath}/static/layui/extend/tinymce/tinymce'
    }).use(['tinymce', 'util', 'layer'], function () {
        var tinymce = layui.tinymce
        var util = layui.util;
        var edit = tinymce.render({
            elem: "#edit"
            , height: '100vh'
            // ...
            // 其余配置可参考官方文档
        },(opt)=>{
            //加载完成后回调
        });

        util.event('lay-event', {
            getContent:() => {
                var content = tinymce.get('#edit').getContent()
                layer.alert(content)
            },
            setContent:() => {
                tinymce.get('#edit').setContent('点击按钮设置的内容：<span style="color: #e03e2d;">' + new Date()+'</span>')
            },
            clearContent:() => {
                tinymce.get('#edit').setContent('')
            },
            insertContent:() => {
                tinymce.get('#edit').insertContent('<b>插入内容</b>')
            },
            getText:() => {
                var text = tinymce.get('#edit').getContent({format:'text'})
                layer.alert(text)
            },
            reload:() => {
                tinymce.reload({
                    elem:'#edit'
                    // 所有参数都可以重新设置 ...
                },(opt) => {
                    //重载完成后回调函数，会把所有参数回传，
                    //重载仅仅重新渲染编辑器，不会清空textarea，可手动清空或设置
                    tinymce.get('#edit').setContent('')
                })
            },
            destroy:()=>{
                tinymce.get('#edit').destroy()
            },
            render:()=>{
                tinymce.render({elem:'#edit',height:'500px'})
            }
        });
    });
</script>
</html>
