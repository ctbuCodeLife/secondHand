<%@ page language="java"
	import="java.util.*,com.sh.dao.*,com.sh.model.*,java.sql.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sh.model.Product" %>
<%@ page import="com.sh.dao.ProductDAO" %>
<%@ page import="com.sh.dao.impl.ProductDAOImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>商品信息</title>
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

.product{
	margin-left: 20px;
}
.product :hover{
	border: 1px red solid;
}
.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>
				
				<%!	List<Product> listShowProduct;
				%>
				<% 
			  ProductDAO pd = new ProductDAOImpl();
			  listShowProduct = pd.listByStatus(1);
			  session.setAttribute("listShowProduct", listShowProduct);
			   %>
	<!--创建整体布局DIV-->
	<div class="container">

		<div class="row" style="width:1186px;margin:0 auto;">
            <c:forEach var="product" items="${sessionScope.listShowProduct}">
				<div class="col-md-2"  width="160">
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
</body>

</html>