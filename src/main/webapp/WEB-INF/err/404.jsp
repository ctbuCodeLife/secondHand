<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/26 0026
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">

    <title>ishop后台管理</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">

</head>
<body>
<%@include file="../head.jsp"%>
<div class="container">
    <div class="row text-center" style="font-size: 30px; margin: 12%;">
        <p>抱歉,您访问的页面失联了</p>
        <p>您可以返回<a href="<%=request.getContextPath()%>/index.jsp">首页</a></p>
    </div>
</div>


</body>
</html>
