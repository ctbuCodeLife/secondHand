<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/5/30
  Time: 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sh.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sh.dao.*" %>
<%@ page import="com.sh.dao.impl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>个人信息</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="css/head.css">
    <!--引入jquery的js文件-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css"/>

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }
        font {
            color: #0e0e0e;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
    </style>
</head>

<body>
<!--创建整体布局DIV-->
<div class="container">
    <%@ include file="head.jsp" %>
    <div class="main">
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            <font>个人信息</font>PERSONAL INFOMATION
            <form id="selfInfo" name="selfInfo"action="#" method="post" class="form-horizontal" style="margin-top: 5px;">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名:</label>
                    <div class="col-sm-6">
                        <strong id="username">myq</strong>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">性别:</label>
                    <div class="col-sm-6">
                        <strong id="sex">男</strong>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码:</label>
                    <div class="col-sm-6">
                        <strong id="password">123456</strong>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱：</label>
                    <div class="col-sm-6">
                        <strong id="email">84210278@qq.com</strong>
                    </div>
                </div>
                <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">手机：</label>
                <div class="col-sm-6">
                    <strong id="tel">15523031521</strong>
                </div>
            </div>
                <div class="form-group">
                    <label for="addr" class="col-sm-2 control-label">收货地址：</label>
                    <div class="col-sm-6">
                        <strong id="addr">重庆工商大学</strong>
                    </div>
                </div>
                <div id="button-group" class="form-group">
                    <div class="col-sm-offset-2">
                        <input type="reset" width="100" value="修改" name="submit"
                           style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="foot.jsp" %>
</div>
</body>
<script>

</script>
</html>
