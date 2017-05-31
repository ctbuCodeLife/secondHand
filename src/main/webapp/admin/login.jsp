<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/1 0001
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="css/sweetalert2.min.css">

</head>
<body>
<div id="app" >
    <form class="login-container" action="#" method="post">
        <h3 class="title">系统登录</h3>
        <div class="item">
            <label >
                <input id="name" name="name" class="input" type="text"  placeholder="管理员登录名">
            </label>
        </div>
        <div class="item">
            <label >
                <input id="password" name="password" class="input" type="password"  placeholder="密码">
            </label>
        </div>
        <div class="item">
            <label >
                <button class="input submit" onclick="adminLogin()">登录</button>
            </label>
        </div>

    </form>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/sweetalert2.min.js"></script>
<script>
    function adminLogin() {
        //输入非空验证
        var userEle = ["#name", "#password"];
        for (var i = 0; i < userEle.length; i++) {
            if ($(userEle[i]).val() === "") {
                $(userEle[i]).focus();
                return;
            }
        }
        //获取参数
        var nameVal = $("#name").val();
        var pwdVal = $("#password").val();
        //发送ajax进行注册
        $.ajax({
            type: "POST",
            url: "../api/admin/login",
            data: {
                name: nameVal,
                password: pwdVal,
            },
            dataType: "json",
            success: function (response) {
                if (response.status === 0) {
                    //登录失败
                    swal({
                        title: '提示',
                        text: response.data[0],
                        timer: 3000
                    }).then(
                        function autoReturn() {
                            location.href = response.autoReturn
                        },
                        // handling the promise rejection
                        function (dismiss) {
                            setTimeout(autoReturn)
                            if (dismiss === 'timer') {
                                console.log('I was closed by the timer')
                            }
                        }
                    )
                } else {
                    location.href = response.autoReturn;
                }
            }
        })
    }
</script>
</body>
</html>
