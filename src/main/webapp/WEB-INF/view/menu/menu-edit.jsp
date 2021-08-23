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
    <title>添加菜单</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/extend/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/extend/font/dtreefont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/extend/autocomplete.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font_1179208_6sxekl4z8m7.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <SCRIPT type="text/javascript">
        var setting = {
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
                contentType:"application/json",//设置 Ajax 提交参数的数据类型为 JSON 格式
                dataType:"text",//设置 Ajax 获取的数据类型为 纯文本
                dataFilter: filter
            },
            callback: {//回调函数
                onClick: function(event, treeId, treeNode){
                    $("#hiddenpId").val(treeNode.id);
                    $("#parentName").val(treeNode.name);
                }
            },
            edit: {
                enable: false
            }
        };
        function filter(treeId, parentNode, childNodes) {
            if (!childNodes) return null;
            for (var i=0, l=childNodes.length; i<l; i++) {
                childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
            }
            return childNodes;
        }

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting);
        });
    </SCRIPT>
</head>
<body>
    <div class="yadmin-body animated fadeIn">
        <form action="#" method="post" onsubmit="return false" id="updateform" class="layui-form layui-form-pane">
            <input type="hidden" id="authorityId" name="authorityId"/>
            <div class="layui-form-item">
                <label for="authorityList" class="layui-form-label">
                    页面名称
                </label>
                <div class="layui-input-block">
                    <input type="text" id="authorityList" name="authorityList" value=""
                           lay-verify="required" lay-vertype="tips"
                           autocomplete="off" placeholder="请输入页面名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="authorityUrl" class="layui-form-label">
                    URL
                </label>
                <div class="layui-input-block">
                    <input type="text" id="authorityUrl" value="" name="authorityUrl"
                           lay-verify="required" lay-vertype="tips"
                           autocomplete="off" class="layui-input" placeholder="请输入需要授权的 URL">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="authorityPermission" class="layui-form-label">
                    权限标识
                </label>
                <div class="layui-input-block">
                    <input type="text" id="authorityPermission" value="" name="authorityPermission"
                           lay-verify="required" lay-vertype="tips"
                           autocomplete="off" class="layui-input" placeholder="">
                </div>
            </div>
            <%--当前为新增权限节点的pId隐藏域--%>
            <input type="hidden" name="pId" value="" id="hiddenpId"/>

            <div class="layui-form-item" style="width:270px">
                <label class="layui-form-label" id="seleQuery">
                    上级菜单
                </label>
                <div class="layui-input-block">
                    <div class="layui-unselect layui-form-select" id="parentNameDiv">
                        <div class="layui-select-title">
                            <input type="text" id="parentName"
                                   placeholder="请选择" class="layui-input layui-unselect" readonly>
                            <input type="hidden" name="parentId" id="parentId">
                            <i class="layui-edge"></i>
                        </div>
                    </div>
                    <div id="divdis" style="width: 160px;height: 38px;background-color: #8a8f97;opacity: 0.1;position: absolute;margin-top: -38px;display: none"></div>
                    <div class="layui-card dtree-select" id="parentTreeDiv">
                        <div class="layui-card-body">
                            <div id="toolbarDiv">
                                <ul id="treeDemo" class="ztree" style="margin-left: -15px"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="position: absolute;margin-top: -37px;margin-left: 164px;">
                            <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="父|无">
                        </div>
                    </div>
                </div>
            </div>
            <fieldset class="layui-elem-field">
                <legend>备注</legend>
                <div class="layui-field-box">
                    <div class="layui-form-mid layui-word-aux">
                        URL 支持 ?, *, ** 通配符。<br>
                        外部链接以 http(s):// 开头。
                    </div>
                </div>
            </fieldset>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left:0;text-align:center;">
                    <input type="hidden" name="menuId" value="">
                    <input type="hidden" name="orderNum" value="">
                    <button class="layui-btn layui-btn-blue" lay-submit="" lay-filter="add" id="LAY-user-front-submit" style="display: none" >增加</button>
                </div>
            </div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <!-- 公共JS -->
    <script type="text/javascript">
        layui.config({
            base: "${pageContext.request.contextPath}/static/js/",
        }).use(["yadmin", "tabRightMenu"], function () {
            var yadmin = layui.yadmin;
            var tabRightMenu = layui.tabRightMenu;
            tabRightMenu.render({
                filter: "lay-tab",
                pintabIDs: ["main"],
                width: 110,
            });
        });
    </script>
    <script type="text/javascript">
        /*权限修改数据回调*/
        $(document).ready(function (){
            $.ajax({
                url: '${pageContext.request.contextPath}/oaRole/menuEditQuery?id=${id}',
                type: 'post',
                dataType: 'json',
                success:function (data){
                    $("#authorityId").val(data.authorityId);
                    $("#authorityList").val(data.authorityList);
                    $("#authorityUrl").val(data.authorityUrl);
                    $("#authorityPermission").val(data.authorityPermission);
                    $("#hiddenpId").val(data.pId);
                    $.ajax({
                        url:'${pageContext.request.contextPath}/oaRole/menuEditQuery',
                        data:{"id":data.pId},
                        type:'post',
                        dataType:'json',
                        success:function (data){
                            $("#parentName").val(data.authorityList);
                        }
                    })
                }
            })
        });
        /*权限节点修改后数据提交*/
        $("#LAY-user-front-submit").click(function (){
            $.ajax({
                url:'${pageContext.request.contextPath}/oaRole/updateload',
                type:'post',
                data:$("#updateform").serialize(),
                dataType:'json'
            })
        })

        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

            //监听指定开关
            form.on('switch(switchTest)', function(data){
                /*获取开关状态*/
                var switchon = data.elem.checked;
                /*判断开关状态*/
                if(switchon == true){
                    document.getElementById("divdis").style.display="none"
                    $("#parentName").val("请选择父级节点");
                    $("#hiddenpId").val(0);
                }else if(switchon == false){
                    document.getElementById("divdis").style.display="block"
                    $("#parentName").val("无父级节点");
                    $("#hiddenpId").val(null);
                }
            });

        })

        layui.config({
            base: '${pageContext.request.contextPath}/static/layui/extend/'
        }).use(['form', 'layer', 'autocomplete', 'dtree', 'iconPicker'], function () {
            var $ = layui.jquery,
                form = layui.form,
                layer = layui.layer,
                autocomplete = layui.autocomplete,
                dtree = layui.dtree,
                iconPicker = layui.iconPicker;

            $("#parentName").on("click",function(){
                $(this).toggleClass("layui-form-selected");
                $("#parentTreeDiv").toggleClass("layui-show layui-anim layui-anim-upbit");
            });

            dtree.on("node(parentTree)", function(obj){
                console.log(obj);
                $("#parentName").val(obj.param.context);
                $("#parentId").val(obj.param.nodeId);
                $("#parentNameDiv").toggleClass("layui-form-selected");
                $("#parentTreeDiv").toggleClass("layui-show layui-anim layui-anim-upbit");
            });
        });
    </script>

</body>
</html>