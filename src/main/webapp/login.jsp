<%--
  Created by IntelliJ IDEA.
  User: Charlie
  Date: 2021/1/11
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0051)https://getbootstrap.com/docs/4.0/examples/sign-in/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>校园科研互助系统</title>
    <link href="${APP_PATH}/static/Signin_files/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/Signin_files/signin.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

    <script src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">

</head>

<body class="text-center" style="zoom: 1;">
<form class="form-signin">
    <img class="mb-4" src="${APP_PATH}/static/Signin_files/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">请您登录</h1>
    <label for="inputEmail" class="sr-only">输入您的email</label>
    <input type="email" id="inputEmail" class="form-control" placeholder="输入您的email" required="" autofocus="">
    <label for="inputPassword" class="sr-only">输入您的密码</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="输入您的密码" required="">
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> 记住密码
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="button" onclick = "window.location.href = 'index.jsp'">登录</button>

    <p class="mt-5 mb-3 text-muted">© 2020-2021</p>
</form>


<script>mendeleyWebImporter = { open: function () { window.postMessage('0.3946274757069743', 'https://getbootstrap.com') } }</script></body></html>