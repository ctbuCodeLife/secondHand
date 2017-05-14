<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>订单信息</title>
		<!--根据设备的宽度调整缩放比例   -->
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<!--引入bootstrap的CSS文件 -->
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css" />
		<!--引入jquery的js文件-->
		<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>

	<body>
	<%@include file="head.jsp" %>
		<!--创建订单详情DIV-->
		<div class="container">
			<div class="row">

				<div style="margin:0 auto;margin-top:10px;width:1150px;">
					<strong>订单详情</strong>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
                            <tr class="active">
                                <td width="40%">
                                    <input type="hidden" name="id" value="22">
                                    <img src="${sessionScope.product.pimage}" alt="${sessionScope.product.pname}" width="70"
                                         height="60"></td>
                                <td width="20%"><a target="_blank" style="line-height: 50px"> ${sessionScope.product.pname}</a></td>
                                <td width="10%" style="line-height: 50px">￥${sessionScope.product.realprice}</td>
                                <td width="10%" style="line-height: 50px">${sessionScope.cart.count}</td>
                                <td width="10%"><span class="subtotal" style="line-height: 50px">￥${sessionScope.cart.totalprice}元</span></td>
                            </tr>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<hr />
				<form class="form-horizontal"
					style="margin-top:5px;margin-left:150px;">
					<div class="form-group">
						<label for="addr" class="col-sm-1 control-label">地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="addr"
								placeholder="请输入收货地址">
						</div>
					</div>
					<div class="form-group">
						<label for="people" class="col-sm-1 control-label">收货人</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="people"
								placeholder="请输收货人">
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="col-sm-1 control-label">电话</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="tel"
								placeholder="请输入联系方式" value="">
						</div>
					</div>
				</form>

				<hr />
				<div style="margin-top:5px;margin-left:150px;">
					<hr />
					<p style="text-align:right;margin-right:100px;">
                        <a id="link" class="btn btn-danger btn-height-auto-center " onclick="link()" href="AddSales?pid=${sessionScope.product.id}&count=${sessionScope.cart.count}
                     ">确认支付</a>
						<script type="text/javascript">
							function  link() {
                                var url = location.search; //获取url中"?"符后的字串
                                var cid = url.split("=")[1];
                                var herf = $("#link").attr("href");
                                var tel= $("#tel").val();
                                var addr= $("#addr").val();
                                var people= $("#people").val();
                                $("#link").attr("href",herf+"&tel="+tel+"&addr="+addr+"&people="+people+"&cid="+cid);
                            }
						</script>
					</p>
					<hr />
				</div>
			</div>
		</div>
		<!--创建footDIV-->
		<div class="">
			<center>
				<img src="img/foot.png" align="center"/>
			</center>
		</div>
		<!--创建linkDIV-->
		<div class="">
			<center>
				
			</center>
		</div>
		<!--创建版权DIV-->
		<div class="">
			<center>
				<a href="" target="_blank">关于商城</a>|
				 <a href="" target="_blank">帮助中心</a>|
				 <a href="" target="_blank">联系我们</a>|
				 <a href="" target="_blank">发展历程</a>|
				 <a href="" target="_blank">媒体报道</a>
				 <br/>
				 <span>&copy;2016  版权所有. 京ICP备XXXXXXXX号-XXX京ICP证XXXXXX号</span>
			</center>
		</div>
	</body>

</html>