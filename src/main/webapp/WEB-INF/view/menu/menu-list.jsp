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
    <title>菜单列表</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/yadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/remixicon/fonts/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css" type="text/css">
</head>
<body>
    <div style="height: 100%">
        <div style="height: 100%">
            <div style="padding: 20px; background-color: #F2F2F2;height:100%;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">FosunyOA 系统菜单树</div>
                            <div class="layui-card-body" id="toolbarDiv">
                                <%--<h1>ZTREE的 Metro 风格</h1>
                                <h6>[ 当前为角色功能授权 ]</h6>--%>
                                <ul id="treeDemo" class="ztree" style="margin-left: 25px"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md9">
                        <div class="layui-card">
                            <div class="layui-card-header" id="card-header">
                                菜单列表
                                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add()" lay-event="add" style="float: right;margin-top: 10px;margin-right: 20px"><i class="layui-icon layui-icon-addition"></i>新增</button>
                            </div>

                            <div class="layui-card-body">
                                <table class="layui-table" lay-size="lg">
                                    <colgroup>
                                        <col width="90">
                                        <col width="140">
                                        <col width="500">
                                        <col width="141">
                                        <col width="141">
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">序号</th>
                                        <th style="text-align: center;display: none">ID</th>
                                        <th style="text-align: center">页面名称</th>
                                        <th style="text-align: center">URL</th>
                                        <th style="text-align: center">权限标识符</th>
                                        <th style="text-align: center">页面状态</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="authbody"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
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
    <script type="text/javascript">
        var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            check: {
                enable: false
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
                    $(document).ready(function (){
                        $.ajax({
                            url:'${pageContext.request.contextPath}/oaRole/authorityQuery',
                            type:'post',
                            data:{"id":treeNode.id},
                            dataType:'json',
                            success:function (data){
                                let html = '';
                                for(let i=0;i<data.length;i++){
                                    var id = data[i].authorityId
                                    sum = i+1;
                                    html +="<tr>"+
                                        "<td style='text-align: center'>"+sum+"</td>"+
                                        "<td style='text-align: center;display: none'>"+id+"</td>"+
                                        "<td style='text-align: center'>"+data[i].authorityList+"</td>"+
                                        "<td style='text-align: center'>"+data[i].authorityUrl+"</td>"+
                                        "<td style='text-align: center'>"+data[i].authorityPermission+"</td>"+
                                        "<td style='text-align: center'>"+data[i].authorityListswitch+"</td>" +
                                        "<td>" +
                                        "<button type=\"button\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"edit("+id+")\" lay-event=\"edit\"><i class=\"layui-icon layui-icon-edit\" title=\"编辑\"></i>编辑</button>" +
                                        "<button type=\"button\" class=\"layui-btn layui-btn-danger layui-btn-xs\" onclick=\"del("+id+")\" lay-event='\"'del\"><i class=\"layui-icon layui-icon-delete\" title=\"删除\"></i>删除</button>"+
                                        "</td>"+
                                        "</tr>"
                                }
                                $("#authbody").html(html);
                            }
                        })
                    })
                },
                onRename:function (event, treeId, treeNode){
                    /*权限编辑*/
                    layer.open({
                        type: 2
                        ,title:'编辑权限节点'
                        ,content: '${pageContext.request.contextPath}/oaRole/menuEdit?id='+treeNode.id
                        ,maxmin: true
                        ,area: ['400px', '600px']
                        ,btn: ['完成', '取消']
                        ,yes: function(index, layero){
                            layer.close(index); //关闭弹层
                            location.reload("#userSele")
                            var iframeWindow = window['layui-layer-iframe'+ index]
                                ,submitID = 'LAY-user-front-submit'
                                ,submit = layero.find('iframe').contents().find('#'+ submitID);
                            submit.trigger('click');
                        }
                    });
                },
                /*权限节点删除*/
                onRemove:function (event, treeId, treeNode){
                    layer.open({
                        type: 1
                        ,content: '<div style="padding: 20px 60px;">'+'权限节点删除成功！'+'</div>'
                        ,btn: '完成'
                        ,btnAlign: 'c'
                        ,shade: 0
                        ,yes: function(){
                            $.ajax({
                                url:'${pageContext.request.contextPath}/oaRole/ztreedelNode',
                                data:{"id":treeNode.id},
                                type:'post'
                            })
                            layer.closeAll();
                        }
                    });
                    $.ajax({
                        url:'${pageContext.request.contextPath}/oaRole/ztreedelNode',
                        data:{"id":treeNode.id},
                        type:'post'
                    })
                },
            },
            edit: {
                enable: true
            }
        };

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting);
        });

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                layer.open({
                    type: 2
                    ,title:'新增权限节点'
                    ,content: '${pageContext.request.contextPath}/oaRole/menuAdd'
                    ,maxmin: true
                    ,area: ['400px', '600px']
                    ,btn: ['完成', '取消']
                    ,yes: function(index, layero){
                        layer.close(index); //关闭弹层
                        location.reload("#userSele")
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);
                        submit.trigger('click');
                    }
                });
                return false;
            });

        };

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };


        layui.config({
            base: '${pageContext.request.contextPath}/static/layui/extend/'
        }).use(['table', 'element', 'form', 'dtree', 'tablePlug'], function () {
            var table = layui.table;
            var $ = layui.$;
            var form = layui.form;
            var dtree = layui.dtree;
            var tablePlug = layui.tablePlug;

            tablePlug.smartReload.enable(true);



            $(document).ready(function (){
                $.ajax({
                    url:'${pageContext.request.contextPath}/oaRole/authorityQuery',
                    type:'post',
                    dataType:'json',
                    success:function (data){
                        let html = '';
                        for(let i=0;i<data.length;i++){
                            var id = data[i].authorityId
                            sum = i+1;
                            html +="<tr>"+
                                "<td style='text-align: center'>"+sum+"</td>"+
                                "<td style='text-align: center;display: none'>"+id+"</td>"+
                                "<td style='text-align: center'>"+data[i].authorityList+"</td>"+
                                "<td style='text-align: center'>"+data[i].authorityUrl+"</td>"+
                                "<td style='text-align: center'>"+data[i].authorityPermission+"</td>"+
                                "<td style='text-align: center'>"+data[i].authorityListswitch+"</td>" +
                                "<td>" +
                                    "<button type=\"button\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"edit("+id+")\" lay-event=\"edit\"><i class=\"layui-icon layui-icon-edit\" title=\"编辑\"></i>编辑</button>" +
                                    "<button type=\"button\" class=\"layui-btn layui-btn-danger layui-btn-xs\" onclick=\"del("+id+")\" lay-event='\"'del\"><i class=\"layui-icon layui-icon-delete\" title=\"删除\"></i>删除</button>"+
                                "</td>"+
                                "</tr>"
                        }
                        $("#authbody").html(html);
                    }
                })
            })
        });
        function del(id) {
            layer.open({
                type: 1
                ,content: '<div style="padding: 20px 60px;">'+'权限节点删除成功！'+'</div>'
                ,btn: '完成'
                ,btnAlign: 'c'
                ,shade: 0
                ,yes: function(){
                    $.ajax({
                        url:'${pageContext.request.contextPath}/oaRole/ztreedelNode',
                        data:{"id":id},
                        type:'post'
                    })
                    layer.closeAll();
                }
            });
        }

        function edit(id) {
            layer.open({
                type: 2
                ,title:'编辑权限节点'
                ,content: '${pageContext.request.contextPath}/oaRole/menuEdit?id='+id
                ,maxmin: true
                ,area: ['400px', '600px']
                ,btn: ['确定', '取消']
                ,yes: function(index, layero){
                    layer.close(index); //关闭弹层
                    location.reload("#userSele")
                    var iframeWindow = window['layui-layer-iframe'+ index]
                        ,submitID = 'LAY-user-front-submit'
                        ,submit = layero.find('iframe').contents().find('#'+ submitID);

                    submit.trigger('click');
                }
            });
        }
        function add(){
            layer.open({
                type: 2
                ,title:'新增权限节点'
                ,content: '${pageContext.request.contextPath}/oaRole/menuAdd'
                ,maxmin: true
                ,area: ['400px', '600px']
                ,btn: ['完成', '取消']
                ,yes: function(index, layero){
                    layer.close(index); //关闭弹层
                    location.reload("#userSele")
                    var iframeWindow = window['layui-layer-iframe'+ index]
                        ,submitID = 'LAY-user-front-submit'
                        ,submit = layero.find('iframe').contents().find('#'+ submitID);
                    submit.trigger('click');
                }
            });
        }
    </script>
</body>
</html>