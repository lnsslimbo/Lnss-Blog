<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>显示用户信息</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>

<body style="background: url(img/wallhaven-73kvkv.jpg);background-size:cover">
<div style="height:100%;background: url(img/o_200403112626wallhaven-3kgjv6.png);background-size: inherit" class="container">
    <%@include file="layout/header.jsp" %>

    <h1>用户信息</h1>
    <table class="table">
        <tbody>
        <tr>
            <th>用户名</th>
            <td>${user.userName}</td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>${user.fullName}</td>
        </tr>
        <tr>
            <th>性别</th>
            <td>${user.gender}</td>
        </tr>
        <tr>
            <th>生日</th>
            <td>${user.birthday}</td>
        </tr>
        <tr>
            <th>手机</th>
            <td>${user.phone}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${user.email}</td>
        </tr>
        <tr>
            <th>微信号</th>
            <td>${user.weChatId}</td>
        </tr>
        <tr>
            <th>描述信息</th>
            <td>${user.description}</td>
        </tr>
        <tr>
            <th>注册日期</th>
            <td>${user.registrationDate}</td>
        </tr>
        </tbody>
    </table>


    <%@include file="layout/footer.jsp" %>
</div>
</body>
</html>