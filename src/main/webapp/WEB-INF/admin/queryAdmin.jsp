<%--
 Created by IntelliJ IDEA.
 User: tao
 Date: 2017/4/22 0022
 Time: 17:01
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
    <span>管理员管理</span>
    <i class="fa fa-chevron-right" aria-hidden="true"></i>
    <span>查询管理员</span>
</div>
<div class="container-fuild">
    <div class="search">
        <form action="" method="post" class="form-inline">
            <div class="search ">
                <div class="input-group">
                    <input id="name" name="name" type="text" class="form-control" placeholder="按照管理员名字查询">
                    <span class="input-group-btn">
        			<button id="search" class="btn btn-primary" type="button" onclick="getAdmin()">查询</button>
     			</span>
                </div>
            </div>
        </form>
    </div>
    <div class="table-responsive">
        <table id="queryAdminTable" class="active table table-hover table-striped " style="display: none" >
            <tr>
                <th>管理员名</th>
                <th>权限等级</th>
                <th>密码</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>真实姓名</th>
                <th>操作</th>
            </tr>
            <tr>
                <td id="showName"></td>
                <td id="showroleId"></td>
                <td id="showPassword"></td>
                <td id="showPhone"></td>
                <td id="showEmail"></td>
                <td id="showRealName"></td>
                <%--<td id="showName">{{admin.name}}</td>--%>
                <%--<td id="showroleId">{{admin.roleId}}</td>--%>
                <%--<td id="showPassword">{{admin.password}}</td>--%>
                <%--<td id="showPhone">{{admin.phone}}</td>--%>
                <%--<td id="showEmail">{{admin.email}}</td>--%>
                <%--<td id="showRealName">{{admin.realName}}</td>--%>
                <td>
                    <span id="deleteId" style="display: none"></span>
                    <a class="btn btn-danger" onclick="delAdmin(this)">删除</a>
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

<!--自定义的管理admin的js-->
<script src="<%=request.getContextPath()%>/js/admin.js"></script>
<script>
    //    //回车键搜索
    //   window.onkeydown = function (event) {
    //       //按下回车键
    //       if(event.keyCode === 13){
    //           document.getElementById("search").onclick();
    //       }
    //   }
</script>
</body>
</html>
