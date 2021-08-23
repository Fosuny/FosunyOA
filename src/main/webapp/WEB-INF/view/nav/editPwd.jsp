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
        #code {
            width: calc(100% - 200px);
            float: left;
            margin-right: 8px;
        }

        .layui-col-space15 {
            margin: 0px;
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

        .foot .close:hover {
            border-color: #1E9FFF;
        }
    </style>
</head>

<body style="background-color: #ffffff">
    <form class="layui-form" action="#" onsubmit="return false" id="editpwd">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12" style="padding-bottom: 0;">
                <div class="layui-card">
                    <div class="layui-card-body" pad15="">
                        <div class="layui-form" lay-filter="">
                            <input type="hidden" name="userLogin" value="${userinfo}"/>
                            <div class="layui-form-item">
                                <label class="layui-form-label">旧的密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="oldPassword" name="oldPassword" lay-verify="required" lay-vertype="tips"
                                        class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">新的密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" lay-verify="required" lay-verify="pass"
                                        lay-vertype="tips" autocomplete="off" id="LAY_password" class="layui-input">
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">再次确认</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="repassword" name="repassword" lay-verify="required" lay-verify="repass"
                                        lay-vertype="tips" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <%--<div class="layui-form-item">
                                <label class="layui-form-label">验证码</label>
                                <div class="layui-input-block">
                                    <input id="code" type="text" name="PhoneCode" required lay-verify="required|number"
                                        autocomplete="off" class="layui-input yanzhengma">
                                    <button id="getPhoneCode" type="button"
                                        class="layui-btn layui-btn-primary">获取验证码</button>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" lay-submit=""
                lay-filter="setmypass" id="editpwdsub">确定</button>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm close" lay-filter="close">取消</button>
        </div>
    </form>
    <!-- layui JS -->
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script>

        $("#editpwdsub").click(function (){
            var oldPassword = $("#oldPassword").val()
            var password = $("#LAY_password").val()
            var repassword = $("#repassword").val()
            if(password != repassword){
                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('新密码与确认密码不符！');
                });
            }



        })

        layui.use(['form', 'jquery', 'layer'], function () {
            var form = layui.form;
            var $ = layui.jquery;
            var layer = layui.layer;

            //获取验证码按钮
            $('#getPhoneCode').click(function () {
                parent.layer.msg('短信已发送！~');
                var countdown = 60;
                var _generate_code = $("#getPhoneCode");
                function settime() {
                    if (countdown == 0) {
                        _generate_code.removeClass('layui-btn-disabled');
                        _generate_code.attr("disabled", false);
                        _generate_code.text("获取验证码");
                        countdown = 60;
                        return false;
                    } else {
                        _generate_code.addClass('layui-btn-disabled');
                        _generate_code.attr("disabled", true);
                        _generate_code.text("重新发送(" + countdown + ")");
                        countdown--;
                    }
                    setTimeout(function () {
                        settime();
                    }, 1000);
                }
                settime();
            })

            //提交
            form.on('submit(setmypass)', function (data) {
                if (data.field.password != data.field.repassword) {
                    parent.layer.msg('确认密码输入不一致', { icon: 2 });
                    return false;
                }

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