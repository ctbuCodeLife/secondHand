<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2017/4/26 0026
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--top menu-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">欢迎使用secondhand后台系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">主页</a>
                </li>
                <li>
                    <a href="#">个人信息</a>
                </li>
                <li>
                    <a href="#">帮助</a>
                </li>
                <li>
                    <a href="#" onclick="logout()">注销</a>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
    <script>
        function logout() {
            $.ajax({
                type: "GET",
                url: "../api/admin/logout",
                dataType: "json",
                success: function (response) {
                    if (response.status === 0) {
                        //注销失败
                        swal({
                            title: '提示',
                            text: response.data,
                            timer: 3000
                        }).then(
                            function autoReturn() {
                                location.href = response.autoReturn
                            }
                            // handling the promise rejection
//                        function (dismiss) {
//                            setTimeout(autoReturn)
//                            if (dismiss === 'timer') {
//                                console.log('I was closed by the timer')
//                            }
//                        }
                        )
                    }else{
                        location.href = response.autoReturn;
                    }
                }
            })
        }
    </script>
</nav>

