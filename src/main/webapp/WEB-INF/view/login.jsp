<%--
  Created by IntelliJ IDEA.
  User: SPR28
  Date: 2021/7/7
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>FosunyOA 办公 | 登录</title>
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/images/favicon.ico">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/images/favicon.ico">

    <!-- Meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google fonts -->
    <link href="//fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;700&display=swap" rel="stylesheet">

    <!-- CSS Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/login/css/style.css" type="text/css" media="all" />
    <style type="text/css">
        html{
            width: 100%;
            height: 100%;
        }
        body{
            background-image: url("${pageContext.request.contextPath}/static/images/login-image.png");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
<div class="signinform">
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info" style="margin-top: 100px">
            <div class="w3_info" style="border-radius: 5px">
                <h2>登录</h2>
                <form action="${pageContext.request.contextPath}/loginOA/loginAfter" method="post">
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input type="text" id="loginname" name="userLogin" placeholder="账户名或邮箱" required="" onblur="username()">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input type="Password" name="userPassword" placeholder="密码" required="">
                    </div>
                    <div class="form-row bottom">
                        <div class="form-check">
                            <input type="checkbox" id="remenber" name="remenber" value="remenber">
                            <label for="remenber"> 记住我？</label>
                        </div>
                        <a href="#url" class="forgot">忘记密码？</a>
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">登录</button>
                </form>
                <p class="continue"><span>或者使用？</span></p>
                <div class="social-login">
                    <a href="#facebook">
                        <div class="facebook">
                            <span class="fab fa-facebook-f" aria-hidden="true"></span>

                        </div>
                    </a>
                    <a href="#twitter">
                        <div class="twitter">
                            <span class="fab fa-twitter" aria-hidden="true"></span>
                        </div>
                    </a>
                    <a href="#google">
                        <div class="google">
                            <span class="fab fa-google" aria-hidden="true"></span>
                        </div>
                    </a>
                </div>
                <p class="account">我还没有账户？<a href="#signup">注册</a></p>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
</div>

<!-- fontawesome v5-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.js">
<script src="${pageContext.request.contextPath}/static/login/js/fontawesome.js"></script>
<script type="text/javascript">
    /*判断是否为全屏模式*/
    if(window !=top){
        top.location.href = location.href;
    }
    function username(){
        $.ajax({
            url:'${pageContext.request.contextPath}/loginOA/loginName',
            type:'post',
            data:{"userLogin":$("#loginname").val()},
            dataType:'json',
            success:function (data){
                var loginName = "Hello "+data.staffName;
                if(loginName == null){
                    loginName = "账号不存在";
                }
                var h2 = document.getElementsByTagName("h2")[0];
                h2.innerHTML = loginName
            }
        })

    }
</script>
</body>

</html>