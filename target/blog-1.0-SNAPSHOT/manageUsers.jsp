<%@ page language="java" import="java.util.*" import="com.liu.blog.entity.User" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>管理用户</title>

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
        <h1>管理用户</h1>
        <table class="table table-hover">
            <tr>
                <th>用户名</th>
                <th>姓名</th>
                <th>角色</th>
                <th>状态</th>
                <th>操作</th>
<%--                <th>查看用户信息</th>--%>
<%--                <th>修改用户信息</th>--%>
<%--                <th>修改用户密码</th>--%>
<%--                <th>更改用户状态</th>--%>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.userName}</td>
                    <td>${user.fullName}</td>
                    <td>${user.role}</td>
                    <td>${user.status}</td>
                    <td>${user.userName}</td>
                    <td>
                        <a href="displayUser?userName=${user.userName}">查看信息</a>
                        <a href="changeUserInformation?userName=${user.userName}">修改信息</a>
                        <a href="changeUserPassword?userName=${user.userName}">修改密码</a>
                        <a href="changeUserStatus?userName=${user.userName}">更改状态</a>
                        <a href="deleteUser?userName=${user.userName}">删除用户</a>

                    </td>
                </tr>
            </c:forEach>

        </table>
        <%@include file="layout/footer.jsp" %>
    </div>
</body>
</html>