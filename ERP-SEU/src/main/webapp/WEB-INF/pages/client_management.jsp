<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/11/16
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>客户管理</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <%--   web路径：
                不以/开始的相对路径，找资源是以当前资源的路径为基准，经常容易出问题
                而以/开始的相对路径，是以服务器的路径为标注的（http://localhost:3306），需要加上项目名
                        http://localhost:3306/crud
       --%>
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

<%------------------------------ 客户添加的模态框 ------------------------------%>
<div class="modal fade" id="clientAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增客户</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addClient" method="post">
                    <%-- empName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientName" class="form-control" id="empName_add_input" placeholder="client name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- address --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_add_input" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- phone --%>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">客户电话</label>
                         <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_add_input" placeholder="phone">
                            <span class="help-block"></span>
                         </div>
                    </div>
                    <%-- email --%>
                    <div class="form-group">
                         <label class="col-sm-2 control-label">客户邮箱</label>
                         <div class="col-sm-10">
                             <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email">
                             <span class="help-block"></span>
                         </div>
                    </div>
                    <%-- manager --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户经理</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientManager" class="form-control" id="clientManager_add_input" placeholder="client manager">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="client_save_btn" onclick="submitClient();">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<%------------------------------ 客户修改的模态框 -----------------------------%>
<div class="modal fade" id="clientUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">客户信息修改</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="updateClient" method="post">
                    <%-- empName --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientName" class="form-control" id="empName_update_input" placeholder="client name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- address --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_update_input" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- phone --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_update_input" placeholder="phone">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- email --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%-- manager --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户经理</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientManager" class="form-control" id="clientManager_update_input" placeholder="client manager">
                            <span class="help-block"></span>
                        </div>
                    </div>
                        <input type="hidden" name="clientId" class="form-control" id="clientId_update_input">
                </form>
                <%------------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="client_update_btn" onclick="updateClient()">确认修改</button>
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
            <button class="btn btn-info btn-sm" id="client_add_modal_btn">
                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-info btn-sm" id="client_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/client?pn=1'">
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
                    <th>客户编号</th>
                    <th>客户名称</th>
                    <th>客户地址</th>
                    <th>客户电话</th>
                    <th>客户邮箱</th>
                    <th>客户经理</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="client">
                    <tr>
                        <th>${client.clientId}</th>
                        <th>${client.clientName}</th>
                        <th>${client.address}</th>
                        <th>${client.phone}</th>
                        <th>${client.email}</th>
                        <th>${client.clientManager}</th>
                        <th>
                            <button class="btn btn-success btn-sm edit_btn" onclick="updateClientModal('${client.clientId}','${client.clientName}','${client.address}','${client.phone}','${client.email}','${client.clientManager}');">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="deleteClient(${client.clientId});">
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
                    <li><a href="${APP_PATH}/client?pn=1">首页</a></li>

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
                            <li><a href="${APP_PATH}/client?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/client?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/client?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>

        </div>
</div>

</div>

<script type="text/javascript">
    //点击新增按钮，弹出模态框
    $("#client_add_modal_btn").click(function () {
        //弹出模态框
        $("#clientAddModal").modal({
            backdrop:"static"
        });
    });

    //=============================================================================

    function updateClientModal(clientId,clientName,address,phone,email,clientManager){
        // alert(clientName+address+phone+email+clientManager);
        //弹出修改模态框
        $("#clientUpdateModal").modal({
            backdrop:"static"
        });
        $("#empName_update_input").attr({
            value : clientName
        });
        $("#address_update_input").attr({
            value : address
        });
        $("#phone_update_input").attr({
            value : phone
        });
        $("#email_update_input").attr({
            value : email
        });
        $("#clientManager_update_input").attr({
            value : clientManager
        });
        $("#clientId_update_input").attr({
            value : clientId
        });
    }

    function updateClient(){
        $("#clientUpdateModal form").validate({
            rules: {
                clientName: "required",
                address:"required",
                phone: {
                    required: true,
                    isPhone: true
                },
                email: {
                    required: true,
                    email:true
                },
                clientManager:"required"
            },
            messages: {
                clientName: "请输入姓名",
                address: "请输入地址",
                phone: {
                    required: "请输入电话",
                    isPhone: "电话格式不正确"
                },
                email: {
                    required: "请输入邮箱",
                    email: "邮箱格式不正确"
                },
                clientManager: "请输入客户经理",
            }
        });
        $("#clientUpdateModal form").submit();
    }

    function submitClient(){
        $("#clientAddModal form").validate({
            rules: {
                clientName: "required",
                address:"required",
                phone: {
                    required: true,
                    isPhone: true
                },
                email: {
                    required: true,
                    email:true
                },
                clientManager:"required"
            },
            messages: {
                clientName: "请输入姓名",
                address: "请输入地址",
                phone: {
                    required: "请输入电话",
                    isPhone: "电话格式不正确"
                },
                email: {
                    required: "请输入邮箱",
                    email: "邮箱格式不正确"
                },
                clientManager: "请输入客户经理",
            }
        });
        $("#clientAddModal form").submit();
    }

    $.validator.addMethod("isPhone", function(value, element) {
        var length = value.length;
        var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "电话格式不正确");


    function deleteClient(clientId){
        // alert(clientId);
        if (confirm("你真的要删除吗？")==true){
            window.location.href="${APP_PATH}/deleteClient?clientId="+clientId;
        }else {
            return false;
        }

    }
</script>

</body>
</html>
