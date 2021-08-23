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
    <title>用户管理</title>
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
                    <label for="username" class="layui-form-label">操作人</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" autocomplete="off"
                               id="username" class="layui-input">
                    </div>

                    <label for="email" class="layui-form-label" style="width: 100px">请求路径</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" autocomplete="off"
                               id="email" class="layui-input">
                    </div>

                    <label for="email" class="layui-form-label">参数</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" autocomplete="off"
                               class="layui-input">
                    </div>

                    <label for="email" class="layui-form-label" style="width: 100px">方法描述</label>
                    <div class="layui-input-inline">
                        <input type="text" name="email" autocomplete="off"
                               class="layui-input">
                    </div>

                    <button lay-submit="" lay-filter="search" class="layui-btn layui-btn-sm layui-btn-primary table-action">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
            </div>
        </form>

        <table class="layui-hide" id="user-table"></table>
    </div>

    <script type="text/html" id="toolbar"><span>&nbsp;&nbsp;&nbsp;FosunyOA 日志记录</span></script>

    <script type="text/html" id="column-toolbar">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">查看</button>
    </script>

    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <!-- 公共JS -->
    <script type="text/javascript">
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
        }).use(['table', 'element', 'form', 'dtree', 'tablePlug'], function () {
            var table = layui.table;
            var $ = layui.$;
            var form = layui.form;
            var dtree = layui.dtree;
            var tablePlug = layui.tablePlug;

            tablePlug.smartReload.enable(true);

            table.render({
                elem: '#user-table',
                url: '${pageContext.request.contextPath}/system/logDataQuery',
                page: true,
                toolbar: '#toolbar',
                smartReloadModel: true,
                cols: [
                    [
                        {type: 'numbers', title: '序号', width: 60},
                        {field: 'id', title: 'ID', hide: true},
                        {field: 'operationUser', title: '操作人', minWidth: 160},
                        {field: 'path', title: '请求路径', minWidth: 160},
                        {field: 'time', title: '方法执行耗时',align: 'center', minWidth: 160},
                        {field: 'parameter', title: '方法入参', align: 'center', width: 180},
                        {field: 'title', title: '操作方法',align: 'center', width: 180},
                        {field: 'action', title: '方法描述',align: 'center', width: 180},
                        {field: 'dateTime', title: '操作时间',align: 'center', width: 180},
                        {title: '操作', fixed: 'right', align: 'center', toolbar: '#column-toolbar'}
                    ]
                ]
            });

            function edit(id) {
                layer.open({
                    content: '/user/' + id,
                    title: "日志信息",
                    area: ['40%', '85%'],
                    type: 2,
                    maxmin: true,
                    shadeClose: true,
                    end: function () {
                        table.reload('user-table');
                    }
                });
            }

            form.on('submit(search)', function (form) {
                table.reload('user-table', {
                    where: form.field
                });
                return false;
            });

        });
    </script>
</body>
</html>