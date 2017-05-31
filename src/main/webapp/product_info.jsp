<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sh.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sh.dao.*" %>
<%@ page import="com.sh.dao.impl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>商品信息</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="css/head.css">
    <!--引入jquery的js文件-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        .count-btn {
            background: red;
            color: #fff;
            font-weight: bolder;
        }

        #productImg img {
            margin-left: 100px;
            width: 271px;
            height: 308px;
        }

        #productImgInfo img {
            max-width: 100%;
            max-height: 100%;
        }
    </style>
</head>

<body>
<!--创建整体布局DIV-->
<div class="container">
    <%@ include file="head.jsp" %>

    <%
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO pd = new ProductDAOImpl();
            Product product = pd.select(id);
            if (product != null) {
                request.setAttribute("product", product);
                int uid = product.getUid();
                UserDAO ud = new UserDAOImpl();
                User user = ud.select(uid);
                request.setAttribute("tel", user.getTel());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div class="container">
        <div class="row">
            <c:if test="${not empty requestScope.product}">

                <div style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
                    <a href="./index.jsp">首页&nbsp;&nbsp;&gt;</a>
                    <a href="./product_list_by_kid.jsp?kid=${product.kid}">
                        <c:set
                                var="kId" value="${product.kid}" scope="request">
                        </c:set> <%
                        kd = new KindDAOImpl();
                        String kId = request.getAttribute("kId").toString();
                        Kind k = kd.select(new Integer(kId));
                        request.setAttribute("kName", k.getKname());
                    %>
                        <c:if test="${not empty requestScope.kName}">
                            ${requestScope.kName}
                        </c:if>&nbsp;&nbsp;&gt;</a> <a>${product.pname}</a>
                </div>

                <div style="margin: 0 auto; width: 950px;">
                    <div id="productImg" class="col-md-6">
                        <a href="product_info.jsp?id=${product.id}">
                            <img src="${product.pimage}" alt="${product.pname}" width="170" height="170"
                                 style="display: inline-block;">
                        </a>
                    </div>

                    <div class="col-md-6">
                        <div>
                            <strong>${product.pname}</strong>
                        </div>
                        <div>
                            <p>库存:${product.pnum}</p>
                        </div>
                        <div style="margin: 10px 0 10px 0;">
                            会员价: <strong style="color: #ef0101;">￥：${product.realprice}</strong>
                            市场价：
                            <del>￥:${product.originprice}</del>
                        </div>

                        <div style="margin: 10px 0 10px 0;">
                            促销: <a target="_blank" title="限时抢购 (2015-05-30 ~ 2015-06-01)"
                        >限时抢购</a>
                        </div>

                        <div
                                style="padding: 10px; border: 1px solid #e7dbb1; width: 330px; margin: 15px 0 10px 0;; background-color: #fffee6;">
                            <form action="api/cart/add" method="post">
                                <input name="pId" type="hidden" value="${product.id}"/>
                                <div style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
                                    购买数量:
                                    <a id="subCount" class="btn count-btn ">-</a>
                                    <input id="count" name="count" value="1"
                                           maxlength="4" size="10" type="text">
                                    <a id="addCount" class="btn count-btn">+</a>
                                </div>
                                <div style="margin: 20px 0 10px 0;; text-align: center;">
                                    <input class="btn btn-success btn-lg" value="加入购物车" type="submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div style="width: 950px; margin: 0 auto;">
                    <div style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
                        <strong>商品介绍</strong>
                    </div>
                    <div>
                        <strong>${product.pdesc}</strong>
                    </div>
                    <div id="productImgInfo">
                        <img src="${product.pimage}">
                    </div>
                    <div>
                        <div style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
                            <strong>联系卖家</strong>
                        </div>
                        <p>卖家联系方式:
                            <b>
                                <tel>${requestScope.tel}</tel>
                            </b>
                        </p>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty requestScope.product}">
                <p>没有该商品！</p>
            </c:if>
        </div>
    </div>
    <%@ include file="foot.jsp" %>
</div>
</body>
<script>
    $("#addCount").click(function () {
        var countEle = document.getElementById("count");
        var countValue = countEle.value;
        if (countValue >= 99) {
            countEle.value = 99;
        } else {
            countEle.value = parseInt(countValue) + 1;
        }
    });
    $("#subCount").click(function () {
        var countEle = document.getElementById("count");
        var countValue = countEle.value;
        if (countValue <= 1) {
            countEle.value = 1;
        } else {
            countEle.value = parseInt(countValue) - 1;
        }

    });
</script>
</html>