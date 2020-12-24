<%--
  Created by IntelliJ IDEA.
  User: wulin
  Date: 2020/12/21
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>管理员</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <style type="text/css">
        .message{
            text-align: center;
            background-color: #fff;
            border-radius: 20px;
            width: 300px;
            height: 350px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
    </style>
</head>
<body>
<div class="message">
    <h2>你还没有管理员权限哦！</h2>
    <a href="${APP_PATH}/welcome">点击此处回到首页</a>
</div>
</body>
</html>
