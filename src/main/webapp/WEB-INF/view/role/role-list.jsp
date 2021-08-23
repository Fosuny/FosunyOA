<%--
  Created by IntelliJ IDEA.
  User: SPR28
  Date: 2021/7/7
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/extend/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/extend/font/dtreefont.css">

    <!-- 图标 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <div class="yadmin-body animated fadeIn">

        <form class="layui-form yadmin-search-area input">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="roleName" class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="roleName" autocomplete="off"
                               id="roleName" class="layui-input">
                    </div>
                    <label for="roleName" class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="roleNickname" autocomplete="off"
                               id="roleNickname" class="layui-input">
                    </div>

                    <button lay-submit="" lay-filter="search" class="layui-btn layui-btn-sm layui-btn-primary table-action">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
            </div>
        </form>

        <table class="layui-hide" id="role-table"></table>
    </div>

    <script type="text/html" id="toolbar">

        <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" lay-event="add">
            <i class="layui-icon layui-icon-addition"></i>
            新增
        </button>

    </script>

    <script type="text/html" id="auth-toolbar">

        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="grant-menu">授权菜单</a>

        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="grant-operator">授权功能</a>

    </script>

    <script type="text/html" id="column-toolbar">

        <button type="button" class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
            <i class="layui-icon layui-icon-edit" title="编辑"></i>
            编辑
        </button>

        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
            <i class="layui-icon layui-icon-delete" title="删除"></i>
            删除
        </button>

    </script>

    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <!-- 公共JS -->
    <script type="text/javascript">

        /*定义一个当前页的页码值*/
        var pageCurr = 1;

        /*定义每页显示的条数*/
        var pageLimit = 10;

        layui.config({
            base: "${pageContext.request.contextPath}/static/js/",
        }).use(["yadmin", "tabRightMenu"], function () {
            var yadmin = layui.yadmin;
            var tabRightMenu = layui.tabRightMenu;

            // 渲染 tab 右键菜单.
            tabRightMenu.render({
                filter: "lay-tab",
                pintabIDs: ["main"],
                width: 110,
            });
        });
    </script>

    <script>
        layui.config({
            base: '${pageContext.request.contextPath}/static/layui/extend/'
        }).use(['table', 'element', 'dtree', 'form', 'tablePlug'], function () {
            var table = layui.table;
            var $ = layui.$;
            var dtree = layui.dtree;
            var form = layui.form;
            var tablePlug = layui.tablePlug;

            tablePlug.smartReload.enable(true);

            form.on('submit(search)', function (form) {
                table.reload('role-table', {
                    where: form.field
                });
                return false;
            });

            table.render({
                elem: '#role-table',
                url: '${pageContext.request.contextPath}/oaRole/roleData',
                cellMinWidth: 80,
                page: true,
                toolbar: '#toolbar',
                smartReloadModel: true,
                cols: [
                    [
                        {type: 'numbers', title: '序号', width: 60},
                        {field: 'roleId', title: 'ID', hide: true},
                        {field: 'roleName', title: '角色名称', width: 120},
                        {field: 'roleDescription', title: '描述', minWidth: 200},
                        {field: 'roleNickname', title: '角色昵称', width: 300},
                        {title: '授权', align: 'center', width: 200, toolbar: '#auth-toolbar'},
                        {title: '操作', fixed: 'right', width: 200, align: 'center', toolbar: '#column-toolbar'}
                    ]
                ]
            });

            table.on('toolbar', function (obj) {
                var event = obj.event;
                if (event === 'add') {
                    add();
                }
            });
           /* content:'<ul id="menuTree" class="dtree" data-id="0"></ul>',*/
            table.on('tool', function (obj) {
                var data = obj.data;
                var event = obj.event;

                if (event === 'edit') {
                    edit(data.roleId);
                } else if (event === 'grant-menu') {
                    layer.open({
                        type: 2,
                        title: "授权菜单",
                        area: ["270px", "500px"],
                        shadeClose: true,
                        content:'${pageContext.request.contextPath}/oaRole/ztreeList?roleId='+data.roleId,
                        btn: ['完成','取消'],
                        yes: function(index, layero) {
                            layer.msg("授权成功", {icon: 6});
                            layer.close(index); //关闭弹层
                            location.reload("#role-table")//重载页面
                            var iframeWindow = window['layui-layer-iframe'+ index]
                                ,ztreeId = 'treeDemo'//获取跳转页面内的ID
                                ,ztree = layero.find('iframe').contents().find('#'+ ztreeId);//设置获取到的页面内的ID为ztree

                        }
                    });
                } else if (event === 'grant-operator') {
                    layer.open({
                        type: 1
                        ,content: '<div style="padding: 20px 60px;">'+'功能暂未添加，敬请期待！'+'</div>'
                        ,btn: '晓得了'
                        ,btnAlign: 'c'
                        ,shade: 0
                        ,yes: function(){
                            layer.closeAll();
                        }
                    });
                } else if (event === 'del') {
                    layer.confirm("确定删除角色吗?", {icon: 3, title: '提示'},
                        function (index) {// 确定回调
                            obj.del();
                            layer.close(index);
                            location.reload("#role-table")
                            $.ajax({url:"${pageContext.request.contextPath}/oaRole/roledel?roleId="+obj.data.roleId})
                        }, function (index) {//取消回调
                            layer.close(index);
                        }
                    );
                }
            });

            function add() {
                layer.open({
                    content: "${pageContext.request.contextPath}/oaRole/roleAdd",
                    title: "新增角色",
                    area: ['688px', '500px'],
                    type: 2,
                    maxmin: true,
                    btn:['添加','取消'],
                    yes:function (index,layero){
                        layer.close(index); //关闭弹层
                        location.reload("#role-table")
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        submit.trigger('click');
                    }
                });
            }
            function edit(id) {
                layer.open({
                    content: "${pageContext.request.contextPath}/oaRole/roleEdit?roleId="+id,
                    title: "编辑角色",
                    area: ['688px', '400px'],
                    type: 2,
                    maxmin: true,
                    btn:['确定','取消'],
                    yes:function (index,layero){
                        layer.close(index); //关闭弹层
                        location.reload("#role-table")
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        submit.trigger('click');
                    }
                });
            }
        });
    </script>

</body>
</html>