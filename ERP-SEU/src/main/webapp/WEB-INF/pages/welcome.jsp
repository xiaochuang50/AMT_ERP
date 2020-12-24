<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/11/18
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>欢迎进入系统</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH}/static/css/welcome.css" type="text/css">
</head>
<body id="welcomePage">

<%--<img src="${APP_PATH}/static/img/welcome.jpg" height="550" width="1130">--%>
</body>
</html>
