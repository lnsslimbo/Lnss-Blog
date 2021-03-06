<%@ page language="java" import="java.util.*" import="com.liu.blog.entity.User" pageEncoding="utf-8" %>
<%@ page import="com.liu.blog.entity.ArticleType" %>
<%@ page import="com.liu.blog.entity.Article" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>查找用户</title>

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
    <h1>查询用户</h1>
    <form class="form-inline my-2 my-lg-0" action="searchUser" method="post">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
               name="fullNameOrDescriptionLike" id="fullNameOrDescriptionLike">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">按姓名或描述信息模糊查询</button>
    </form>
    <table class="table table-hover">
        <tr>
            <th>用户名</th>
            <th>姓名</th>
            <th>查看文章</th>
            <th>查看文章分类</th>
        </tr>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.userName}</td>
                <td>${user.fullName}</td>
                <td><a href="manageArticleByUser?userName=${user.userName}">查看</a></td>
                <td><a href="displayArticleType?userName=${user.userName}">查看</a></td>
            </tr>
        </c:forEach>

    </table>
    <%@include file="layout/footer.jsp" %>
</div>
</body>
</html>
