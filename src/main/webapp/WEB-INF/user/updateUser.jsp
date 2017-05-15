<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/4/22
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>修改管理员</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
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
    <h2>用户修改</h2>
    <form action="#" method="post" class="form-horizontal">
        <div class="form-group" hidden>
            <label for="id" class="col-sm-3 control-label">用户id</label>
            <div class="col-sm-9">
                <input id="id" type="hidden" name="id" class="form-control"  >
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">用户名</label>
            <div class="col-sm-9">
                <input id="name" type="text" name="name" class="form-control"  placeholder="管理员名" disabled>
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
                <button type="button" onclick="updateUser()" class="btn btn-default">更新</button>
            </div>
        </div>
    </form>
</div>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vue.js"></script>
<!--引入插件的js-->
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>

<!--自定义的管理admin的js-->
<script src="<%=request.getContextPath()%>/js/user.js"></script>
<script>
    $(document).ready(function(){
        var id = location.search.split("=")[1];
        var idElemnt = document.getElementById("id");
        var name = document.getElementById("name");
        var password = document.getElementById("password");
        var realName = document.getElementById("realName");
        var email =  document.getElementById("email");
        var phone = document.getElementById("phone");
        $.ajax({
                type:"GET",
                url:"/ishop-admin/getUserById",
                data:{id:id},
                dataType:"json",
                success:function (data) {
                    //这里获取到数据展示到前台
                    idElemnt.value = data.id;
                    name.value = data.name;
                    password.value = data.password;
                    realName.value = data.realName;
                    email.value = data.email;
                    phone.value = data.phone
                }
            }
        );
    })
</script>
</body>
</html>
