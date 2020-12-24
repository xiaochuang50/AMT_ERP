<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/11/15
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ERP企业资源管理</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/home.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

<!--顶部导航栏部分-->
<nav class="navbar navbar2">
    <div class="container-fluid">
        <!-- logo设置 -->
        <div class="navbar-header">
            <a class="logo" title="logoTitle" href="${APP_PATH}/welcome" target="mainFrame">ERP 企业资源管理</a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="#">当前用户：<span class="badge">管理员</span></a>
                </li>
                <li>
                    <a href="${APP_PATH}/logout"><span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>

    </div>   <!-- .container-fluid -->
</nav>

<!-- 主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

            <!-- 个人中心 -->
            <div class="panel2">

                <div class="panel-heading" role="tab">
                    <h4 class="panel-title">
                        <a href="${APP_PATH}/welcome" target="mainFrame">
                            <span class="glyphicon glyphicon-fire"></span>
                            首页
                        </a>
                    </h4>
                </div>

            </div>

            <!-- 生产计划 -->
            <div class="panel2">

                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <span class="glyphicon glyphicon-stats"></span>
                            生产计划
                            <span class="glyphicon glyphicon-menu-left pull-right"></span>
                        </a>
                    </h4>
                </div>

                <div id="collapseOne" class="collapse panel3" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="${APP_PATH}/order" target="mainFrame">订单管理</a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="schedule" target="mainFrame">生产进度</a>
                        </p>
                    </div>
                </div>
            </div>

            <!--  设备管理 -->
            <div class="panel2">

                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <span class="glyphicon glyphicon-wrench"></span>
                            设备管理
                            <span class="glyphicon glyphicon-menu-left pull-right"></span>
                        </a>
                    </h4>
                </div>

                <div id="collapseTwo" class="collapse panel3" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="${APP_PATH}/equipmentAccount?pn=1" target="mainFrame">设备台账</a>
                        </p>
<%--                        <p>--%>
<%--                            <span class="glyphicon glyphicon-record"></span>--%>
<%--                            <a href="nav2.html" target="mainFrame">设备种类</a>--%>
<%--                        </p>--%>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="${APP_PATH}/equipmentInspect?pn=1" target="mainFrame">设备例检</a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="${APP_PATH}/equipmentFault?pn=1" target="mainFrame">设备故障</a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="${APP_PATH}/equipmentMt?pn=1" target="mainFrame">设备维修</a>
                        </p>
                    </div>
                </div>
            </div>

            <!--  物料管理 -->
            <div class="panel2">

                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                            <span class="glyphicon glyphicon-random"></span>
                            物料管理
                            <span class="glyphicon glyphicon-menu-left pull-right"></span>
                        </a>
                    </h4>
                </div>

                <div id="collapseThree" class="collapse panel3" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="material" target="mainFrame">物料库存</a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="materialEnter" target="mainFrame">物料收入</a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-record"></span>
                            <a href="materialOut" target="mainFrame">物料消耗</a>
                        </p>
                    </div>
                </div>

                <!-- 人员管理 -->
                <div class="panel2">

                    <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                <span class="glyphicon glyphicon-user"></span>
                                人员监控
                                <span class="glyphicon glyphicon-menu-left pull-right"></span>
                            </a>
                        </h4>
                    </div>

                    <div id="collapseFour" class="collapse panel3" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <p>
                                <span class="glyphicon glyphicon-record"></span>
                                <a href="${APP_PATH}/department" target="mainFrame">部门管理</a>
                            </p>
                            <p>
                                <span class="glyphicon glyphicon-record"></span>
                                <a href="${APP_PATH}/employee" target="mainFrame">员工管理</a>
                            </p>
                            <p>
                                <span class="glyphicon glyphicon-record"></span>
                                <a href="${APP_PATH}/client?pn=1" target="mainFrame">客户管理</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>

    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="welcome" id="mainFrame" name="mainFrame"
                frameborder="0" width="100%"  height="100%" frameBorder="0">
        </iframe>
    </div>

</div>		<!-- 主体部分结束 -->

<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2020 © ERP企业资源管理 Wulin 版权所有
    </p>
</div>


</body>
</html>