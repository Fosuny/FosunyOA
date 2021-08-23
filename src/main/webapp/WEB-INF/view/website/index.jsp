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
    <link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">
    <script src="https://www.layuicdn.com/layui/layui.js"></script>
    <style>
        html {
            background-color: #f0f2f5;
            color: #666;
        }

        .layui-fluid {
            padding: 14px;
        }

        .layui-card-header {
            position: relative;
        }

        .layui-form[wid100] .layui-form-label {
            width: 100px;
        }

        .layui-form[wid100] .layui-input-block {
            margin-left: 130px;
        }

        .layui-form-item .layui-input-company {
            width: auto;
            padding-right: 10px;
            line-height: 38px;
        }

        @media screen and (max-width: 450px) {
            .layui-form[wid100] .layui-form-item .layui-input-inline {
                margin-left: 132px;
            }
        }

        @media screen and (max-width: 450px) {
            .layui-form[wid100] .layui-form-item .layui-input-inline+.layui-form-mid {
                margin-left: 130px;
            }
        }
    </style>
</head>

<body>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">网站设置</div>
                    <div class="layui-card-body" pad15="">

                        <div class="layui-form" wid100="" lay-filter="">
                            <div class="layui-form-item">
                                <label class="layui-form-label">网站名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="sitename" value="Y-Admin" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">网站域名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="domain" lay-verify="url" value="http://y-admin.yijianku.com"
                                        class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">缓存时间</label>
                                <div class="layui-input-inline" style="width: 80px;">
                                    <input type="text" name="cache" lay-verify="number" value="0" class="layui-input">
                                </div>
                                <div class="layui-input-inline layui-input-company">分钟</div>
                                <div class="layui-form-mid layui-word-aux">本地开发一般推荐设置为 0，线上环境建议设置为 10。</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">最大文件上传</label>
                                <div class="layui-input-inline" style="width: 80px;">
                                    <input type="text" name="cache" lay-verify="number" value="2048"
                                        class="layui-input">
                                </div>
                                <div class="layui-input-inline layui-input-company">KB</div>
                                <div class="layui-form-mid layui-word-aux">提示：1 M = 1024 KB</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">上传文件类型</label>
                                <div class="layui-input-block">
                                    <input type="text" name="cache" value="png|gif|jpg|jpeg|zip|rar"
                                        class="layui-input">
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">首页标题</label>
                                <div class="layui-input-block">
                                    <textarea name="title" class="layui-textarea">Y-Admin 后台管理模板系统</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">META关键词</label>
                                <div class="layui-input-block">
                                    <textarea name="keywords" class="layui-textarea"
                                        placeholder="多个关键词用英文状态 , 号分割"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">META描述</label>
                                <div class="layui-input-block">
                                    <textarea name="descript"
                                        class="layui-textarea">Y-Admin 是基于layui开发的一套后台管理模板系统</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">版权信息</label>
                                <div class="layui-input-block">
                                    <textarea name="copyright"
                                        class="layui-textarea">copyright © 2020 Y-Admin all rights reserved.</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="set_website">确认保存</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>