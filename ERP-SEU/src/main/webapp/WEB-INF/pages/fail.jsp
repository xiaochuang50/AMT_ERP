<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/14
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
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
    <h2>用户名或密码错误哦！</h2>
    <a href="${APP_PATH}/index.jsp">点击此处回到登录页面</a>
</div>

</body>
</html>
