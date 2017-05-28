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
    <title>查询类别</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
</head>
<body>
<!--类别导航-->
<div id="typeNav">
    <span>类别管理</span>
    <i class="fa fa-chevron-right" aria-hidden="true"></i>
    <span>查询类别</span>
</div>
<div class="container-fuild">
    <div class="search">
        <form action="" method="post" class="form-inline">
            <div class="search ">
                <div class="input-group">
                    <input id="name" name="name" type="text" class="form-control" placeholder="按照类别名字查询">
                    <span class="input-group-btn">
        			<button id="search" class="btn btn-primary" type="button" onclick="getType()">查询</button>
     			</span>
                </div>
            </div>
        </form>
    </div>
    <div class="table-responsive">
        <table id="queryTypeTable" class="active table table-hover table-striped " style="display: none" >
            <tr>
                <th>类别名</th>
                <th>级别</th>
                <th>父类别名</th>
                <th>描述</th>
                <th>操作</th>
            </tr>
            <tr>
                <td id="showName"></td>
                <td id="showGrade"></td>
                <td id="showParent"></td>
                <td id="showDescribe"></td>
                <td>
                    <span id="deleteId" style="display: none"></span>
                    <a class="btn btn-danger" onclick="delType(this)">删除</a>
                    <a id="updateBtn" class="btn btn-default" >更新</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/vue.js"></script>
<!--引入弹出框插件的js-->
<script src="../js/sweetalert2.min.js"></script>
<!--引入自定义的type.js-->
<script src="../js/type.js"></script>
<script>
</script>
</body>
</html>