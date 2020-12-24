<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/11/19
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>部门管理</title>
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
<%------------------------------ 部门添加的模态框 ------------------------------%>
<div class="modal fade" id="departmentAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增部门</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addDepartment" method="post">
                    <%-- deptName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptName" class="form-control" id="deptName_add_input" placeholder="department name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- deptDuty --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门职责</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptDuty" class="form-control" id="address_add_input" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="department_save_btn" onclick="submitDepartment();">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<%------------------------------ 部门修改的模态框 -----------------------------%>
<div class="modal fade" id="departmentUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">部门信息修改</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="updateDepartment" method="post">
                    <%-- deptName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptName" class="form-control" id="deptName_update_input" placeholder="department name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- address --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门职责</label>
                        <div class="col-sm-10">
                            <input type="text" name="deptDuty" class="form-control" id="deptDuty_update_input" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <input type="hidden" name="deptId" class="form-control" id="deptId_update_input">
                </form>
                <%------------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="department_update_btn" onclick="updateDepartment()">确认修改</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------%>


<%--搭建显示页面--%>
<div class="container">

    <%--    新增/删除 按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-info btn-sm" id="department_add_modal_btn">
                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-info btn-sm" id="department_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/department?pn=1'">
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
                    <th>部门编号</th>
                    <th>部门名称</th>
                    <th>部门职责</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="department">
                    <tr>
                        <th>${department.deptId}</th>
                        <th>${department.deptName}</th>
                        <th>${department.deptDuty}</th>
                        <th>
                            <button class="btn btn-success btn-sm edit_btn" onclick="updateDepartmentModal('${department.deptId}','${department.deptName}','${department.deptDuty}');">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="deleteClient(${department.deptId});">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <%--            分页条信息--%>
    <div class="col-md-6">

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${APP_PATH}/department?pn=1">首页</a></li>

                <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${APP_PATH}/client?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
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
                        <li><a href="${APP_PATH}/department?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>

                <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${APP_PATH}/department?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${APP_PATH}/department?pn=${pageInfo.pages}">尾页</a></li>
            </ul>
        </nav>

    </div>
</div>

</div>

<script type="text/javascript">

    //点击新增按钮，弹出模态框
    $("#department_add_modal_btn").click(function () {
        //弹出模态框
        $("#departmentAddModal").modal({
            backdrop:"static"
        });
    });

    function submitDepartment(){
        $("#departmentAddModal form").validate({
            rules: {
                deptName: "required",
                deptDuty:"required",
            },
            messages: {
                deptName: "请输入部门名称",
                deptDuty: "请输入部门职责",
            }
        });
        $("#departmentAddModal form").submit();
    }

    function updateDepartmentModal(deptId,deptName,deptDuty){
        // alert(deptId+deptName+deptDuty);
        //弹出修改模态框
        $("#departmentUpdateModal").modal({
            backdrop:"static"
        });
        $("#deptName_update_input").attr({
            value : deptName
        });
        $("#deptDuty_update_input").attr({
            value : deptDuty
        });
        $("#deptId_update_input").attr({
            value : deptId
        });
    }

    function updateDepartment(){
        $("#departmentUpdateModal form").validate({
            rules: {
                deptName: "required",
                deptDuty:"required",
            },
            messages: {
                deptName: "请输入部门名称",
                deptDuty: "请输入部门职责",
            }
        });
        $("#departmentUpdateModal form").submit();
    }


    function deleteClient(deptId){
        // alert(deptId);
        if (confirm("你真的要删除吗？")==true){
            window.location.href="${APP_PATH}/deleteDepartment?deptId="+deptId;
        }else {
            return false;
        }
    }

</script>
</body>
</html>
