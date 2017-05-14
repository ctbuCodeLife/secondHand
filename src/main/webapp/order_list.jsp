<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sh.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sh.dao.*" %>
<%@ page import="com.sh.dao.impl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>订单表</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"
          type="text/css"/>
    <!--引入jquery的js文件-->
    <script 　type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        .height-center td:not(:last-child){
            line-height: 60px;
            vertical-align: middle;
        }
    </style>
</head>

<body>

<%! List<Sales> listSales;
%>
<%  User user = new User();
    user = (User) session.getAttribute("user");
    if (user != null && user.getId() != null) {
        SalesDAO sd = new SalesDAOImpl();
        listSales = sd.findAll();
        session.setAttribute("listSales", listSales);
    }
%>
<!--创建整体布局DIV-->
<div class="container">
    <%@ include file="head.jsp" %>

    <div class="container">
        <div class="row">

            <div style="margin:0 auto; margin-top:10px;width:1150px;">
                <strong>我的订单</strong>
                <table class="table table-bordered">
                    <tbody>
                    <c:forEach var="sales" items="${sessionScope.listSales}">
                        <c:set var="pid" value="${sales.pid}" scope="session"/>
                        <%
                            try {
                                String param = session.getAttribute("pid").toString();
                                int pId = 0;
                                if (param != null) {
                                    pId = Integer.parseInt(param);
                                }
                                ProductDAO pd = new ProductDAOImpl();
                                Product p = new Product();
                                p = pd.select(pId);
                                session.setAttribute("product", p);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                        <tr class="success">
                            <th colspan="10">订单编号:${sales.invoiceno}</th>
                        </tr>
                        <tr class="warning">
                            <th>图片</th>
                            <th>商品</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>小计</th>
                            <th>状态</th>
                            <th>收货人</th>
                            <th>地址</th>
                            <th>联系电话</th>
                            <th>操作</th>
                        </tr>

                        <tr class="height-center">
                            <td width="10%">
                                <input type="hidden" name="id" value="22">
                                <img src="${sessionScope.product.pimage}" alt="${sessionScope.product.pname}" width="70"
                                     height="60"></td>
                            <td width="10%"><a target="_blank"> ${sessionScope.product.pname}</a></td>
                            <td width="10%">￥${sessionScope.product.realprice}</td>
                            <td width="10%">${sales.count}</td>
                            <td width="10%"><span class="subtotal">￥${sales.totalprice}</span></td>
                            <td width="10%">${sales.orderstatus}</td>
                            <td width="10%">${sales.contactman}</td>
                            <td width="10%">${sales.contactaddr}</td>
                            <td width="10%">${sales.contacttel}</td>
                            <td width="10%"><button class="btn-sm btn-success">确认收货</button>
                                <button class="btn-sm btn-danger"><a href="api/sales/delete?id=${sales.id}">删除订单</a></button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="foot.jsp" %>
</div>
</body>

</html>