<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>搜索页面</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css" />
    <link rel="stylesheet" href="css/head.css">
    <!--引入jquery的js文件-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
    <style type="text/css">
        .center-block{
              width: 170px;
          }
    </style>
</head>

<body>
<%@include file="head.jsp" %>
<!--创建查询DIV-->
<div class="container">
    <div class="row" style="width:1210px;">
            <%!List<Product> searchList ;%>
            <%
                String name = request.getParameter("name");
                ProductDAO productDao = new ProductDAOImpl();
                searchList = productDao.getProductByLikeName(name);
                session.setAttribute("searchList",searchList);
            %>
            <c:forEach var="product" items="${sessionScope.searchList}">
                <div class="col-sm-2">
                    <a href="product_info.jsp?id=${product.id}">
                        <img src="${product.pimage}" alt="${product.pname}"	width="170" height="170" style="display: inline-block;">
                    </a>
                    <p>
                        <a href="product_info.jsp?id=${product.id}" style='color:green'>${product.pname}</a>
                    </p>
                    <p>
                        <font color="#FF0000">商城价：&yen;${product.realprice}</font>
                    </p>
                </div>
            </c:forEach>
    </div>
</div>
<!--创建footDIV-->

<%@include file="foot.jsp"%>

</body>
</html>