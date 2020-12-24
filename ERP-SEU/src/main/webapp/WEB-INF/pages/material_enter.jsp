<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/19
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>物料入库</title>
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

<%------------------------------ 物料收入添加的模态框 ------------------------------%>
<div class="modal fade" id="materialEnterAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增物料</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addMaterialEnter" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="materialId" class="form-control" id="materialId_add_input" placeholder="material id">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">物料名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="materialName" class="form-control" id="materialName_add_input" placeholder="material name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">收入数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="enterNum" class="form-control" id="enterNum_add_input" placeholder="enter number">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">收入日期</label>
                        <div class="col-sm-10">
                            <input type="date" name="enterDate" class="form-control" id="enterDate_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">供应商</label>
                        <div class="col-sm-10">
                            <input type="text" name="supplier" class="form-control" id="supplier_add_input" placeholder="supplier">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="client_save_btn" onclick="submitMaterialEnter();">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<%--搭建显示页面--%>
<div class="container">

    <%--    新增/删除 按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-info btn-sm" id="materialEnter_add_modal_btn">
                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-info btn-sm" id="employee_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/employee?pn=1'">
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
                    <th>收入数量</th>
                    <th>收入日期</th>
                    <th>供应商</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="materialEnter" step="1">
                    <tr>
                        <th>${materialEnter.materialId}</th>
                        <th>${materialEnter.materialName}</th>
                        <th>${materialEnter.enterNum}</th>
                        <th><fmt:formatDate value="${materialEnter.enterDate}" pattern="yyyy-MM-dd "/></th>
                        <th>${materialEnter.supplier}</th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--            分页条信息--%>
    <div class="col-md-6">

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${APP_PATH}/materialEnter?pn=1">首页</a></li>

                <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${APP_PATH}/materialEnter?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
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
                        <li><a href="${APP_PATH}/materialEnter?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>

                <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${APP_PATH}/materialEnter?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${APP_PATH}/materialEnter?pn=${pageInfo.pages}">尾页</a></li>
            </ul>
        </nav>
    </div>
</div>

<script type="text/javascript">
    //点击新增按钮，弹出模态框
    $("#materialEnter_add_modal_btn").click(function () {
        //弹出模态框
        $("#materialEnterAddModal").modal({
            backdrop:"static"
        });
    });

    function submitMaterialEnter(){
        $("#MaterialEnterAddModal form").submit();
    }

</script>

</body>
</html>
