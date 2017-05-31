<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sh.model.*" %>
<%@ page import="com.sh.dao.*" %>
<%@ page import="com.sh.dao.impl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>个人发布商品</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/head.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"  />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"
          type="text/css" />
    <!--引入jquery的js文件-->
    <script  src="js/jquery.min.js"></script>
    <script  src="js/bootstrap.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css"  />

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>

<body>
<!-- 头部DIV -->
<%@include file="head.jsp" %>
<%!	List<Product> listUserProduct;
%>
<%User user = new User();
    user = (User) session.getAttribute("user");
    if (user != null && user.getId() != null) {
        ProductDAO pd = new ProductDAOImpl();
        listUserProduct = pd.listByUid(user.getId());
        session.setAttribute("listUserProduct", listUserProduct);
    }
%>
<!--创建整体布局DIV-->
<div class="container">

    <div class="container">
        <div class="row">
            <a class="btn btn-success" style="height: 50px" href="uploadProduct.jsp"><span>发布新商品</span></a>
            <div style="margin:0 auto; margin-top:10px;width:1150px;">
                <strong>所有发布的商品</strong>

                <table class="table table-bordered">
                    <tbody>
                    <c:forEach var="product" items="${sessionScope.listUserProduct}">
                        <c:set var="pid" value="${product.id}" scope="session"/>
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
                        <tr class="warning">
                            <th>商品图片</th>
                            <th>商品名</th>
                            <th>原价</th>
                            <th>现价</th>
                            <th>库存</th>
                            <th>操作</th>
                        </tr>

                        <tr class="height-center">
                            <td width="20%">
                                <input type="hidden" name="id" value="22">
                                <img src="${sessionScope.product.pimage}" alt="${sessionScope.product.pname}" width="70"
                                     height="60"></td>
                            <td width="10%"><a target="_blank"> ${sessionScope.product.pname}</a></td>
                            <td width="10%">￥${sessionScope.product.originprice}</td>
                            <td width="10%">￥${sessionScope.product.realprice}</td>
                            <td width="10%">${product.pnum}</td>
                            <td width="10%">
                                <button class="btn btn-sm btn-success">更新</button>
                                <button class="btn btn-sm btn-danger">
                                    <a href="api/product/delete?id=${product.id}" style="color: #fff">下架</a>
                                </button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="foot.jsp" %>
</body>

</html>