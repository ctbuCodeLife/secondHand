<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/22 0022
  Time: 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>所有管理员</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">


</head>
<body>
<!--管理员导航-->
<div id="adminNav">
    <span>管理员管理</span>
    <i class="fa fa-chevron-right" aria-hidden="true"></i>
    <span>所有管理员</span>
</div>
<div id="data">
    <div class="table-responsive">
        <table id="adminTable" class="active table table-hover table-striped">
            <tr>
                <th>序号</th>
                <th>权限等级</th>
                <th>用户名</th>
                <th>密码</th>
                <th>真实名字</th>
                <th>邮箱</th>
                <th>电话</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            <tr v-for="admin in mydata">
                <td>{{mydata.indexOf(admin)+1}} <span style="display: none">{{admin.id}}</span></td>
                <td>{{admin.roleId}}</td>
                <td>{{admin.name}}</td>
                <td>{{admin.password}}</td>
                <td>{{admin.realName}}</td>
                <td>{{admin.email}}</td>
                <td>{{admin.phone}}</td>
                <td>{{admin.updated}}</td>
                <td>
                    <span id="deleteId" style="display: none">{{admin.id}}</span>
                    <a class="btn btn-danger" onclick="delAdmin(this)">删除</a>
                    <a class="btn btn-default" v-bind:href="'updateAdmin.jsp?id='+admin.id">更新</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/vue.js"></script>
<!--引入插件的js-->
<script src="../js/sweetalert2.min.js"></script>

<!--自定义的管理admin的js-->
<script src="../js/admin.js"></script>

<script>
    $(document).ready(function () {
        listAdmin();
    });
</script>

</body>
</html>
