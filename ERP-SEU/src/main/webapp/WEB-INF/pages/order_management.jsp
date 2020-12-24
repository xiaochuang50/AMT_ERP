<%--
  Created by IntelliJ IDEA.
  User: Wulin
  Date: 2020/12/15
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>员工列表</title>

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
</head>
<body>

<%------------------------------ 订单添加的模态框 ------------------------------%>
<div class="modal fade" id="OrderAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增订单</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="addOrder" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientName" class="form-control" id="clientName_add_input" placeholder="client name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="product" class="form-control" id="product_add_input" placeholder="product">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品型号</label>
                        <div class="col-sm-10">
                            <input type="text" name="productId" class="form-control" id="productId_add_input" placeholder="produc id">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="orderNum" class="form-control" id="orderNum_add_input" placeholder="order number">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price_add_input" placeholder="price">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购日期</label>
                        <div class="col-sm-10">
                            <input type="date" name="orderDate" class="form-control" id="orderDate_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <%----------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="client_save_btn" onclick="submitOrder();">保存</button>
            </div>
        </div>
    </div>
</div>
<%----------------------------------------------------------------------------%>

<%------------------------------ 订单修改的模态框 -----------------------------%>
<div class="modal fade" id="OrderUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">订单信息修改</h4>
            </div>
            <div class="modal-body">

                <%------------------------------ 表单 ------------------------------%>
                <form class="form-horizontal" action="updateOrder" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="clientName" class="form-control" id="clientName_update_input" placeholder="client name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="product" class="form-control" id="product_update_input" placeholder="product">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品型号</label>
                        <div class="col-sm-10">
                            <input type="text" name="productId" class="form-control" id="productId_update_input" placeholder="produc id">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="orderNum" class="form-control" id="orderNum_update_input" placeholder="order number">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price_update_input" placeholder="price">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订购日期</label>
                        <div class="col-sm-10">
                            <input type="date" name="orderDate" class="form-control" id="orderDate_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <input type="hidden" name="orderId" id="orderId_update_input">
                </form>
                <%------------------------------------------------------------------%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="department_update_btn" onclick="updateOrder()">确认修改</button>
            </div>
        </div>
    </div>
</div>

<%--搭建显示页面--%>
<div class="container">

    <%--    新增/删除 按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-info btn-sm" id="order_add_modal_btn">
                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-info btn-sm" id="employee_refresh_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/order?pn=1'">
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
                    <th>订单编号</th>
                    <th>订购客户</th>
                    <th>订购产品</th>
                    <th>产品型号</th>
                    <th>订购数量</th>
                    <th>订购单价</th>
                    <th>订单总价</th>
                    <th>订购日期</th>
                    <th>操作</th>
                </tr>

                <c:forEach items="${pageInfo.list}" var="order" step="1">
                    <tr>
                        <th>${order.orderId}</th>
                        <th>${order.clientName}</th>
                        <th>${order.product}</th>
                        <th>${order.productId}</th>
                        <th>${order.orderNum}</th>
                        <th>${order.price}</th>
                        <th>${order.orderNum * order.price}</th>
                        <th><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd "/></th>
                        <th>
                            <button class="btn btn-success btn-sm edit_btn" onclick="updateOrderModal('${order.orderId}','${order.clientName}','${order.product}','${order.productId}','${order.orderNum}','${order.price}','<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd "/>')">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm" onclick="deleteOrder(${order.orderId})">
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
                    <li><a href="${APP_PATH}/order?pn=1">首页</a></li>

                    <%--                        判断是否有上一页（是否是第一页），如果是，则不显示该标签，如果不是，点击可以跳转到上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/order?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
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
                            <li><a href="${APP_PATH}/order?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--                        判断是否有下一页（是否是最后一页），如果是，则不显示该标签，如果不是，点击可以跳转到下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/order?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/order?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>

        </div>

</div>

<script type="text/javascript">
    //点击新增按钮，弹出模态框
    $("#order_add_modal_btn").click(function () {
        //弹出模态框
        $("#OrderAddModal").modal({
            backdrop:"static"
        });
    });

    function submitOrder(){
        $("#OrderAddModal form").submit();
    }


    function deleteOrder(orderId){
        if (confirm("你真的要删除吗？")==true){
            window.location.href="${APP_PATH}/deleteOrder?orderId="+orderId;
        }else {
            return false;
        }
    }

    function updateOrderModal(orderId,clientName,product,productId,orderNum,price,orderDate){
        // alert(orderId+clientName+product+productId+orderNum+price+orderDate);
        //弹出修改模态框
        $("#OrderUpdateModal").modal({
            backdrop:"static"
        });
        $("#orderId_update_input").attr({
            value : orderId
        });
        $("#clientName_update_input").attr({
            value : clientName
        });
        $("#product_update_input").attr({
            value : product
        });
        $("#productId_update_input").attr({
            value : productId
        });
        $("#orderNum_update_input").attr({
            value : orderNum
        });
        $("#price_update_input").attr({
            value : price
        });
        $("#orderDate_update_input").attr({
            value : orderDate
        });
    }

    function updateOrder(){
        $("#OrderUpdateModal form").submit();
    }
</script>
</body>
</html>
