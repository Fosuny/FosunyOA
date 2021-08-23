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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
    <!-- 图标 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script type="text/javascript">

    </script>
</head>

<body>

    <div class="yadmin-body animated fadeIn">
            <div class="layui-form-item">
                <button type="button" class="layui-btn layui-btn-normal" onclick="useradd()" lay-event="add">新增</button>
                <div class="layui-inline">
                    <form class="layui-form yadmin-search-area input" id="formSearch" onsubmit="return false">
                        <label for="staffName" class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="staffName" autocomplete="off"
                                   id="staffName" class="layui-input">
                        </div>

                        <label for="staffMailbox" class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input type="text" name="staffMailbox" autocomplete="off"
                                   id="staffMailbox" class="layui-input">
                        </div>

                        <label for="status" class="layui-form-label">角色</label>
                        <div class="layui-input-inline">
                            <select name="status" id="status"></select>
                        </div>

                        <button id="searchQuery" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon layui-icon-search"></i></button>

                    </form>
                </div>
            </div>

        <table class="layui-table" lay-size="lg">
            <colgroup>
                <col width="90">
                <col width="150">
                <col width="90">
                <col width="90">
                <col width="90">
                <col width="210">
                <col width="100">
                <col width="130">
                <col width="130">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th style="text-align: center">序号</th>
                <th style="text-align: center;display: none">职工ID</th>
                <th style="text-align: center">姓名</th>
                <th style="text-align: center">年龄</th>
                <th style="text-align: center">性别</th>
                <th style="text-align: center">工龄</th>
                <th style="text-align: center">住址</th>
                <th style="text-align: center">手机</th>
                <th style="text-align: center">微信</th>
                <th style="text-align: center">QQ</th>
                <th style="text-align: center">邮箱</th>
                <th style="text-align: center">角色</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <tbody id="userSele"></tbody>
        </table>
    </div>
    <div id="demo7" style="text-align: center"></div>

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
        }).use(['table', 'element', 'form', 'dtree', 'tablePlug'], function () {
            var table = layui.table;
            var $ = layui.$;
            var form = layui.form;
            var dtree = layui.dtree;
            var tablePlug = layui.tablePlug;

            tablePlug.smartReload.enable(true);

            //用户表
            $(document).ready(function page(){

                $.ajax({
                    url:'${pageContext.request.contextPath}/oaIndex/userData?page='+pageCurr,
                    type:'post',
                    data:$("#searchQuery").serialize(),
                    dataType:'json',
                    success:function (data){
                        let html = '';
                        for(let i=0;i<data.length;i++){
                            var sex = null

                            if(data[i].staffSex === 0){
                                sex = '女'
                            }else{
                                sex = '男'
                            }
                            sum = i+1;
                            html +="<tr>"+
                                "<td style='text-align: center'>"+sum+"</td>"+
                                "<td style='text-align: center;display: none'>"+data[i].staffId+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffName+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffAge+"</td>"+
                                "<td style='text-align: center'>"+sex+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffWorkage+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffAddress+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffPhone+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffWechat+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffQq+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffMailbox+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffStatus+"</td>"+
                                "<td style='text-align: center'>"+
                                "<button type=\"button\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"useredit("+data[i].staffId+")\" lay-event=\"edit\"><i class=\"layui-icon layui-icon-edit\" title=\"编辑\"></i>编辑</button>" +
                                "<button type=\"button\" class=\"layui-btn layui-btn-danger layui-btn-xs\" onclick=\"userdel("+data[i].staffId+")\" lay-event='\"'del\"><i class=\"layui-icon layui-icon-delete\" title=\"删除\"></i>删除</button>"+
                                ""+
                                "</td>"+
                                "</tr>"
                        }
                        $("#userSele").html(html);

                        //调用laypage来实现下面的分页功能
                        layui.use(['laypage', 'layer'], function(){
                            var laypage = layui.laypage
                                ,layer = layui.layer;
                            //分页功能
                            laypage.render({
                                elem: 'demo7'
                                /*总条数*/
                                ,count:${count}
                                /*起始页*/
                                ,curr:pageCurr
                                /*每页显示条数*/
                                ,limit:pageLimit
                                /*连续也出现的页码数*/
                                ,groups:5
                                /*自定义排版*/
                                ,layout: ['count', 'prev', 'page', 'next', 'skip']
                                ,jump: function(obj,first){
                                    //首次不执行
                                    if(!first){
                                        pageCurr =  this.curr
                                        /*将当前页数值通过page函数传回到page函数内，使之成为该函数内的局部变量*/
                                        page(this.curr)
                                    }
                                }
                            });

                        });
                    }
                })
            })
            $("#searchQuery").click(function () {
                $.ajax({
                    url:'${pageContext.request.contextPath}/oaIndex/userData?page='+pageCurr,
                    data: $("#formSearch").serialize(),
                    type:'post',
                    dataType: 'json',
                    success:function (data){
                        let html = '';
                        for(let i=0;i<data.length;i++){
                            var sex = null

                            if(data[i].staffSex === 0){
                                sex = '女'
                            }else{
                                sex = '男'
                            }
                            sum = i+1;
                            html +="<tr>"+
                                "<td style='text-align: center'>"+sum+"</td>"+
                                "<td style='text-align: center;display: none'>"+data[i].staffId+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffName+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffAge+"</td>"+
                                "<td style='text-align: center'>"+sex+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffWorkage+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffAddress+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffPhone+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffWechat+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffQq+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffMailbox+"</td>"+
                                "<td style='text-align: center'>"+data[i].staffStatus+"</td>"+
                                "<td style='text-align: center'>"+
                                "<button type=\"button\" class=\"layui-btn layui-btn-normal layui-btn-xs\" onclick=\"useredit("+data[i].staffId+")\" lay-event=\"edit\"><i class=\"layui-icon layui-icon-edit\" title=\"编辑\"></i>编辑</button>" +
                                "<button type=\"button\" class=\"layui-btn layui-btn-danger layui-btn-xs\" onclick=\"userdel("+data[i].staffId+")\"  lay-event=\"del\"><i class=\"layui-icon layui-icon-delete\" title=\"删除\"></i>删除</button>"+
                                ""+
                                "</td>"+
                                "</tr>"
                        }
                        $("#userSele").html(html);

                        //调用laypage来实现下面的分页功能
                        layui.use(['laypage', 'layer'], function(){
                            var laypage = layui.laypage
                                ,layer = layui.layer;
                            //分页功能
                            laypage.render({
                                elem: 'demo7'
                                /*总条数*/
                                ,count:data.length
                                /*起始页*/
                                ,curr:pageCurr
                                /*每页显示条数*/
                                ,limit:pageLimit
                                /*连续也出现的页码数*/
                                ,groups:5
                                /*自定义排版*/
                                ,layout: ['count', 'prev', 'page', 'next', 'skip']
                                ,jump: function(obj,first){
                                    //首次不执行
                                    if(!first){
                                        pageCurr =  this.curr
                                        /*将当前页数值通过page函数传回到page函数内，使之成为该函数内的局部变量*/
                                        page(this.curr)
                                    }
                                }
                            });

                        });
                    }
                })
            })

            dtree.on("node('deptTree')" ,function(obj) {
                var typeDom = layui.$('#deptId');
                console.log(typeDom.val() , obj.param.nodeId);
                console.log(typeDom.val() === obj.param.nodeId);
                if (typeDom.val() === obj.param.nodeId) {
                    typeDom.val('');
                    layui.$("input[dtree-id='deptTree']").val('请选择');
                } else {
                    typeDom.val(obj.param.nodeId)
                }
            });

            // 行点击事件 重置密码
            table.on('tool', function (obj) {
                var data = obj.data;
                var event = obj.event;
                if (event === 'edit') {
                    edit(data.userId);
                } else if (event === 'del') {
                    layer.confirm("确定删除用户吗?", {icon: 3, title: '提示'},
                        function (index) {
                            obj.del();
                            layer.close(index);
                            parent.layer.msg("删除成功", {icon: 6});
                        }, function (index) {
                            layer.close(index);
                        }
                    );
                }
            });



            form.on('submit(search)', function (form) {
                table.reload('user-table', {
                    where: form.field
                });
                return false;
            });

        });

        //新增用户
        function useradd(){
            layer.open({
                type: 2
                ,title: '增加用户'
                ,content: '${pageContext.request.contextPath}/oaIndex/userAdd'
                ,maxmin: true
                ,area: ['620px', '620px']
                ,btn: ['确定', '取消']
                ,end:function(){//点睛之笔，此端代码便是精髓之处，layui监听到弹窗销毁之后回调了一个end函数，通过这个end函数我们就能刷新弹窗2的数据

                }
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

        //编辑用户
        function useredit(staffId){
            layer.open({
                type: 2
                ,title: '编辑用户'
                ,content: '${pageContext.request.contextPath}/oaIndex/userEdit?staffId='+staffId
                ,maxmin: true
                ,area: ['620px', '600px']
                ,btn: ['确定', '取消']
                ,end:function(){//点睛之笔，此端代码便是精髓之处，layui监听到弹窗销毁之后回调了一个end函数，通过这个end函数我们就能刷新弹窗2的数据
                    treeObj.reAsyncChildNodes(null, "refresh");
                }
                ,yes: function(index, layero){
                    layer.close(index);
                    location.reload("#userSele")
                    var iframeWindow = window['layui-layer-iframe'+ index]
                        ,submitID = 'LAY-user-front-submit'
                        ,submit = layero.find('iframe').contents().find('#'+ submitID);

                    submit.trigger('click');
                }
            });
        }

        //删除用户
        function userdel(staffId){
            var text = '是否确认删除该用户？';
            layer.open({
                type:1,
                title:'删除提示',
                content:'<div style="padding: 25px 20px;text-align: center">'+ text +'</div>',
                area:['256px', '167px'],
                btn:['删除','取消'],
                end:function(){//点睛之笔，此端代码便是精髓之处，layui监听到弹窗销毁之后回调了一个end函数，通过这个end函数我们就能刷新弹窗2的数据
                    treeObj.reAsyncChildNodes(null, "refresh");
                },
                yes:function (index,layero){
                    $.ajax({
                        url:'${pageContext.request.contextPath}/oaIndex/userdel?staffId='+staffId,
                        type:'post',
                        data:{'staffId':staffId},
                        dataType:'json',
                        success:function (){
                            console.log(staffId)
                        }
                    })
                    layer.close(index);
                    location.reload("#userSele")
                }
            })
            console.log(123)
        }
    </script>
</body>
</html>