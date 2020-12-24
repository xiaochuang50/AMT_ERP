<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/11/19
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>员工管理</title>
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

<%------------------------------ 员工添加的模态框 ------------------------------%>
<div class="modal fade" id="employeeAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addEmployee" method="post">
                    <%-- empName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="employee name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- gender --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="text" name="gender" class="form-control" id="gender_add_input" placeholder="gender">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- phone --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_add_input" placeholder="phone">
                            <span class="help-block"></span>
                        </div>
                    </div>
                        <%-- empDate --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">入职时间</label>
                            <div class="col-sm-10">
                                <input type="date" name="empDate" class="form-control" id="empDate_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <%-- state --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">状态</label>&nbsp;&nbsp;&nbsp;
                            <label class="radio-inline">
                                <input type="radio" name="state" id="inlineRadio1" value="在职"> 在职
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="state" id="inlineRadio2" value="请假"> 请假
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="state" id="inlineRadio3" value="离职"> 离职
                            </label>
                        </div>
                        <%-- department --%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <%-- 下拉列表，部门选项只要提交部门id即可 --%>
                                <select class="form-control" name="deptId" id="dept_select"></select>
                            </div>
                        </div>
                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="department_save_btn" onclick="submitEmployee();">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>


<%------------------------------ 员工修改的模态框 -----------------------------%>
<div class="modal fade" id="employeeUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工信息修改</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="updateEmployee" method="post">
                    <%-- empName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update_input" placeholder="employee name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- gender --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="text" name="gender" class="form-control" id="gender_update_input" placeholder="gender">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- phone --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_update_input" placeholder="phone">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- empDate --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">入职时间</label>
                        <div class="col-sm-10">
                            <input type="date" name="empDate" class="form-control" id="empDate_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- state --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>&nbsp;&nbsp;&nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="state" id="update_inlineRadio1" value="在职"> 在职
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="state" id="update_inlineRadio2" value="请假"> 请假
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="state" id="update_inlineRadio3" value="离职"> 离职
                        </label>
                    </div>
                    <%-- department --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <%-- 下拉列表，部门选项只要提交部门id即可 --%>
                            <select class="form-control" name="deptId" id="dept_select"></select>
                        </div>
                    </div>
                    <input type="hidden" name="employeeId" id="employeeId_update_input">

                </form>
                <%------------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="department_update_btn" onclick="updateEmployee()">确认修改</button>
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
            <button class="btn btn-info btn-sm" id="employee_add_modal_btn">
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
                    <th>员工编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>联系方式</th>
                    <th>入职日期</th>
                    <th>部门</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="employee" step="1">
                    <tr>
                        <th>${employee.employeeId}</th>
                        <th>${employee.empName}</th>
                        <th>${employee.gender}</th>
                        <th>${employee.phone}</th>
                        <th><fmt:formatDate value="${employee.empDate}" pattern="yyyy-MM-dd "/></th>
                        <th>${employee.deptName}</th>
                        <th>${employee.state}</th>
                        <th>
                            <button class="btn btn-success btn-sm edit_btn" onclick="updateEmployeeModal('${employee.employeeId}','${employee.empName}','${employee.gender}','${employee.phone}','${employee.empDate}','${employee.deptId}','${employee.state}');">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="deleteEmployee(${employee.employeeId});">
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
                    <li><a href="${APP_PATH}/employee?pn=1">首页</a></li>

                    <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/employee?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
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
                            <li><a href="${APP_PATH}/employee?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/employee?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/employee?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>

        </div>
</div>

    <script type="text/javascript">
        //点击新增按钮，弹出模态框
        $("#employee_add_modal_btn").click(function () {
            $("#employeeAddModal select").empty();
            $.ajax({
                url:"${APP_PATH}/deptsFormEcho",
                type:"GET",
                success:function (res) {
                    // 点击添加后，最终返回的json字符串是这样的
                    // {"code":100,"msg":"处理成功!",
                    //     "extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}

                    //遍历部门信息，在下拉列表中显示部门信息
                    $.each(res.extend.depts, function () {
                        //在遍历之前
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);

                        //将option标签添加到empAddModal下的select标签中
                        //传入ele参数，调用时只需把对应id作为参数即可
                        optionEle.appendTo("#employeeAddModal select");

                        //将option标签添加到empUpdateModal下的select标签中，用于编辑的模态框
                        // optionEle.appendTo("#empUpdateModal select");
                    });
                }
            });
            //弹出模态框
            $("#employeeAddModal").modal({
                backdrop:"static"
            });
        });

        function submitEmployee(){
            $("#employeeAddModal form").validate({
                rules: {
                    empName: "required",
                    gender:"required",
                    phone:"required",
                    empDate:"required",
                    state:"required",
                    deptName:"required"
                },
                messages: {
                    empName: "请输入员工姓名",
                    gender:"请输入员工性别",
                    phone:"请输入员工联系方式",
                    empDate:"请输入入职日期",
                    state:"请输入员工状态",
                    deptName:"请输入员工所在部门"
                }
            });
            $("#employeeAddModal form").submit();
        }


        function updateEmployeeModal(employeeId,empName,gender,phone,empDate,deptName,state){
            // alert(EmployeeId+empName+gender+phone+empDate+deptName+state);
            $("#employeeUpdateModal select").empty();
            $.ajax({
                url:"${APP_PATH}/deptsFormEcho",
                type:"GET",
                success:function (res) {
                    // 点击添加后，最终返回的json字符串是这样的
                    // {"code":100,"msg":"处理成功!",
                    //     "extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}

                    //遍历部门信息，在下拉列表中显示部门信息
                    $.each(res.extend.depts, function () {
                        //在遍历之前
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);

                        //将option标签添加到empAddModal下的select标签中
                        //传入ele参数，调用时只需把对应id作为参数即可
                        optionEle.appendTo("#employeeUpdateModal select");

                        //将option标签添加到empUpdateModal下的select标签中，用于编辑的模态框
                        // optionEle.appendTo("#empUpdateModal select");
                    });
                }
            });
            //弹出修改模态框
            $("#employeeUpdateModal").modal({
                backdrop:"static"
            });
            $("#employeeId_update_input").attr({
                value : employeeId
            });
            $("#empName_update_input").attr({
                value : empName
            });
            $("#gender_update_input").attr({
                value : gender
            });
            $("#phone_update_input").attr({
                value : phone
            });
            $("#empDate_update_input").attr({
                value : empDate
            });
            $("#deptId_update_input").attr({
                value : deptId
            });
            $("#state_update_input").attr({
                value : state
            });
        }

        function updateEmployee(){
            $("#employeeUpdateModal form").submit();
        }

        function deleteEmployee(employeeId){
            if (confirm("你真的要删除吗？")==true){
                window.location.href="${APP_PATH}/deleteEmployee?employeeId="+employeeId;
            }else {
                return false;
            }
        }

    </script>

</body>
</html>
