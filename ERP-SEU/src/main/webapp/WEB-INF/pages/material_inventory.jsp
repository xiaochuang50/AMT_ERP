<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/19
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>物料库存</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--jquery.validate-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.validate.min.js" ></script>
</head>
<body>



<%--搭建显示页面--%>
<div class="container">

    <%--    新增/删除 按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-11">
            <button class="btn btn-info btn-sm" id="employee_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/material?pn=1'">
                <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                刷新
            </button>
        </div>
    </div>

    <%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered">
                <tr>
                    <th>物料编号</th>
                    <th>物料名称</th>
                    <th>供应商</th>
                    <th>剩余数量</th>
                    <th>备注</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="material">
                    <tr>
                        <th>${material.materialId}</th>
                        <th>${material.materialName}</th>
                        <th>${material.supplier}</th>
                        <th>${material.materialNum}</th>
                        <th>${material.remark}</th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
        <%--            分页条信息--%>
        <div class="col-md-6">

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/material?pn=1">首页</a></li>

                    <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/material?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--                        循环遍历分页条--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <%--                            判断页码是否等于当前页码，如果等于就让他高亮显示，并且点击无效--%>
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <%--                            如果不等于就正常显示，点击可以正常跳转--%>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <%--                               href="${APP_PATH}/emps?pn=${page_num}跳转到点击的页码 --%>
                            <li><a href="${APP_PATH}/material?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/material?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/material?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>

        </div>
</div>


<script type="text/javascript">

    //点击新增按钮，弹出模态框
$("#material_add_modal_btn").click(function () {
    //弹出模态框
    $("#materialAddModal").modal({
        backdrop:"static"
    });
});

</script>

</body>
</html>
