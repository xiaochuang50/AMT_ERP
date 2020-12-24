<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/11/19
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>设备维修</title>
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

<%------------------------------设备维修添加的模态框 ------------------------------%>
<div class="modal fade" id="EqMtAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增设备</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addEqMt" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">设备编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="equipmentId" class="form-control" id="equipmentId_add_input" placeholder="equipment id">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">设备名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="equipmentName" class="form-control" id="equipmentName_add_input" placeholder="equipment name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">维修方式</label>
                        <div class="col-sm-10">
                            <input type="text" name="mtWay" class="form-control" id="mtWay_add_input" placeholder="maintenance way">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">维修结果</label>
                        <div class="col-sm-10">
                            <input type="text" name="mtResult" class="form-control" id="mtResult_add_input" placeholder="maintenance result">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">维修费用</label>
                        <div class="col-sm-10">
                            <input type="text" name="cost" class="form-control" id="cost_add_input" placeholder="cost">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <%----------------------------------------------------------------%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="client_save_btn" onclick="submitEqMt();">保存</button>
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
            <button class="btn btn-info btn-sm" id="EqMt_add_modal_btn">
                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-info btn-sm" id="employee_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/equipmentMt?pn=1'">
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
                    <th>设备编号</th>
                    <th>设备名称</th>
                    <th>维修方式</th>
                    <th>维修结果</th>
                    <th>维修费用</th>
<%--                    <th>操作</th>--%>
                </tr>
                <c:forEach items="${pageInfo.list}" var="equipmentMt">
                    <tr>
                        <th>${equipmentMt.equipmentId}</th>
                        <th>${equipmentMt.equipmentName}</th>
                        <th>${equipmentMt.mtWay}</th>
                        <th>${equipmentMt.mtResult}</th>
                        <th>${equipmentMt.cost}</th>
<%--                        <th>--%>
<%--                            <button class="btn btn-success btn-sm edit_btn" onclick="updateEmployeeModal()">--%>
<%--                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>--%>
<%--                                编辑--%>
<%--                            </button>--%>
<%--                            <button class="btn btn-danger btn-sm" onclick="deleteEmployee(${material.materialId});">--%>
<%--                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>--%>
<%--                                删除--%>
<%--                            </button>--%>
<%--                        </th>--%>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

        <%--            分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/equipmentMt?pn=1">首页</a></li>

                    <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/equipmentMt?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
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
                            <li><a href="${APP_PATH}/equipmentMt?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/equipmentMt?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH}/equipmentMt?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
</div>

<script type="text/javascript">
    //点击新增按钮，弹出模态框
    $("#EqMt_add_modal_btn").click(function () {
        //弹出模态框
        $("#EqMtAddModal").modal({
            backdrop:"static"
        });
    });

    function submitEqMt(){
        $("#EqMtAddModal form").submit();
    }
</script>

</body>
</html>
