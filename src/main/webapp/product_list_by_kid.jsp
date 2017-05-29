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
<meta charset="utf-8" />
<title>商品信息</title>
<!--根据设备的宽度调整缩放比例   -->
<meta name="viewport" content="width=device-width,initial-scale=1" />
<!--引入bootstrap的CSS文件 -->
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/leftMenu.css">
<link rel="stylesheet" href="css/bootstrap.min.css"  />
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	type="text/css" />
<!--引入jquery的js文件-->
<script  src="js/jquery-1.12.4.min.js"></script>
<script  src="js/bootstrap.min.js"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css"  />
</head>
<body>
<%!	List<Product> listProductByKid;
%>
<% 
  String param = request.getParameter("kid");
  if(param != null){
      int kid = Integer.parseInt(param);
      ProductDAO pd = new ProductDAOImpl();
      listProductByKid = pd.listByKid(kid);
      session.setAttribute("listProductByKid", listProductByKid);
  }
%>
<%@ include file="head.jsp"%>
<!--左侧菜单-->
<div class="left-menu">
	<ul>
		<li><a href="index.jsp" >首页</a></li>
		<c:forEach var="kind" items="${sessionScope.listKind}">
			<li><a href="product_list_by_kid.jsp?kid=${kind.id}" >${kind.kname}</a></li>
		</c:forEach>
		<li><a href="#miao">回到顶部</a></li>
	</ul>
</div>
<!---左侧菜单结束->
<!--创建整体布局DIV-->
	<div class="container">
		<div class="row" style="width:1210px;margin:0 auto;">
            <c:forEach var="product" items="${sessionScope.listProductByKid}">
			<div class="col-md-2">
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

		<jsp:include page="foot.jsp"/>
	</div>
</body>
</html>