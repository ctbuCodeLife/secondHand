<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/4/22
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询管理员</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert2.min.css">
</head>
<body>
<!--管理员导航-->
<div id="adminNav">
    <span>用户管理</span>
    <i class="fa fa-chevron-right" aria-hidden="true"></i>
    <span>查询用户</span>
</div>
<div class="container-fuild">
    <div class="search">
        <form action="" method="post" class="form-inline">
            <div class="search ">
                <div class="input-group">
                    <input id="name" name="name" type="text" class="form-control" placeholder="按照用户名字查询">
                    <span class="input-group-btn">
        			<button id="search" class="btn btn-primary" type="button" onclick="getUserByName()">查询</button>
     			</span>
                </div>
            </div>
        </form>
    </div>
    <div class="table-responsive">
        <table id="queryUserTable" class="active table table-hover table-striped " style="display: none" >
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>真实姓名</th>
                <th>操作</th>
            </tr>
            <tr>
                <td id="showName"></td>
                <td id="showPassword"></td>
                <td id="showPhone"></td>
                <td id="showEmail"></td>
                <td id="showRealName"></td>
                <td>
                    <span id="deleteId" style="display: none"></span>
                    <a class="btn btn-danger" onclick="delUser(this)">删除</a>
                    <a id="updateBtn" class="btn btn-default" >更新</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vue.js"></script>
<!--引入插件的js-->
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>

<!--自定义的管理user的js-->
<script src="<%=request.getContextPath()%>/js/user.js"></script>
<script>
</script>
</body>
</html>