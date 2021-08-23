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
    <!-- layui样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <title>Document</title>
    <style>
        .layui-tab-title {
            color: #333 !important;
        }

        .layui-tab-brief>.layui-tab-title .layui-this {
            color: #333 !important;
        }

        .layui-tab-brief>.layui-tab-more li.layui-this:after,
        .layui-tab-brief>.layui-tab-title .layui-this:after {
            border: none;
            border-radius: 0;
            border-bottom: 1px solid #000;
        }

        .avatar-add {
            position: relative;
            width: 100%;
            height: 384px;
        }

        .avatar-add p {
            position: absolute;
            top: 70px;
            width: 100%;
            margin-top: 10px;
            font-size: 12px;
            text-align: center;
            color: #999;
        }

        .avatar-add .upload-img {
            position: absolute;
            left: 50%;
            top: 35px;
            margin: 0 0 0 -56px;
        }

        .avatar-add img {
            position: absolute;
            left: 50%;
            top: 50%;
            width: 168px;
            height: 168px;
            margin: -50px 0 0 -84px;
            border-radius: 100%;
        }

        .foot {
            height: 49px !important;
            line-height: 49px;
            text-align: right;
            background-color: #f5f5f5;
            border-top: 1px #e5e5e5 solid;
        }

        .foot button {
            width: 62px;
            height: 28px;
            line-height: 28px;
            margin-left: 2px;
            margin-right: 15px;
        }
        .foot .close:hover{
            border-color: #1E9FFF;
        }
    </style>
</head>

<body style="background-color: #ffffff">
    <form class="layui-form" action="">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                            <ul class="layui-tab-title">
                                <li class="layui-this"><i class="czs-face-l"></i>设置我的资料</li>
                                <li>设置头像</li>
                            </ul>
                            <div class="layui-tab-content">
                                <div class="layui-tab-item layui-show">
                                    <div class="layui-card-body" style="padding: 0;padding-top: 4px;padding-left: 4px;">
                                        <div class="layui-form" lay-filter="">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">用户名</label>
                                                <div class="layui-input-inline">
                                                    <input type="text" name="username" style="color: #999"
                                                        value="Y-Admin" readonly="" class="layui-input">
                                                </div>
                                                <div class="layui-form-mid layui-word-aux">不可修改</div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">昵称</label>
                                                <div class="layui-input-inline">
                                                    <input type="text" name="nickname" value="" lay-verify="nickname"
                                                        autocomplete="off" placeholder="请输入昵称" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">性别</label>
                                                <div class="layui-input-block">
                                                    <input type="radio" name="sex" value="男" title="男">
                                                    <div class="layui-unselect layui-form-radio">
                                                        <i class="layui-anim layui-icon"></i>
                                                        <div>男</div>
                                                    </div>
                                                    <input type="radio" name="sex" value="女" title="女">
                                                    <div class="layui-unselect layui-form-radio layui-form-radioed">
                                                        <i class="layui-anim layui-icon"></i>
                                                        <div>女</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">手机</label>
                                                <div class="layui-input-inline">
                                                    <input type="text" name="cellphone" value="12345678910"
                                                        placeholder="请输入手机号" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">邮箱</label>
                                                <div class="layui-input-inline">
                                                    <input type="text" name="email" value="12345678@qq.com"
                                                        placeholder="请输入邮箱" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item layui-form-text">
                                                <label class="layui-form-label">备注</label>
                                                <div class="layui-input-block">
                                                    <textarea name="remarks" placeholder="请输入备注"
                                                        class="layui-textarea">如果此项目帮到你，希望你能帮我点个星！  谢谢！</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-tab-item">
                                    <div class="avatar-add">
                                        <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                                        <button type="button" class="layui-btn layui-btn-normal upload-img" id="test1">
                                            <i class="layui-icon">&#xe67c;</i>上传图片
                                        </button>
                                        <img src="${pageContext.request.contextPath}/static/images/nav_userInfo/default-avatar.svg">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm"  lay-submit="" lay-filter="setmyinfo">确定</button>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm close" lay-submit="" lay-filter="close">取消</button>
        </div>
    </form>



    <!-- layui JS -->
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script>
        layui.use(['form', 'jquery', 'layer', 'element', 'upload'], function () {
            var form = layui.form;
            var $ = layui.jquery;
            var layer = layui.layer;
            var element = layui.element;
            var upload = layui.upload;

            //执行实例
            var uploadInst = upload.render({
                elem: '#test1' //绑定元素
                , url: '/upload/' //上传接口
                , done: function (res) {
                    //上传完毕回调
                }
                , error: function () {
                    //请求异常回调
                }
            });

            //监听提交
            form.on('submit(setmyinfo)', function (data) {
                parent.layer.alert(JSON.stringify(data.field));
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
                return false;

                $.ajax({
                    url: '提交URL',
                    type: "post",
                    dataType: 'json',
                    data: {
                        'data': JSON.stringify(data.field)
                    },
                    success: function (data) {
                        if (data['status'] == 1) {
                            parent.layer.msg(data['msg'], { icon: 1 });
                        } else {
                            parent.layer.msg(data['msg'], { icon: 2 });
                        }
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭  
                    }
                })

                return false;
            });


            $('.close').click(function(){
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭  
                return false;
            })

        });

    </script>
</body>

</html>