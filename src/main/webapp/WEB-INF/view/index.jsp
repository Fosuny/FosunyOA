<%--
  Created by IntelliJ IDEA.
  User: SPR28
  Date: 2021/7/7
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>FosunyOA 办公 | 主页</title>
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/images/favicon.ico">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/images/favicon.ico">
    <!-- layui样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <!-- Y-Admin核心样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/yadmin.css">
    <!-- 公共样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <!-- 图标 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/remixicon/fonts/remixicon.css">
    <!-- 首页样式（只为此页面使用） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
</head>

<body class="layui-layout-body">

    <div class="layui-layout layui-layout-admin">

        <div class="layui-header">
            <!-- logo 区域 -->
            <div class="layui-logo">
                <img src="${pageContext.request.contextPath}/static/images/security.png" alt="logo" style="margin-left: -5px;" />
                <cite>
                    FosunyOA&emsp;
                </cite>
            </div>

            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item" lay-unselect>
                    <a lay-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right"></i>
                    </a>
                </li>
                <!-- 面包屑 -->
                <span class="layui-breadcrumb layui-anim layui-anim-up">
                    <a><cite>首页</cite></a>
                </span>
            </ul>

            <!-- 头像区域 -->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item feature-items">
                    <a lay-event="tag" title="便签"><i class="ri-quill-pen-line"></i></a>
                </li>
                <li class="layui-nav-item feature-items">
                    <a lay-event="github" title="Github 地址">
                        <i class="ri-github-fill"></i>
                    </a>
                </li>
                <li class="layui-nav-item feature-items">
                    <a lay-event="todo" title="待办事项"><i class="ri-pages-line"></i></a>
                </li>
                <li class="layui-nav-item feature-items">
                    <a id="screenFull" lay-event="screenFull" title="全屏">
                        <i class="ri-fullscreen-line"></i>
                    </a>
                    <a id="screenRestore" lay-event="screenRestore" title="退出全屏" style="display: none;">
                        <i class="ri-fullscreen-exit-line"></i>
                    </a>
                </li>
                <li class="layui-nav-item user-selection">
                    <a>
                        <img src="${pageContext.request.contextPath}/static/images/avatar/1.jpg" style="margin-right: 10px" class="layui-nav-img" alt="头像">
                        <cite>游客</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd lay-unselect>
                            <a lay-event="userInfo">基本资料</a>
                        </dd>
                        <dd lay-unselect>
                            <a lay-event="editPwd">修改密码</a>
                        </dd>
                        <hr>
                        <dd lay-unselect>
                            <a onclick="logout()">退出登录</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>

        <!-- 左侧导航区域 -->
        <div class="layui-side ">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="lay-nav" lay-accordion="true">
                    <li class="layui-nav-item">
                        <a lay-url="${pageContext.request.contextPath}/oaIndex/home" lay-id="home">
                            <i class="ri-home-8-line"></i>&emsp;<cite>首页</cite>
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="#" lay-url="#">
                            <i class="ri-user-3-line"></i>&emsp;<cite>个人中心</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/oanav/userInfo" lay-url="${pageContext.request.contextPath}/oanav/editInfo">
                                    <cite>我的资料</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/404.html" lay-url="view/abnormalPage/404.html">
                                    <cite>待办事项</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/oanav/editPwd" lay-url="${pageContext.request.contextPath}/oanav/editPassword">
                                    <cite>修改密码</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/500.html" lay-url="view/abnormalPage/500.html">
                                    <cite>联系人</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/500.html" lay-url="view/abnormalPage/500.html">
                                    <cite>我的文件</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="#" lay-url="#">
                            <i class="ri-shield-keyhole-line"></i>&emsp;<cite>权限管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/oaIndex/userList" lay-url="${pageContext.request.contextPath}/oaIndex/userList">
                                    <cite>用户管理</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/oaRole/roleList" lay-url="${pageContext.request.contextPath}/oaRole/roleList">
                                    <cite>角色管理</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/oaIndex/menuList" lay-url="${pageContext.request.contextPath}/oaRole/menuList">
                                    <cite>菜单权限</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="https://www.yijianku.com/" lay-url="https://www.yijianku.com/">
                            <i class="ri-menu-line"></i>&emsp;<cite>任务资源</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="view/abnormalPage/403.html" lay-url="view/abnormalPage/403.html">
                                    <cite>内部待办</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/404.html" lay-url="view/abnormalPage/404.html">
                                    <cite>客户待办</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="https://remixicon.com/" lay-url="https://remixicon.com/">
                            <i class="ri-checkbox-multiple-line"></i>&emsp;<cite>任务流程</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="view/abnormalPage/403.html" lay-url="view/abnormalPage/403.html">
                                    <cite>请假申请</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/404.html" lay-url="view/abnormalPage/404.html">
                                    <cite>会议申请</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="https://remixicon.com/" lay-url="https://remixicon.com/">
                            <i class="ri-body-scan-fill"></i>&emsp;<cite>行政办公</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="view/abnormalPage/403.html" lay-url="view/abnormalPage/403.html">
                                    <cite>请假申请</cite>
                                </a>
                            </dd>
                            <dd>
                                <a lay-id="view/abnormalPage/404.html" lay-url="view/abnormalPage/404.html">
                                    <cite>会议申请</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a lay-id="https://remixicon.com/" lay-url="https://remixicon.com/">
                            <i class="ri-settings-6-fill"></i>&emsp;<cite>系统管理</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-id="${pageContext.request.contextPath}/system/logtable" lay-url="${pageContext.request.contextPath}/system/logtable">
                                    <cite>操作日志</cite>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a onclick="announcement()">
                            <i class="ri-settings-4-line"></i>&emsp;<cite>公告内容</cite>
                        </a>
                    </li>
                </ul>

                <div id="message">
                    <div class="notification-box" lay-event="notification">
                        <div class="notification-bell">
                            <span class="bell-top"></span>
                            <span class="bell-middle"></span>
                            <span class="bell-bottom"></span>
                            <span class="bell-rad"></span>
                        </div>
                    </div>
                    <h3>消息通知</h3>
                    <p>春已至,花已开,一切美好都将到来!</p>
                </div>

            </div>
        </div>

        <div class="layui-body">
            <div class="layui-pagetabs">
                <div class="layui-icon admin-tabs-control layui-icon-refresh-3" lay-event="refresh"></div>
                <div class="layui-tab" lay-unauto lay-allowclose="true" lay-filter="lay-tab">
                    <ul class="layui-tab-title">
                        <li lay-id="home" lay-url="${pageContext.request.contextPath}/oaIndex/home" class="layui-this">
                            <!-- <i class="ri-home-heart-line ri-xl"></i> -->
                            <i class="ri-home-8-line ri-xl"></i>
                        </li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <iframe src="${pageContext.request.contextPath}/oaIndex/home" class="layui-iframe"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 底部固定区域 -->
        <div class="layui-footer">
            copyright © 2020 Y-Admin all rights reserved.
            <ul class="tabbar">
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                        <path fill="none" d="M0 0h24v24H0z" />
                        <path
                            d="M12.414 5H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2zM15 13v-1a3 3 0 0 0-6 0v1H8v4h8v-4h-1zm-2 0h-2v-1a1 1 0 0 1 2 0v1z" />
                    </svg>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                        <path fill="none" d="M0 0h24v24H0z" />
                        <path
                            d="M21 5a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2H16v2h2V5h3zm-3 8h-2v2h-2v3h4v-5zm-2-2h-2v2h2v-2zm2-2h-2v2h2V9zm-2-2h-2v2h2V7z" />
                    </svg>
                </li>
                <li>
                    <div class="fileAdd">
                        <ul>
                            <li class="word"></li>
                            <li class="powerpoint"></li>
                            <li class="excel"></li>
                        </ul>
                        <div>
                            <span></span>
                        </div>
                    </div>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                        <path fill="none" d="M0 0h24v24H0z" />
                        <path
                            d="M12.414 5H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2zM11 13.05a2.5 2.5 0 1 0 2 2.45V11h3V9h-5v4.05z" />
                    </svg>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                        <path fill="none" d="M0 0h24v24H0z" />
                        <path
                            d="M12.414 5H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2zM12 13a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm-4 5h8a4 4 0 1 0-8 0z" />
                    </svg>
                </li>
            </ul>

        </div>

        <!-- 移动端遮罩 -->
        <div class="site-mobile-shade"></div>
    </div>
    <!-- layui JS -->
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <!-- jQuery JS -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <!-- 公共JS -->
    <script type="text/javascript">
        /*用户姓名*/
        $(document).ready(function (){
            $.ajax({
                url:'${pageContext.request.contextPath}/loginOA/loginUsermis',
                type:'post',
                dataType:'json',
                success:function (data){

                    let cite = document.getElementsByTagName("cite")[2];
                    cite.innerHTML=data.staffName
                }
            })
            /*用户头像*/
            $.ajax({
                url:'${pageContext.request.contextPath}/loginOA/useravatar',
                type:'post',
                dataType:'json',
                success:function (data){

                    let image = document.getElementsByTagName("img")[1]
                    image.src = "${pageContext.request.contextPath}/static/images/avatar/"+data.userImage;
                }
            })
        })

        function logout(){
            layer.open({
                type: 1
                ,content: '<div style="padding: 20px 60px;">'+'是否确认退出登录！'+'</div>'
                ,btn: ['退出','手误']
                ,btnAlign: 'c'
                ,shade: 0
                ,yes: function(){
                    location.href = '${pageContext.request.contextPath}/loginOA/logout'
                    layer.closeAll();
                }
            });
        }

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
        function announcement(){
            layui.use('layer', function() { //独立版的layer无需执行这一句
                var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '300px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['火速围观', '残忍拒绝']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br> layer 只是作为 layui 的一个弹层模块，由于其用户基数较大，所以常常会有人以为 layui 是 <del>layerui</del><br><br>layer 虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级 ^_^</div>'
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'https://github.com/Fosuny'
                            ,target: '_blank'
                        });
                    }
                });
            })
        }
    </script>

</body>

</html>