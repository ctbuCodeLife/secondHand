<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用户登录</title>
<!--根据设备的宽度调整缩放比例   -->
<meta name="viewport" content="width=device-width,initial-scale=1" />
<!--引入bootstrap的CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	type="text/css" />

<!--引入jquery的js文件-->
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

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
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}
#button-group{
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}
#button-group div:nth-child(1){
	margin-left: 70px;
}
#button-group div:nth-child(2){
	margin-left: 30px;
}
</style>
</head>

<body>
	<div class="container">
		<!-- 头部DIV -->
		<%@include file="head.jsp"%>
		<div class="container"
			style="width:100%;height:460px;background:#FF2C4C url('images/loginbg.jpg') no-repeat;">
			<div class="row">
				<div class="col-md-6"></div>

				<div class="col-md-6">
					<div
						style="width:460px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:60px;background:#fff;">
						<font>会员登录</font>USER LOGIN

						<div>&nbsp;</div>
						<form method="post" action="api/user/login" class="form-horizontal">

							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-6">
									<input id="username" name="username" type="text" class="form-control"
										placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-6">
									<input id="inputPassword" name="password"type="password" class="form-control"
										placeholder="请输入密码">
								</div>
							</div>
							<div id="button-group" class="form-group">
								<div class="col-sm-offset-2">
									<input type="submit" width="100" value="登录" name="submit"
									
										style="background: url('images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
			    height:35px;width:100px;color:white;">
								</div>
								<div class="col-sm-offset-2">
									<input type="reset" width="100" value="重置" name="submit"
										
										style="background: url('images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="foot.jsp"%>
	</div>
</body>

</html>