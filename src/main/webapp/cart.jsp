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
    <title>购物车</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"
          type="text/css"/>
    <!--引入jquery的js文件-->
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style>
        .count-btn {
            background: red;
            color: #fff;
            font-weight: bolder;
        }
        .heiget-auto-center{
            line-height: 80px;
            vertical-align: middle;
        }
        .btn-height-auto-center{
            position: relative;
            top: 23px;
        }
    </style>
</head>
<body>
<%!
    List<Cart> listShopCart;
%>
<%
    int cId = 0;
    User user = (User) session.getAttribute("user");
    if (user != null) {
        cId = user.getId();
    }
    CartDAO scd = new CartDAOImpl();
    listShopCart = scd.findAll();
    session.setAttribute("listShopCart", listShopCart);
%>
<!-- 头部DIV -->
<%@include file="head.jsp" %>
<!-- 主体DIV  -->
<div class="container">
    <div class="row">
        <div style="margin: 0 auto; margin-top: 10px; width: 1150px;">
            <strong style="font-size: 16px; margin: 5px 0;">购物车详情</strong>
            <table class="table table-bordered">
                <tbody>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品名</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="shopcart" items="${sessionScope.listShopCart}">
                    <c:set var="pid" value="${shopcart.pid}" scope="session"/>
                    <c:set var="cart" value="${shopcart}" scope="session"/>
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

                        <tr class="active">
                            <td width="40%">
                                <input type="hidden" name="id" value="${sessionScope.product.id}">
                                <a  class="heiget-auto-center" href="product_info.jsp?id=${sessionScope.product.id}">
                                    <img src="${sessionScope.product.pimage}"
                                         alt="${sessionScope.product.pname}" width="auto" height="85px"
                                         style="display: inline-block;">
                                </a>
                            </td>
                            <td width="15%">
                                <a class="heiget-auto-center" target="_blank"
                                   href="product_info.jsp?id=${sessionScope.product.id}">${sessionScope.product.pname}</a>
                            </td>
                            <td width="10%">
                                <span id="price" class="heiget-auto-center">${sessionScope.product.realprice}</span>元
                            </td>
                            <td width="10%">
                                <input type="hidden" value="${shopcart.count}">
                                <span class="heiget-auto-center">${shopcart.count}</span>
                            </td>
                            <td width="10%">
                                <span id="total" class="subtotal heiget-auto-center">￥${shopcart.totalprice}元</span>
                            <td width="">
                                <a href="DelShopCart?id=${shopcart.id}" class="btn btn-danger btn-height-auto-center ">删除</a>
                            <a class="btn btn-success btn-height-auto-center " href="order_info.jsp">下单</a>
                            </td>
                        </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>