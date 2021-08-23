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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" type="text/css">
</head>
<body>
    <ul id="treeDemo" class="ztree" style="margin-left: 20px;margin-top: 25px"></ul>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
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
                url:"${pageContext.request.contextPath}/oaRole/treedatauupdate?roleId=${roleId}",//设置异步获取节点的 URL 地址
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

                    let d = "roleId=${roleId}";
                    $.each(node,function (i,node) {
                        d += "&nodes="+node.id;
                    })
                    $.ajax({
                        url:'${pageContext.request.contextPath}/oaRole/insaut?roleId=${roleId}',
                        data:d,
                        type:'post',
                        success:function (){console.log("SUCCESS!")}
                    })
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

        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
    </script>
</body>
</html>