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
<link rel="stylesheet" href="css/bootstrap.min.css"  />
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	type="text/css" />
<!--引入jquery的js文件-->
<script  src="js/jquery-1.12.4.min.js"></script>
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
				
				<%!	ArrayList<Product> listShowProduct;
				%>
				<% 
			  ProductDAO pd = new ProductDAOImpl();
			  listShowProduct = pd.findAll();
			  session.setAttribute("listShowProduct", listShowProduct);
			   %>
	<!--创建整体布局DIV-->
	<div class="container">

		<div class="row" style="width:1210px;margin:0 auto;">
            <c:forEach var="product" items="${sessionScope.listShowProduct}">
				<div class="col-md-2">
					<a href="product_info.jsp?id=${product.id}">
						<img src="${product.pImage}" alt="${product.pName}"	width="170" height="170" style="display: inline-block;">
					</a>
					<p>
						<a href="product_info.jsp?id=${product.id}" style='color:green'>${product.pName}</a>
					</p>
					<p>
						<font color="#FF0000">商城价：&yen;${product.iPrice}</font>
					</p>
				</div>
			</c:forEach>
		</div>

		<!--分页 -->
		<%--<div style="width:380px;margin:0 auto;margin-top:50px;">--%>
			<%--<ul class="pagination" style="text-align:center; margin-top:10px;">--%>
				<%--<li class="disabled"><a href="#" aria-label="Previous"><span--%>
						<%--aria-hidden="true">&laquo;</span></a></li>--%>
				<%--<li class="active"><a href="#">1</a></li>--%>
				<%--<li><a href="#">2</a></li>--%>
				<%--<li><a href="#">3</a></li>--%>
				<%--<li><a href="#">4</a></li>--%>
				<%--<li><a href="#">5</a></li>--%>
				<%--<li><a href="#">6</a></li>--%>
				<%--<li><a href="#">7</a></li>--%>
				<%--<li><a href="#">8</a></li>--%>
				<%--<li><a href="#">9</a></li>--%>
				<%--<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>--%>
				<%--</a></li>--%>
			<%--</ul>--%>
		<%--</div>--%>
		<!-- 分页结束=======================        -->

		<!--
       		商品浏览记录:
        -->
		<%--<div--%>
			<%--style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 246px;">--%>

			<%--<h4 style="width: 50%;float: left;font: 14px/30px 微软雅黑">浏览记录</h4>--%>
			<%--<div style="width: 50%;float: right;text-align: right;">--%>
				<%--<a href="">more</a>--%>
			<%--</div>--%>
			<%--<div style="clear: both;"></div>--%>

			<%--<div style="overflow: hidden;">--%>

				<%--<ul style="list-style: none;">--%>
					<%--<li--%>
						<%--style="width: 150px;height: 216;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;"><img--%>
						<%--src="img/show/ipad.jpg" width="130px" height="130px" /></li>--%>
				<%--</ul>--%>

			<%--</div>--%>
		<%--</div>--%>
	</div>
</body>

</html>