<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/22 0022
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="cn-hans">
<head>
    <title>添加管理员</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert2.min.css">
    <style type="text/css">
        .container{
            width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>管理员添加</h2>
    <form action="#" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="roleId" class="col-sm-3 control-label">权限等级</label>
            <div class="col-sm-9">
                <select name="roleId" id="roleId" class="form-control">
                    <option value="1">root</option>
                    <option value="2">admin</option>
                    <option value="3">backadmin</option>
                    <option value="4">frontadmin</option>
                    <option value="5">server</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">管理员名</label>
            <div class="col-sm-9">
                <input id="name" type="text" name="name" class="form-control"  placeholder="管理员名">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-9">
                <input id="password" name="password" type="password"  class="form-control"  placeholder="密码">
            </div>
        </div>
        <div class="form-group">
            <label for="realName" class="col-sm-3 control-label">真实名字</label>
            <div class="col-sm-9">
                <input id="realName" name="realName" type="text"  class="form-control"  placeholder="真实名字">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-3 control-label">邮箱</label>
            <div class="col-sm-9">
                <input id="email" name="email" type="email" class="form-control"  placeholder="邮箱">
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">电话</label>
            <div class="col-sm-9">
                <input id="phone" name="phone" type="tel" class="form-control"  placeholder="电话">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="button" onclick="addAdmin()" class="btn btn-default">添加</button>
            </div>
        </div>
    </form>
</div>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vue.js"></script>
<!--引入弹出框插件的js-->
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>
<!--自定义的管理admin的js-->
<script src="<%=request.getContextPath()%>/js/admin.js"></script>

</body>
</html>
