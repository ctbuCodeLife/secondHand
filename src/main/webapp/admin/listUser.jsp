<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/22 0022
  Time: 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有用户</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
</head>
<body>
<div id="data">
    <table id="userTable" class="active table table-hover table-striped">
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>操作</th>
        </tr>
        <tr v-for="user in mydata">
            <td>{{mydata.indexOf(user)+1}}</td>
            <td>{{user.username}}</td>
            <td>{{user.password}}</td>
            <td>{{user.email}}</td>
            <td>{{user.tel}}</td>
            <td>
                <span id="deleteId" style="display: none">{{user.id}}</span>
                <a class="btn btn-danger" onclick="delUser(this)">删除</a>
                <a class="btn btn-default" v-bind:href="'updateUser.jsp?id='+user.id">更新</a>
            </td>
        </tr>
    </table>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/vue.js"></script>
<!--引入插件的js-->
<script src="js/sweetalert2.min.js"></script>
<script src="js/user.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        listUser();
    })
</script>

</body>
</html>
