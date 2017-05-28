<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>在线注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/sweetalert2.min.css">
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/my.js"></script>
    <script src="js/sweetalert2.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }

        #button-group {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
        }

        #button-group div:nth-child(1) {
            margin-left: 120px;
        }

        #button-group div:nth-child(2) {
            margin-left: 40px;
        }
    </style>
</head>

<body>
<div class="container">
    <%@ include file="head.jsp" %>

    <div class="container"
         style="width: 100%; background: url('image/regist_bg.jpg');">
        <div class="row">

            <div class="col-md-2"></div>

            <div class="col-md-8"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
                <font>会员注册</font>USER REGISTER
                <form name="registerform" id="registerform" action="#"
                      method="post" class="form-horizontal" style="margin-top: 5px;">

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input id="username" name="username" type="text" class="form-control"
                                   placeholder="请输入用户名" onblur="checkName()"
                            >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input id="password" name="password" type="password" class="form-control"
                                   placeholder="请输入密码">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-6">
                            <input id="confirmpwd" type="password" class="form-control"
                                   name="rapwd" placeholder="请输入确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input id="email" name="email" type="email" class="form-control"
                                   placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-6">
                            <input id="tel" name="tel" type="tel" class="form-control"
                                   placeholder="手机">
                        </div>
                    </div>
                    <div id="button-group" class="form-group">
                        <div class="col-sm-offset-2">
                            <button type="button" onclick="register()" style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">注册</button>
                        </div>
                        <div class="col-sm-offset-2">
                            <input type="reset" width="100" value="重置" name="submit"
                                   style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-md-2"></div>

        </div>
    </div>
    <%@ include file="foot.jsp" %>
</div>
</body>
<script>
    function checkName() {
        var usernameEle = document.getElementById("username");
        var usernameVal = usernameEle.value;
        if (usernameVal === "" || usernameVal === undefined) {
            usernameEle.focus();
        } else {
            $.ajax({
                type: "POST",
                url: "api/user/getUserByName",
                data: {name: usernameVal},
                dataType: "json",
                success: function (response) {
                    if(response.status === 1){
                        swal(response.data).then(function () {
                                $("#username").focus()
                        });
                    }
                }
            })
        }
    }
    function register() {
        //输入非空验证
        var userEle = ["#username", "#password", "#confirmpwd","#email", "#tel"];
        for (var i = 0; i < userEle.length; i++) {
            if ($(userEle[i]).val() === "") {
                $(userEle[i]).focus();
                return;
            }
        }
        //密码验证
        var pwdVal = $("#password").val();
        var confirmPwdVal = $("#confirmpwd").val();
        if(pwdVal !== confirmPwdVal){
            swal("两次输入的密码不一致，请重新输入！").then(function () {
                $("#password").focus();
            })
        }
        //手机验证


        //获取参数
        var nameVal = $("#username").val();
        var emailVal = $("#email").val();
        var sexVal = $("#sex").val();
        var telVal = $("#tel").val();
        //发送ajax注册
        $.ajax({
            type: "POST",
            url: "api/user/register",
            data: {
                username: nameVal,
                password:pwdVal,
                email:emailVal,
                tel:telVal,
            },
            dataType: "json",
            success: function (response) {
                if(response.status === 1){
                    swal(response.data).then(function () {
                        $("#username").focus()
                    });
                }
            }
        })
    }
</script>
</html>