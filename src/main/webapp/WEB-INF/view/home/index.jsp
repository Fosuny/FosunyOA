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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/static/remixicon/fonts/remixicon.css" rel="stylesheet">
    <style>
        /** 初始化 */
        html #layuicss-easyxin {
            display: none;
            width: 1989px
        }

        [template] {
            display: none
        }

        [lay-href] {
            cursor: pointer
        }

        * {
            font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
        }

        body {
            color: #595959;
            background-color: #f0f2f5;

        }

        .layui-body {
            left: 0;

        }

        .layui-layout-body {
            overflow: auto;

        }

        .layui-layout-admin {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            overflow: hidden;
            -webkit-transition: left .3s ease, right .3s ease;
            transition: left .3s ease, right .3s ease;
        }

        /** body */
        .layui-layout-admin .layui-body {
            position: absolute;
            left: 60px;
            top: 50px;
            z-index: auto;
            overflow: auto;
            -webkit-transition: left .3s;
            transition: left .3s;
            -webkit-overflow-scrolling: touch
        }

        .admin-iframe {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%
        }

        .layui-fluid {
            padding: 14px;
        }

        /** footer */
        .layui-layout-admin .layui-footer {
            position: absolute;
            left: 60px;
            background: #fff;
            box-sizing: border-box;
            border-top: 1px solid #f5f7f9;
            -webkit-transition: left .3s;
            transition: left .3s;
            overflow: hidden
        }

        .close-footer .layui-layout-admin .layui-footer {
            display: none
        }

        .close-footer .layui-layout-admin .layui-body {
            bottom: 0
        }

        /** side */
        .layui-layout-admin .layui-side {
            position: absolute;
            top: 50px;
            width: 60px;
            background-color: #191a23;
            box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, .05);
            -webkit-transition: width .3s;
            transition: width .3s;
            -webkit-user-select: none;
            user-select: none;
            z-index: 1000
        }

        .layui-layout-admin .layui-side .layui-side-scroll {
            width: 255px
        }

        .layui-layout-admin .layui-side .layui-nav {
            width: 60px;
            background-color: transparent
        }

        .layui-layout-admin .layui-side>.layui-side-scroll>.layui-nav:first-child {
            margin-top: 10px
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item>a {
            cursor: pointer;
            padding-top: 5px;
            padding-bottom: 5px;
            overflow: visible
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item a {
            -webkit-transition: color .3s, background-color .3s;
            transition: color .3s, background-color .3s
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-more {
            right: 15px
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item>.layui-nav-child {
            position: static
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item .layui-nav-child a {
            padding-left: 50px;
            cursor: pointer
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item .layui-nav-child .layui-nav-child a {
            padding-left: 70px
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item .layui-nav-child .layui-nav-child .layui-nav-child a {
            padding-left: 90px
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item .layui-nav-child .layui-nav-child .layui-nav-child .layui-nav-child a {
            padding-left: 110px
        }

        /** 侧导航折叠状态下样式 */
        .layui-layout-admin .layui-side .layui-nav .layui-nav-item>a .layui-nav-more,
        .layui-layout-admin .layui-side .layui-nav .layui-nav-item>a>cite,
        .layui-layout-admin .layui-side .layui-nav .layui-nav-itemed>.layui-nav-child {
            display: none !important
        }

        .layui-layout-admin .layui-side .layui-nav li.layui-nav-itemed>a {
            background: rgba(0, 0, 0, .8)
        }

        .layui-layout-admin .layui-side .layui-nav .layui-nav-item>a>.layui-icon {
            font-size: 16px;
            -webkit-transition: font-size .3s;
            transition: font-size .3s
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child {
            position: fixed;
            top: 60px;
            left: 60px;
            padding: 5px;
            min-width: 150px;
            display: block !important;
            background: 0 0 !important
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child:before {
            content: '';
            position: absolute;
            right: 5px;
            left: 5px;
            bottom: 0;
            top: 0;
            border-radius: 4px;
            background: #191a23;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1)
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child dd:first-child>.layui-nav-child {
            margin-top: -5px
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child dd:last-child>.layui-nav-child.show-top {
            margin-top: 5px
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child>dd>a {
            padding: 0 20px !important
        }

        .layui-layout-admin .layui-side .layui-nav .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more {
            border-color: transparent transparent transparent rgba(255, 255, 255, .7);
            right: 7px;
            margin-top: -6px
        }

        .layui-layout-admin .layui-side .layui-nav.arrow1 .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more,
        .layui-layout-admin .layui-side .layui-nav.arrow2 .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more {
            -o-transform: rotate(0);
            -ms-transform: rotate(0);
            -moz-transform: rotate(0);
            -webkit-transform: rotate(0);
            transform: rotate(0);
            width: 6px;
            height: 10px;
            right: 10px;
            margin-top: -5px;
            font-weight: 600
        }

        .layui-layout-admin .layui-side .layui-nav.arrow1 .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more:before,
        .layui-layout-admin .layui-side .layui-nav.arrow2 .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more:before {
            content: "\e602";
            left: -4px;
            top: -2px
        }

        .layui-layout-admin .layui-side .layui-nav.arrow2 .admin-nav-hover>.layui-nav-child>dd>a .layui-nav-more:before {
            -o-transform: rotate(0);
            -ms-transform: rotate(0);
            -moz-transform: rotate(0);
            -webkit-transform: rotate(0);
            transform: rotate(0)
        }

        /** side hover 进入动画 */
        .ew-anim-drop-in {
            -webkit-animation: ewTransitionDropIn .3s ease-in-out;
            animation: ewTransitionDropIn .3s ease-in-out;
            -webkit-transform-origin: 0 0;
            transform-origin: 0 0
        }

        @-webkit-keyframes ewTransitionDropIn {
            from {
                opacity: 0;
                -webkit-transform: scale(.8)
            }

            to {
                opacity: 1;
                -webkit-transform: scale(1)
            }
        }

        @keyframes ewTransitionDropIn {
            from {
                opacity: 0;
                transform: scale(.8)
            }

            to {
                opacity: 1;
                transform: scale(1)
            }
        }

        /** layui nav tree */
        .layui-nav-tree .layui-nav-bar {
            display: none
        }

        .layui-nav-tree>.layui-nav-item>a:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            bottom: 100%;
            width: 3px;
            background-color: #009688;
            transition: all .3s ease
        }

        .layui-nav-tree>.layui-nav-item:hover>a:before {
            bottom: 0
        }

        .layui-nav-tree .layui-nav-item a:hover {
            background-color: transparent
        }

        .layui-nav-tree .layui-nav-child dd.layui-this,
        .layui-nav-tree .layui-this {
            background: 0 0
        }

        .layui-nav-tree .layui-nav-item .layui-nav-child {
            padding: 5px 0;
            background-color: rgba(0, 0, 0, .3) !important
        }

        .layui-nav-tree .layui-nav-itemed>.layui-nav-child {
            display: none
        }

        /** 小三角改箭头 */
        .layui-nav-tree.arrow1 .layui-nav-more {
            font-family: layui-icon !important;
            font-size: 12px;
            font-weight: 600;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            overflow: hidden;
            line-height: normal;
            border: none;
            margin: -3px 0 0 0;
            padding: 0;
            width: 10px;
            height: 6px;
            top: 50%;
            display: inline-block;
            -webkit-transition: all .3s ease;
            transition: all .3s ease
        }

        .layui-nav-tree.arrow1 .layui-nav-more:before {
            content: "\e61a";
            position: absolute;
            right: -1px;
            top: -4px
        }

        .layui-nav-tree.arrow1 .layui-nav-itemed>a>.layui-nav-more {
            -ms-transform: rotate(-180deg);
            -moz-transform: rotate(-180deg);
            -webkit-transform: rotate(-180deg);
            -o-transform: rotate(-180deg);
            transform: rotate(-180deg)
        }

        /** 小三角改加减号 */
        .layui-nav-tree.arrow2 .layui-nav-more {
            font-family: layui-icon !important;
            font-size: 12px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            overflow: hidden;
            line-height: normal;
            border: none;
            margin: -5px 0 0 0;
            padding: 0;
            width: 10px;
            height: 10px;
            top: 50%;
            display: inline-block;
            -webkit-transition: all .3s ease;
            transition: all .3s ease
        }

        .layui-nav-tree.arrow2 .layui-nav-more:before {
            content: "\e654";
            position: absolute;
            top: -2px;
            left: -1px
        }

        .layui-nav-tree.arrow2 .layui-nav-itemed>a>.layui-nav-more {
            -ms-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg)
        }

        .layui-nav-tree.arrow2 .layui-nav-itemed>a>.layui-nav-more:before {
            content: '';
            width: 8px;
            height: 2px;
            background-color: rgba(255, 255, 255, .7);
            top: 4px;
            left: 1px;
            -ms-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -webkit-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            transform: rotate(45deg)
        }

        /** 单标签标题 */
        .layui-body-header {
            color: #262626;
            font-size: 16px;
            padding: 0 20px;
            height: 45px;
            line-height: 45px;
            background-color: #fff;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .1);
            box-sizing: border-box;
            position: absolute;
            left: 0;
            right: 0;
            z-index: 998;
            display: block
        }

        .layui-body-header-title {
            padding-left: 6px;
            border-left: 4px solid #009688
        }

        .layui-body-header+div {
            position: absolute;
            left: 0;
            right: 0;
            top: 45px;
            bottom: 0;
            overflow: auto;
            -webkit-overflow-scrolling: touch
        }

        .layui-breadcrumb {
            visibility: visible
        }

        /** 右侧弹窗 */
        .layui-layer.layui-layer-adminRight {
            bottom: 0;
            top: 50px !important;
            border: none !important;
            box-shadow: 1px 1px 50px rgba(0, 0, 0, .3) !important;
            overflow: auto
        }

        .layui-anim-rl {
            -webkit-animation-name: layui-rl;
            animation-name: layui-rl
        }

        @-webkit-keyframes layui-rl {
            from {
                -webkit-transform: translate3d(100%, 0, 0)
            }

            to {
                -webkit-transform: translate3d(0, 0, 0)
            }
        }

        @keyframes layui-rl {
            from {
                transform: translate3d(100%, 0, 0)
            }

            to {
                transform: translate3d(0, 0, 0)
            }
        }

        .layui-anim-lr,
        .layui-anim-rl.layer-anim-close {
            -webkit-animation-name: layui-lr;
            animation-name: layui-lr
        }

        @-webkit-keyframes layui-lr {
            from {
                -webkit-transform: translate3d(0, 0, 0);
                opacity: 1
            }

            to {
                -webkit-transform: translate3d(100%, 0, 0);
                opacity: 1
            }
        }

        @keyframes layui-lr {
            from {
                transform: translate3d(0, 0, 0)
            }

            to {
                transform: translate3d(100%, 0, 0)
            }
        }

        /** admin风格弹窗 */
        .layui-layer.layui-layer-admin {
            border: none !important;
            box-shadow: 1px 1px 50px rgba(0, 0, 0, .3) !important
        }

        .layui-layer.layui-layer-admin .layui-layer-title {
            color: #fff;
            height: 50px;
            line-height: 50px;
            background-color: #191a23;
            border: none
        }

        .layui-layer.layui-layer-admin .layui-layer-setwin {
            top: 17px
        }

        .layui-layer.layui-layer-admin .layui-layer-setwin a {
            color: #fff;
            font-size: 16px;
            font-style: normal;
            font-family: layui-icon !important;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        /** 关闭按钮 */
        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-close1 {
            background: 0 0
        }

        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-close1:before {
            content: "\1006"
        }

        /** 最小化按钮 */
        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-min cite {
            background-color: #ddd
        }

        /** 最大化按钮 */
        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-max {
            font-size: 14px;
            padding-top: 1px;
            background: 0 0
        }

        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-max:before {
            content: "\e622"
        }

        .layui-layer.layui-layer-admin .layui-layer-setwin .layui-layer-maxmin:before {
            content: "\e758"
        }

        /** 弹窗按钮 */
        .layui-layer.layui-layer-admin .layui-layer-btn {
            padding-bottom: 15px
        }

        .layui-layer.layui-layer-admin .layui-layer-btn .layui-layer-btn0 {
            border-color: #009688;
            background-color: #009688
        }

        .layui-layer.layui-layer-admin .layui-layer-btn a {
            height: 34px;
            line-height: 34px
        }

        .layui-layer-admin {
            max-width: 100%
        }

        .layui-layer-iframe .layui-layer-content {
            overflow: auto;
            -webkit-overflow-scrolling: touch
        }

        /** msg样式 */
        body .layui-layer-msg {
            border: none;
            border-radius: 4px;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1)
        }

        body .layui-layer-load {
            background: 0 0
        }

        /** loading */
        .page-loading {
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 19891017;
            background-color: #fff
        }

        body>.page-loading {
            position: fixed;
            background-color: #f5f7f9
        }

        .layui-layout-admin>.layui-body>.layui-tab>.layui-tab-content>.layui-tab-item>.page-loading,
        .layui-layout-admin>.layui-body>.page-loading {
            background-color: #f5f7f9
        }

        .layui-layout-admin>.layui-body>.layui-body-header.show+div+.page-loading {
            top: 45px;
            height: auto
        }

        .page-no-scroll {
            overflow-x: hidden;
            overflow-y: hidden;
            min-height: 80px
        }

        .ball-loader,
        .rubik-loader,
        .signal-loader {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%)
        }

        .ball-loader>span,
        .signal-loader>span {
            background-color: #4aca85;
            display: inline-block
        }

        .ball-loader.sm>span:nth-child(1),
        .ball-loader>span:nth-child(1),
        .signal-loader.sm>span:nth-child(1),
        .signal-loader>span:nth-child(1) {
            -webkit-animation-delay: 0s;
            animation-delay: 0s
        }

        .ball-loader.sm>span:nth-child(2),
        .ball-loader>span:nth-child(2),
        .signal-loader.sm>span:nth-child(2),
        .signal-loader>span:nth-child(2) {
            -webkit-animation-delay: .1s;
            animation-delay: .1s
        }

        .ball-loader.sm>span:nth-child(3),
        .ball-loader>span:nth-child(3),
        .signal-loader.sm>span:nth-child(3),
        .signal-loader>span:nth-child(3) {
            -webkit-animation-delay: .15s;
            animation-delay: .15s
        }

        .ball-loader.sm>span:nth-child(4),
        .ball-loader>span:nth-child(4),
        .signal-loader.sm>span:nth-child(4),
        .signal-loader>span:nth-child(4) {
            -webkit-animation-delay: .2s;
            animation-delay: .2s
        }

        /** 魔方loading */
        .rubik-loader {
            width: 64px;
            height: 64px;
            background-image: url(img/ic_loading.gif);
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain
        }

        .rubik-loader.sm {
            width: 50px;
            height: 50px
        }

        /** 球形loading */
        .ball-loader>span {
            width: 20px;
            height: 20px;
            margin: 0 3px;
            border-radius: 50%;
            -webkit-transform: scale(0);
            -ms-transform: scale(0);
            transform: scale(0);
            -webkit-animation: 1s ball-load ease-in-out infinite;
            animation: ball-load 1s ease-in-out infinite
        }

        @-webkit-keyframes ball-load {
            0% {
                -webkit-transform: scale(0)
            }

            50% {
                -webkit-transform: scale(1)
            }

            100% {
                -webkit-transform: scale(0)
            }
        }

        @keyframes ball-load {
            0% {
                transform: scale(0)
            }

            50% {
                transform: scale(1)
            }

            100% {
                transform: scale(0)
            }
        }

        .ball-loader.sm>span {
            width: 15px;
            height: 15px;
            margin: 0 2px
        }

        /** 信号loading */
        .signal-loader {
            width: 50px;
            height: 22px
        }

        .signal-loader>span {
            width: 8px;
            height: 0;
            position: absolute;
            bottom: 0;
            left: 0;
            margin: 0;
            -webkit-animation: signal-load 1s infinite;
            animation: signal-load 1s infinite
        }

        .signal-loader>span:nth-child(2) {
            left: 14px
        }

        .signal-loader>span:nth-child(3) {
            left: 28px
        }

        .signal-loader>span:nth-child(4) {
            left: 42px
        }

        @-webkit-keyframes signal-load {
            0% {
                height: 0
            }

            50% {
                height: 22px
            }

            100% {
                height: 0
            }
        }

        @keyframes signal-load {
            0% {
                height: 0
            }

            50% {
                height: 22px
            }

            100% {
                height: 0
            }
        }

        /** 信号loading小型 */
        .signal-loader.sm {
            width: 32px;
            height: 15px
        }

        .signal-loader.sm>span {
            width: 5px;
            -webkit-animation: signal-load-sm 1s infinite;
            animation: signal-load-sm 1s infinite
        }

        .signal-loader.sm>span:nth-child(2) {
            left: 9px
        }

        .signal-loader.sm>span:nth-child(3) {
            left: 18px
        }

        .signal-loader.sm>span:nth-child(4) {
            left: 27px
        }

        @-webkit-keyframes signal-load-sm {
            0% {
                height: 0
            }

            50% {
                height: 15px
            }

            100% {
                height: 0
            }
        }

        @keyframes signal-load-sm {
            0% {
                height: 0
            }

            50% {
                height: 15px
            }

            100% {
                height: 0
            }
        }

        /** 组件样式 */
        /** toolbar */
        .layui-form.toolbar .layui-form-item {
            margin-bottom: 0
        }

        .layui-card-body>.layui-table,
        .toolbar+.layui-table {
            margin: 2px 0
        }

        .layui-card-body>.layui-table-view,
        .toolbar+table+.ew-tree-table,
        .toolbar+table+.layui-table-view {
            margin: 0
        }

        .mr0 {
            margin-right: 0 !important
        }

        .w-auto {
            width: auto
        }

        @media screen and (max-width:450px) {
            .layui-form-item .w-auto+.layui-input-inline {
                margin-left: 100px
            }

            .layui-form-item .layui-inline {
                margin-bottom: 8px
            }
        }

        /** form */
        .model-form {
            padding: 20px 30px 0 0
        }

        .model-form.no-padding {
            padding: 0
        }

        .model-form .model-form-body {
            overflow-y: auto;
            padding: 25px 30px 0 0;
            max-height: calc(100vh - 180px)
        }

        .model-form.no-padding .model-form-footer {
            padding-top: 10px;
            padding-right: 30px
        }

        .layui-form.model-form>.layui-form-item:last-child {
            margin-bottom: 0;
            padding-bottom: 20px
        }

        .layui-form-required:before {
            content: "*";
            display: inline-block;
            font-family: SimSun;
            margin-right: 4px;
            font-size: 14px;
            line-height: 1;
            color: #ed4014
        }

        .layui-input,
        .layui-textarea {
            color: #595959
        }

        .layui-input[type=number] {
            line-height: 38px
        }

        .layui-form-select .layui-input {
            padding-right: 0
        }

        .layui-form-select-top .layui-form-select>dl {
            top: auto;
            bottom: 42px
        }

        /** button */
        .layui-btn-primary {
            color: #595959;
            border-color: #e6e6e6
        }

        .layui-btn-group .layui-btn-primary:first-child {
            border-left: 1px solid #e6e6e6
        }

        .layui-btn-group .layui-btn-primary:hover,
        .layui-btn-primary:hover {
            color: #262626;
            border-color: #c9c9c9
        }

        .layui-btn {
            -webkit-transition: background-color .2s;
            transition: background-color .2s
        }

        /** 圆形按钮 */
        .btn-circle {
            width: 50px;
            height: 50px;
            line-height: 50px;
            border-radius: 50%;
            background: #009688;
            position: fixed;
            right: 15px;
            bottom: 15px;
            color: #fff;
            text-align: center;
            box-shadow: 0 0 8px rgba(0, 0, 0, .2);
            cursor: pointer
        }

        .btn-circle:hover {
            color: #fff;
            opacity: .8
        }

        .btn-circle .layui-icon {
            font-size: 24px
        }

        /** 组件加图标 */
        .date-icon,
        .icon-date {
            background-image: url(img/icon_date.png);
            background-repeat: no-repeat;
            background-position: right center;
            padding-right: 28px
        }

        .icon-search {
            background-image: url(img/icon_search.png);
            background-repeat: no-repeat;
            background-position: right center;
            padding-right: 26px
        }

        a.icon-text>.layui-icon,
        span.icon-text>.layui-icon {
            font-size: 14px;
            margin-left: 2px
        }

        .icon-btn {
            padding: 0 10px
        }

        /** 辅助样式 */
        .bg-white,
        html.bg-white>body {
            background-color: #fff
        }

        [ew-href],
        [lay-tips] {
            cursor: pointer
        }

        .inline-block {
            display: inline-block
        }

        .pull-right {
            float: right
        }

        .pull-left {
            float: left
        }

        .text-left {
            text-align: left
        }

        .text-center {
            text-align: center
        }

        .text-right {
            text-align: right
        }

        .layui-link,
        .text-primary {
            color: #009688 !important
        }

        .text-success {
            color: #5fb878 !important
        }

        .text-warning {
            color: #ffb800 !important
        }

        .text-danger {
            color: #ff5722 !important
        }

        .text-info {
            color: #01aaed !important
        }

        .text-muted {
            color: #c2c2c2 !important
        }

        .layui-text a:not(.layui-btn) {
            color: #2d8cf0;
            cursor: pointer
        }

        .layui-text a:not(.layui-btn):hover {
            text-decoration: none
        }

        .ew-console-wrapper .layui-card {
            box-shadow: none;
            border-radius: 4px;
            padding: 10px;
        }

        .layui-card-header {
            color: #595959;
            border-bottom: none;
        }

        .lay-big-font {
            font-size: 30px;
            line-height: 36px;
            padding: 10px 0px 10px;
            overflow: hidden;
            white-space: nowrap;
            word-break: break-all;
            text-overflow: ellipsis;
            color: rgba(0, 0, 0, .85);
        }

        /** 隐藏滚动条 */
        .no-scrollbar {
            overflow-x: hidden !important;
            overflow-y: hidden !important
        }

        /** 输入框禁用样式 */
        input.layui-disabled,
        input.layui-disabled:hover,
        textarea.layui-disabled,
        textarea.layui-disabled:hover {
            color: #595959 !important;
            background-color: #f6f6f6
        }

        /** 下拉菜单 */
        .dropdown-menu {
            display: inline-block
        }

        .dropdown-menu .dropdown-menu-nav {
            display: none
        }

        .dropdown-menu+.dropdown-menu,
        .dropdown-menu+.layui-btn,
        .layui-btn+.dropdown-menu {
            margin-left: 10px
        }

        /** 滚动条样式 */
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
            background: 0 0
        }

        ::-webkit-scrollbar-track {
            background: 0 0
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 5px;
            background-color: #c1c1c1
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #a8a8a8
        }

        .mini-bar::-webkit-scrollbar {
            width: 6px;
            height: 6px
        }

        .mini-bar::-webkit-scrollbar-thumb {
            border-radius: 3px
        }

        @media screen and (max-width:768px) {
            ::-webkit-scrollbar {
                width: 4px;
                height: 4px
            }

            ::-webkit-scrollbar-thumb {
                border-radius: 2px
            }
        }

        /** 地图选择位置弹窗 */
        #ew-map-select-map {
            height: 450px
        }

        #ew-map-select-pois {
            height: 450px;
            overflow-x: hidden;
            overflow-y: auto
        }

        .ew-map-select-search-list-item {
            padding: 10px 30px 10px 15px;
            border-bottom: 1px solid #e8e8e8;
            cursor: pointer;
            position: relative
        }

        .ew-map-select-search-list-item:hover {
            background: #f2f2f2
        }

        .ew-map-select-search-list-item:last-child {
            border-bottom: none
        }

        .ew-map-select-search-list-item .ew-map-select-search-list-item-title {
            font-size: 14px;
            color: #262626
        }

        .ew-map-select-search-list-item .ew-map-select-search-list-item-address {
            font-size: 12px;
            color: #595959;
            padding-top: 5px
        }

        .ew-map-select-search-list-item-icon-ok {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%)
        }

        .ew-map-select-search-list-item-icon-ok .layui-icon {
            color: #3b74ff
        }

        .ew-map-select-tool {
            padding: 5px 15px;
            box-shadow: 0 1px 0 0 rgba(0, 0, 0, .05)
        }

        #ew-map-select-center-img {
            position: absolute;
            bottom: 50%;
            left: 50%;
            width: 26px;
            margin-left: -13px
        }

        #ew-map-select-center-img2 {
            position: absolute;
            left: 50%;
            top: 50%;
            font-size: 12px;
            display: inline-block;
            margin-left: -6px;
            margin-top: -7px;
            color: #3b74ff
        }

        .bounceInDown {
            animation: bounceInDown .5s;
            animation-direction: alternate;
            -webkit-animation: bounceInDown .5s;
            -webkit-animation-direction: alternate
        }

        @-webkit-keyframes bounceInDown {

            0%,
            60%,
            75%,
            90%,
            to {
                -webkit-transition-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0%,
            to {
                -webkit-transform: translate3d(0, 0, 0)
            }

            25% {
                -webkit-transform: translate3d(0, -30px, 0)
            }

            50% {
                -webkit-transform: translate3d(0, -15px, 0)
            }

            75% {
                -webkit-transform: translate3d(0, -4px, 0)
            }
        }

        @keyframes bounceInDown {

            0%,
            60%,
            75%,
            90%,
            to {
                transition-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0%,
            to {
                transform: translate3d(0, 0, 0)
            }

            25% {
                transform: translate3d(0, -10px, 0)
            }

            50% {
                transform: translate3d(0, -20px, 0)
            }

            75% {
                transform: translate3d(0, -10px, 0)
            }
        }

        #ew-map-select-tips {
            position: absolute;
            z-index: 999;
            background: #fff;
            max-height: 430px;
            overflow: auto;
            top: 48px;
            left: 56px;
            width: 280px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, .12);
            border: 1px solid #d2d2d2
        }

        #ew-map-select-tips .ew-map-select-search-list-item {
            padding: 10px 15px 10px 35px
        }

        .ew-map-select-search-list-item-icon-search {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%)
        }

        .ew-map-select-search-list-item-icon-search .layui-icon {
            color: #8c8c8c
        }

        /** 表格头部工具栏迷你样式 */
        .table-tool-mini .layui-table-view {
            position: relative
        }

        .table-tool-mini .layui-table-tool {
            position: absolute;
            min-height: unset;
            height: auto;
            padding: 3px 10px;
            width: auto;
            top: -38px;
            right: -1px;
            border-top-right-radius: 8px;
            border-top-left-radius: 8px;
            border: 1px solid #e6e6e6;
            border-bottom: none
        }

        .table-tool-mini .layui-table-tool .layui-table-tool-temp {
            padding-right: 0;
            display: inline-block
        }

        .table-tool-mini .layui-table-tool .layui-table-tool-self {
            position: static;
            display: inline-block
        }

        .table-tool-mini .layui-table-tool .layui-table-tool-self .layui-inline[lay-event]:first-child {
            margin: 0
        }

        .table-tool-mini.full-table .layui-table-tool {
            top: -35px;
            height: 1px;
            padding: 0 10px;
            background: 0 0;
            border: none
        }

        .table-tool-mini.full-table .layui-table-tool:before {
            content: "";
            position: absolute;
            top: -3px;
            right: 0;
            left: 0;
            height: 36px;
            background-color: #f2f2f2;
            border-top-right-radius: 8px;
            border-top-left-radius: 8px;
            border: 1px solid #e6e6e6;
            border-bottom: none
        }

        /** laydate自适应 */
        @media screen and (max-width: 768px) {
            .layui-laydate-range {
                left: 0 !important;
                top: 0 !important;
                right: 0 !important;
                margin: 10px auto !important;
                max-width: 95%
            }

            .layui-laydate-range .layui-laydate-content table,
            .layui-laydate-range .layui-laydate-main {
                width: 100%
            }

            .layui-laydate-range .laydate-main-list-0 .laydate-next-m,
            .layui-laydate-range .laydate-main-list-0 .laydate-next-y,
            .layui-laydate-range .laydate-main-list-1 .laydate-prev-m,
            .layui-laydate-range .laydate-main-list-1 .laydate-prev-y {
                display: inline-block !important
            }

            .layui-laydate-range .laydate-main-list-1 .layui-laydate-header {
                border-top: 1px solid #e2e2e2
            }

            .layui-laydate-range .laydate-main-list-1 .layui-laydate-content {
                border-left: none !important
            }

            .layui-laydate-range .laydate-time-list ol li {
                padding-left: 0 !important;
                text-align: center
            }

            .layui-laydate-range .laydate-time-list ol {
                overflow: auto !important
            }
        }

        /** tree展开箭头朝下 */
        .layui-tree-spread>div>div>span>.layui-tree-iconArrow:after {
            border-color: #c0c4cc transparent transparent transparent;
            top: 6px;
            left: 0
        }

        .layui-tree .layui-tree-iconArrow:after {
            transition: none
        }

        /** 数据表格内checkbox */
        .ew-tb-cell-ck .layui-form-checkbox[lay-skin=primary] {
            padding-left: 22px
        }

        .ew-tb-cell-ck .layui-form-checkbox[lay-skin=primary] span {
            padding-right: 5px
        }

        /** 字段集嵌套数据表格 */
        .ew-field-group>.layui-elem-field {
            border-bottom: none;
            margin: 0
        }

        .ew-field-group>.ew-field-box {
            border: 1px solid #e6e6e6;
            padding: 10px 15px;
            border-top: none
        }

        /** 垂直选项卡 */
        .layui-tab.layui-tab-vertical {
            position: relative
        }

        .layui-tab.layui-tab-vertical:after {
            content: "";
            clear: both;
            display: block
        }

        .layui-tab.layui-tab-vertical>.layui-tab-title {
            width: 130px;
            height: auto;
            border: none;
            border-right: 1px solid #e9e9e9;
            box-sizing: border-box;
            padding: 10px 0;
            float: left
        }

        .layui-tab.layui-tab-vertical>.layui-tab-title>li {
            display: block;
            margin-right: -1px;
            border-right: 2px solid transparent;
            white-space: normal;
            line-height: normal;
            padding: 10px 20px;
            text-align: right
        }

        .layui-tab.layui-tab-vertical>.layui-tab-title>li.layui-this {
            border-right: 2px solid #5fb878;
            color: #5fb878
        }

        .layui-tab.layui-tab-vertical>.layui-tab-title>li.layui-this:after {
            display: none
        }

        .layui-tab.layui-tab-vertical>.layui-tab-title>li>.layui-icon {
            font-size: 14px;
            margin-right: 5px
        }

        .layui-tab.layui-tab-vertical>.layui-tab-content {
            margin-left: 130px
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-right>.layui-tab-title {
            float: right;
            border-right: none;
            border-left: 1px solid #e9e9e9
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-right>.layui-tab-content {
            margin-left: 0;
            margin-right: 130px
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-right>.layui-tab-title>li {
            text-align: left;
            border-left: 2px solid transparent;
            border-right: none
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-right>.layui-tab-title>li.layui-this {
            border-left: 2px solid #5fb878
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-full>.layui-tab-title {
            position: absolute;
            top: 0;
            left: 0;
            right: auto;
            min-height: 100%
        }

        .layui-tab.layui-tab-vertical.layui-tab-vertical-right.layui-tab-vertical-full>.layui-tab-title {
            right: 0;
            left: auto
        }

        /** 按钮加载中状态 */
        .ew-btn-loading {
            opacity: .8;
            pointer-events: none;
            font-size: 0 !important
        }

        .ew-btn-loading * {
            display: none !important
        }

        .ew-btn-loading>.ew-btn-loading-text {
            font-size: 14px !important;
            display: inline-block !important
        }

        .ew-btn-loading.layui-btn-sm>.ew-btn-loading-text,
        .ew-btn-loading.layui-btn-xs>.ew-btn-loading-text {
            font-size: 12px !important
        }

        .ew-btn-loading>.ew-btn-loading-text * {
            display: inline-block !important
        }

        /** 搜索展开更多 */
        .form-search-expand,
        .form-search-expand:hover {
            padding: 0;
            border: none;
            color: #2d8cf0;
            box-shadow: none !important
        }

        .form-search-expand .layui-icon {
            font-size: 12px;
            font-weight: 600
        }

        .form-search-show-expand {
            display: none !important
        }

        /** 徽章扩展样式 */
        .layui-badge-green {
            color: #52c41a;
            background: #f6ffed;
            border: 1px solid #b7eb8f
        }

        .layui-badge-blue {
            color: #1890ff;
            background: #e6f7ff;
            border: 1px solid #91d5ff
        }

        .layui-badge-red {
            color: #f5222d;
            background: #fff1f0;
            border: 1px solid #ffa39e
        }

        .layui-badge-yellow {
            color: #faad14;
            background: #fffbe6;
            border: 1px solid #ffe58f
        }

        .layui-badge-gray {
            color: #8c8c8c;
            background: #fafafa;
            border: 1px solid #ccc
        }

        .layui-badge {
            height: 20px;
            line-height: 19px;
            box-sizing: border-box
        }

        .layui-badge-list .layui-badge {
            height: 23px;
            line-height: 22px;
            margin-bottom: 8px
        }

        .layui-badge-list .layui-badge+.layui-badge {
            margin-left: 6px
        }

        .layui-badge-list .layui-badge.layui-bg-gray {
            border: 1px solid #ccc;
            background-color: #fafafa !important
        }

        .layui-card .layui-card-header .layui-badge.pull-right {
            top: 50%;
            margin-top: -10px
        }

        /** 锁屏 */
        .ew-lock-screen-group {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 19891099
        }

        /** ios下iframe兼容 */
        .ios-iframe-body {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0
        }

        /** 应用快捷块样式 */
        .console-app-group {
            padding: 16px;
            border-radius: 4px;
            text-align: center;
            background-color: #fff;
            cursor: pointer
        }

        .console-app-group .console-app-icon,
        .console-user-group .console-user-group-head .console-app-icon {
            width: 32px;
            height: 32px;
            line-height: 32px;
            margin-bottom: 6px;
            display: inline-block;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 32px;
            color: #69c0ff
        }

        .console-app-group:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, .08)
        }

        /** 小组成员 */
        .console-user-group {
            position: relative;
            padding: 10px 0 10px 60px
        }

        .console-user-group .console-user-group-head {
            width: 32px;
            height: 32px;
            position: absolute;
            top: 50%;
            left: 12px;
            margin-top: -16px
        }

        .console-user-group .layui-badge {
            position: absolute;
            top: 50%;
            right: 8px;
            margin-top: -10px
        }

        .console-user-group .console-user-group-name {
            line-height: 1.2
        }

        .console-user-group .console-user-group-desc {
            color: #8c8c8c;
            line-height: 1;
            font-size: 12px;
            margin-top: 5px
        }

        /** 卡片轮播图样式 */
        .admin-carousel .layui-carousel-ind {
            position: absolute;
            top: -41px;
            text-align: right
        }

        .admin-carousel .layui-carousel-ind ul {
            background: 0 0
        }

        .admin-carousel .layui-carousel-ind li {
            background-color: #e2e2e2
        }

        .admin-carousel .layui-carousel-ind li.layui-this {
            background-color: #999
        }

        /** 广告位轮播图 */
        .admin-news .layui-carousel-ind {
            height: 45px
        }

        .admin-news a {
            display: block;
            line-height: 60px;
            text-align: center;
            border-radius: 4px
        }

        /** 消息列表样式 */
        .message-tab {
            padding: 5px 0 0 0;
            margin: 0
        }

        .message-tab .layui-tab-title {
            text-align: center
        }

        .message-tab .layui-tab-content {
            padding: 5px 0 0 0
        }

        .message-list {
            overflow: auto
        }

        .message-list-item {
            padding: 10px 24px;
            border-bottom: 1px solid #e8e8e8;
            -ms-flex-align: start;
            align-items: flex-start;
            display: flex;
            -ms-flex: 1 1;
            flex: 1 1
        }

        .message-btn-clear:hover,
        .message-btn-more:hover,
        .message-list-item:hover {
            background: #f2f2f2
        }

        .message-item-icon {
            width: 40px;
            height: 40px;
            margin-right: 16px;
            display: block;
            margin-top: 4px
        }

        .message-item-right {
            display: block;
            flex: 1 0;
            line-height: 24px
        }

        .message-item-title {
            font-size: 14px;
            color: rgba(0, 0, 0, .65)
        }

        .message-item-text {
            color: rgba(0, 0, 0, .45);
            font-size: 12px
        }

        .message-btn-clear,
        .message-btn-more {
            display: block;
            padding: 10px 5px;
            text-align: center;
            line-height: 24px;
            color: #333
        }

        .message-btn-clear {
            background: #fff;
            border-top: 1px solid #e8e8e8
        }

        .message-btn-more {
            color: #666;
            font-size: 13px
        }

        .message-list-empty {
            text-align: center;
            color: rgba(0, 0, 0, .45);
            padding: 73px 0 88px;
            display: none;
        }

        .message-list-empty img {
            height: 76px;
            margin-bottom: 16px
        }

        /** 便签样式 */
        .note-wrapper {
            padding-left: 15px;
            margin-bottom: 10px;
            padding-top: 15px;
        }

        .note-item {
            width: 113px;
            height: 100px;
            display: inline-block;
            margin: 0 6px 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            position: relative;
            cursor: pointer
        }

        .note-item:hover {
            background-color: #f1f1f1
        }

        .note-item .note-item-content {
            font-size: 14px;
            color: #666;
            height: 78px;
            overflow: hidden;
            word-wrap: break-word
        }

        .note-item .note-item-time {
            font-size: 12px;
            color: #999;
            margin-top: 10px
        }

        .note-empty {
            text-align: center;
            color: rgba(0, 0, 0, .45);
            padding: 73px 0 88px;
            display: none
        }

        .note-empty .layui-icon {
            margin-bottom: 10px;
            display: inline-block;
            font-size: 60px
        }

        .note-item-del {
            position: absolute;
            right: 3px;
            top: 3px;
            display: none;
            color: #ff5722
        }

        .note-item-del.show {
            display: inline-block
        }

        .note-item-del .layui-icon {
            font-size: 22px
        }

        .layui-layer-admin textarea {
            width: 260px;
            height: 112px;
            color: #666666;
            word-wrap: break-word;
            resize: none;
            margin: 20px 5px;
            margin-bottom: 0;
            border: none;
            padding: 0 10px;
            overflow: hidden;
        }

        /** 单色导航图标 */
        @font-face {
            font-family: easyxin-icon-nav;
            src: url(/font/nav/iconfont.eot);
            src: url(/font/nav/iconfont.eot?#iefix) format('embedded-opentype'), url(/font/nav/iconfont.woff2) format('woff2'), url(/font/nav/iconfont.woff) format('woff'), url(/font/nav/iconfont.ttf) format('truetype'), url(/font/nav/iconfont.svg#easyxin-icon-nav) format('svg')
        }

        .easyxin-icon-nav {
            font-family: easyxin-icon-nav !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        .easyxin-icon-nav-anpaipaiche:before {
            content: "\e60a"
        }

        .easyxin-icon-nav-gongchengguanli:before {
            content: "\e609"
        }

        .easyxin-icon-nav-zichanguanli:before {
            content: "\e608"
        }

        .easyxin-icon-nav-caigouguanli:before {
            content: "\e607"
        }

        .easyxin-icon-nav-cangkuguanli:before {
            content: "\e606"
        }

        .easyxin-icon-nav-yuangongguanli:before {
            content: "\e605"
        }

        .easyxin-icon-nav-dingdanguanli:before {
            content: "\e604"
        }

        .easyxin-icon-nav-wuliaoguanli:before {
            content: "\e603"
        }

        .easyxin-icon-nav-waixieguanli:before {
            content: "\e602"
        }

        /** 单色前三名 */
        @font-face {
            font-family: currency-icon-ranking;
            src: url(/font/ranking/iconfont.eot);
            src: url(/font/ranking/iconfont.eot?#iefix) format('embedded-opentype'), url(/font/ranking/iconfont.woff2) format('woff2'), url(/font/ranking/iconfont.woff) format('woff'), url(/font/ranking/iconfont.ttf) format('truetype'), url(/font/ranking/iconfont.svg#currency-icon-ranking) format('svg')
        }

        .currency-icon-ranking {
            font-family: currency-icon-ranking !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        .currency-icon-ranking-fuben3:before {
            content: "\e60d"
        }

        .currency-icon-ranking-fuben2:before {
            content: "\e60c"
        }

        .currency-icon-ranking-fuben1:before {
            content: "\e60b"
        }

        .currency-icon-ranking-huangguan:before {
            content: "\e601"

        }
    </style>
</head>

<body>
<div class="layui-body">
    <div class="layui-fluid ew-console-wrapper">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <p style="font-size:14px;color: rgba(0,0,0,.45);">总订单金额
                            <span class="pull-right">
                                    <i class="ri-exchange-cny-fill ri-xl" style="vertical-align: -0.3em;"></i>
                                </span>
                        </p>
                        <p class="lay-big-font"><span style="font-size: 26px;line-height: 1;">¥&nbsp;</span>85,84787
                        </p>
                        <div style="height: 40px;">
                            <p>
                                    <span style="margin-right: 30px;">周同比 17% &nbsp;
                                        <svg style="vertical-align: -0.5em;" xmlns="http://www.w3.org/2000/svg"
                                             viewBox="0 0 24 24" width="24" height="24">
                                            <path fill="none" d="M0 0h24v24H0z" />
                                            <path d="M12 8l6 6H6z" fill="rgba(231,76,60,1)" /></svg>
                                    </span>
                                <span>日同比 11% &nbsp;
                                        <svg style="vertical-align: -0.5em;" xmlns="http://www.w3.org/2000/svg"
                                             viewBox="0 0 24 24" width="24" height="24">
                                            <path fill="none" d="M0 0h24v24H0z" />
                                            <path d="M12 16l-6-6h12z" fill="rgba(47,204,113,1)" /></svg>
                                    </span>
                            </p>
                        </div>
                    </div>
                    <p style="padding: 10px 15px 0px 15px;border-top: 1px solid #f0f0f0;">日销售金额<span
                            style="padding: 0 12px;">¥&nbsp;63 万元</span></p>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <p style="font-size:14px;color: rgba(0,0,0,.45);">访问量
                            <span class="pull-right">
                                    <i class="ri-funds-line ri-xl" style="vertical-align: -0.3em;"></i>
                                </span>
                        </p>
                        <p class="lay-big-font"><span style="font-size: 26px;line-height: 1;"></span>92,648
                        </p>
                        <div style="height: 40px;" id="ECharts01">

                        </div>
                    </div>
                    <p style="padding: 10px 15px 0px 15px;border-top: 1px solid #f0f0f0;">
                        日访问量<span style="padding: 0 10px;">1675</span>
                        <span style="margin-left: 20px;">日同比 26% &nbsp;
                                <svg style="vertical-align: -0.5em;" xmlns="http://www.w3.org/2000/svg"
                                     viewBox="0 0 24 24" width="24" height="24">
                                    <path fill="none" d="M0 0h24v24H0z" />
                                    <path d="M12 8l6 6H6z" fill="rgba(231,76,60,1)" /></svg>
                            </span>
                    </p>

                </div>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <p style="font-size:14px;color: rgba(0,0,0,.45);">活跃用户
                            <span class="pull-right">
                                    <i class="ri-ghost-2-line ri-xl" style="vertical-align: -0.3em;"></i>
                                </span>
                        </p>
                        <p class="lay-big-font"><span style="font-size: 26px;line-height: 1;"></span>12684
                        </p>
                        <div style="height: 40px;" id="ECharts02">

                        </div>
                    </div>
                    <p style="padding: 10px 15px 0px 15px;border-top: 1px solid #f0f0f0;">
                        今日活跃用户<span style="padding: 0 10px;">782</span>
                        <span style="margin-left: 20px;">日同比 6% &nbsp;
                                <svg style="vertical-align: -0.5em;" xmlns="http://www.w3.org/2000/svg"
                                     viewBox="0 0 24 24" width="24" height="24">
                                    <path fill="none" d="M0 0h24v24H0z" />
                                    <path d="M12 16l-6-6h12z" fill="rgba(47,204,113,1)" /></svg>
                            </span>
                    </p>
                </div>
            </div>
            <div class="layui-col-xs12 layui-col-sm6 layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <p style="font-size:14px;color: rgba(0,0,0,.45);">总支出金额
                            <span class="pull-right">
                                    <i class="ri-hand-coin-line ri-xl" style="vertical-align: -0.3em;"></i>
                                </span>
                        </p>
                        <div class="layui-row" style="height: 96px;">
                            <div style="width: 40%;height: 100%;float: left;">
                                <p class="lay-big-font"><span
                                        style="font-size: 26px;line-height: 1;">¥&nbsp;</span>4675217
                                </p>
                                <p>
                                        <span>周同比12% &nbsp;
                                            <svg style="vertical-align: -0.5em;" xmlns="http://www.w3.org/2000/svg"
                                                 viewBox="0 0 24 24" width="24" height="24">
                                                <path fill="none" d="M0 0h24v24H0z" />
                                                <path d="M12 8l6 6H6z" fill="rgba(231,76,60,1)" /></svg>
                                        </span>
                                </p>
                            </div>
                            <div style="width:60%;height: 100%;float: left;" id="ECharts03">

                            </div>
                        </div>
                    </div>
                    <p style="padding: 10px 15px 0px 15px;border-top: 1px solid #f0f0f0;">今日总支出<span
                            style="padding: 0 10px;">68541</span></p>
                </div>
            </div>
        </div>

        <div class="layui-row layui-col-space15">
            <div class="layui-col-sm8" style="width: 57%">
                <div class="layui-row">
                    <div class="layui-card">
                        <div id="containeraxis" style="height: 475px;margin-top: 25px"></div>
                    </div>
                </div>
            </div>
            <div class="layui-col-sm4" style="width: 43%">
                <div class="layui-row ">
                    <div class="layui-card">
                        <div id="containerpie" style="height: 500px;width: 100%"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row layui-col-space15">
            <div class="layui-col-lg8 layui-col-md7">
                <div class="layui-card">
                    <div id="container" style="margin-top: 25px;height: 420px;width: 100%"></div>
                </div>
            </div>
            <div class="layui-col-lg4 layui-col-md5">
                <div class="layui-card">
                    <div class="layui-card-header">最新订单</div>
                    <div class="layui-card-body">
                        <table class="layui-table layui-text">
                            <colgroup>
                                <col width="80">
                                <col>
                                <col width="90">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>订货单</td>
                                <td>Y20200824</td>
                                <td>下单客户</td>
                                <td><span class="layui-badge layui-badge-red">张三</span></td>
                            </tr>
                            <tr>
                                <td>订货单</td>
                                <td>Y20200824</td>
                                <td>下单客户</td>
                                <td><span class="layui-badge layui-badge-yellow">李四</span></td>
                            </tr>
                            <tr>
                                <td>订货单</td>
                                <td>Y20200824</td>
                                <td>下单客户</td>
                                <td><span class="layui-badge layui-badge-green">王五</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header">星级客户</div>
                    <div class="layui-card-body">
                        <div class="console-user-group">
                            <div class="console-user-group-head">
                                <i class="ri-trophy-line ri-2x" style="color: #1890ff;"></i>
                            </div>
                            <div class="console-user-group-name">王五</div>
                            <div class="console-user-group-desc">13800000000</div>
                            <span class="layui-badge layui-badge-blue">￥684104.00</span>
                        </div>
                        <div class="console-user-group">
                            <div class="console-user-group-head">
                                <i class="ri-medal-line ri-2x" style="color: #faad14;"></i>
                            </div>
                            <div class="console-user-group-name">张三</div>
                            <div class="console-user-group-desc">13800000000</div>
                            <span class="layui-badge layui-badge-yellow">￥475211.00</span>
                        </div>
                        <div class="console-user-group">
                            <div class="console-user-group-head">
                                <i class="ri-award-line ri-2x" style="color: #52c41a;"></i>
                            </div>
                            <div class="console-user-group-name">李四</div>
                            <div class="console-user-group-desc">13800000000</div>
                            <span class="layui-badge layui-badge-green">￥207457.00</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/echarts-gl.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ecStat.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/dataTool.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/china.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/world.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bmap.min.js"></script>

<%--echatrs统计图JS文件--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/echatrs/echarts.min.js"></script>

<script type="text/javascript">

    /*初始化柱形图*/
    myChartaxis = echarts.init(document.getElementById("containeraxis"));
    var option = '';
    $.ajax({
        url:'${pageContext.request.contextPath}/dataOA/dataQuery',
        type:'post',
        dataType:'json',
        success:function (data){
            myChartaxis.setOption({
                title: {
                    text: '     职工近七天内的离职与入职柱状图'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['离职', '入职']
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: data.date
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '离职',
                        type: 'bar',
                        data: data.Resign,
                    },
                    {
                        name: '入职',
                        type: 'bar',
                        data: data.Onboarding,
                    }
                ]
            })

        },
        error:function (){
            alert("出错了")
        }
    })

    /*初始化饼状图*/
    var myChartpie = echarts.init(document.getElementById("containerpie"));

    $.ajax({
        url:'${pageContext.request.contextPath}/dataOA/datapie',
        type:'post',
        dataType:'json',
        success:function (data){
            myChartpie.setOption({
                title: {
                    text: '职工近七天离职入职饼状图',
                    left:'center'
                },
                legend: {
                    top: 'bottom'
                },
                series: [
                    {
                        name: '面积模式',
                        type: 'pie',
                        radius: [20, 150],
                        center: ['50%', '50%'],
                        roseType: 'area',
                        itemStyle: {
                            borderRadius: 4
                        },
                        data: [
                            {value: data.Resign[0], name: data.date[0]},
                            {value: data.Onboarding[0], name: data.date[1]},
                            {value: data.Resign[1], name: data.date[2]},
                            {value: data.Onboarding[1], name: data.date[3]},
                            {value: data.Resign[2], name: data.date[4]},
                            {value: data.Onboarding[2], name: data.date[5]},
                            {value: data.Resign[3], name: data.date[6]},
                            {value: data.Onboarding[3], name: data.date[7]},
                            {value: data.Resign[4], name: data.date[8]},
                            {value: data.Onboarding[4], name: data.date[9]},
                            {value: data.Resign[5], name: data.date[10]},
                            {value: data.Onboarding[5], name: data.date[11]},
                            {value: data.Resign[6], name: data.date[12]},
                            {value: data.Onboarding[7], name: data.date[13]}
                        ]
                    }
                ]
            })
        },
        error:function (){
            alert("出错了")
        }
    })

    /*近七天员工离职入职折线表*/
    var myChart = echarts.init(document.getElementById("container"));

    $.ajax({
        url:'${pageContext.request.contextPath}/dataOA/dataQuery',
        type:'post',
        dataType:'json',
        success:function (data){
            myChart.setOption({
                title:{
                    text:'职工近七天离职入职折线图',
                    left:'center'
                },

                xAxis: {
                    type: 'category',
                    data: data.date
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        data: data.Resign,
                        type: 'line',
                        smooth: true
                    },
                    {
                        data: data.Onboarding,
                        type: 'line',
                        smooth: true
                    }
                ]
            })
        }
    })

</script>

<script>
    layui.use('table', function () {
        var table = layui.table;
    })
</script>

<script>
    var ECharts01 = echarts.init(document.getElementById('ECharts01'));
    var option01 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                lineStyle: {
                    color: '#57617B'
                }
            }
        },
        grid: {
            top: 2,
            left: 0,
            right: 0,
            bottom: 0,
            containLabel: true
        },
        xAxis: [{
            show: false,
            data: ['0:00', '2:00', '4:00', '6:00', '8:00', '10:00', '12:00', '14:00', '16:00', '18:00', '20:00', '22:00'],
        }],
        yAxis: [{
            show: false,
            type: 'value',
            data: ['13:00', '13:00', '13:00', '13:05', '13:10', '13:00', '13:05', '13:10', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35',]

        }],
        series: [{
            name: 'PV',
            type: 'line',
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    color: "#16D9F0"
                }
            },
            areaStyle: {
                normal: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0,
                            color: 'rgba(22,217,240, 1)' // 0% 处的颜色
                        }, {
                            offset: 1,
                            color: 'rgba(22,217,240, 0)' // 100% 处的颜色
                        }],
                        global: false // 缺省为 false
                    },
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10
                }
            },
            itemStyle: {
                normal: {
                    color: '#16D9F0',
                },
                emphasis: {
                    show: true,
                    borderWidth: 1,
                },
            },
            data: ['2', '156', '129', '3', '126', '7', '99', '143', '50', '180', '67', '142',],
        }]
    };
    ECharts01.setOption(option01);


    var ECharts02 = echarts.init(document.getElementById('ECharts02'));
    var option02 = {
        color: ['#60ABFC',],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            orient: 'horizontal',
            data: ['2020-8-13', '2020-8-14', '2020-8-15', '2020-8-16', '2020-8-17', '2020-8-18', '2020-8-19', '2020-8-20', '2020-8-21', '2020-8-22'],
            textStyle: {
                color: '#858FA6',
                fontFamily: 'Microsoft YAHei,serf'
            }
        },
        grid: {
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            containLabel: true
        },
        xAxis: {
            data: ['2020-8-13', '2020-8-14', '2020-8-15', '2020-8-16', '2020-8-17', '2020-8-18', '2020-8-19', '2020-8-20', '2020-8-21', '2020-8-22'],
            axisLabel: {
                show: false,
                color: '#858fa6'
            },
            axisTick: {
                show: false
            },
            splitLine: {
                lineStyle: {
                    width: 1,
                    color: '#E2E2E2'
                }
            },
            axisLine: {
                lineStyle: {
                    width: 1,
                    color: '#E2E2E2'
                }
            }
        },
        yAxis: {
            data: [],
            axisTick: {
                show: false
            },
            splitLine: {
                lineStyle: {
                    width: 1,
                    color: '#E2E2E2'
                }
            },
            axisLabel: {
                color: '#858fa6'
            },
            axisLine: {
                lineStyle: {
                    width: 0,
                    color: '#E2E2E2',
                    show: false
                }
            }
        },
        series: [{
            name: '数量',
            type: 'bar',
            data: [119, 102, 126, 118, 107, 100, 104, 80, 140, 100],
            barGap: 0,
            barWidth: '60%'
        }]
    };
    ECharts02.setOption(option02);


    var ECharts03 = echarts.init(document.getElementById('ECharts03'));
    var option03 = {
        color: ['#4956ff', '#2d82ff', '#2dc6ff', '#2fca95', '#f4d040'],
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        series: [{
            name: '2020年度',
            type: 'pie',
            radius: ['10%', '90%'],
            center: ['50%', '50%'],
            roseType: 'radius',
            label: {
                show: false
            },
            emphasis: {
                label: {
                    show: true
                }
            },
            itemStyle: {
                shadowBlur: 10,
                shadowColor: 'rgba(0, 103, 255, 0.2)',
                shadowOffsetX: -5,
                shadowOffsetY: 5,
            },
            data: [{
                value: 10000,
                name: '其他'
            },
                {
                    value: 15000,
                    name: '漏款'
                },
                {
                    value: 20000,
                    name: '补贴'
                },
                {
                    value: 25000,
                    name: '聚餐'
                },
                {
                    value: 30000,
                    name: '活动'
                },
                {
                    value: 35000,
                    name: '投资'
                },
                {
                    value: 40000,
                    name: '工资'
                },
                {
                    value: 45,
                    name: 'rose8'
                }
            ]
        },

        ]
    };
    ECharts03.setOption(option03);

    // 宽度改变后350ms 进行刷新图表的大小
    // 为了解决点击侧边伸缩造成卡顿情况
    let time = performance.now();
    const timeout = 350;
    window.addEventListener('resize', function () {
        const now = performance.now()
        if (now - time > timeout) {
            setTimeout(() => {
                ECharts01.resize();
                ECharts02.resize();
                ECharts03.resize();
            }, timeout);
        }
        time = now;
    });


</script>
</body>

</html>

