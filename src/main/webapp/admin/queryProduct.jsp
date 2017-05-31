<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/4/23
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品查询</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="css/sweetalert2.min.css">
</head>
<body>
<!--类别导航-->
<div id="typeNav">
    <span>商品管理</span>
    <i class="fa fa-chevron-right" aria-hidden="true"></i>
    <span>查询商品</span>
</div>
<div class="container-fuild">
    <div class="search">
        <form action="" method="post" class="form-inline">
            <div class="search ">
                <div class="input-group">
                    <input id="name" name="name" type="text" class="form-control" placeholder="按照商品名字查询">
                    <span class="input-group-btn">
        			<button id="search" class="btn btn-primary" type="button" onclick="getProductByName()">查询</button>
     			</span>
                </div>
            </div>
        </form>
    </div>
    <div class="table-responsive">
        <%--<table id="queryProductTable" class="active table table-hover table-striped"  >--%>
            <%--<tr>--%>
                <%--<th>商品名</th>--%>
                <%--<th>商品类型Id</th>--%>
                <%--<th>商品缩略图</th>--%>
                <%--<th>价格</th>--%>
                <%--<th>库存量</th>--%>
                <%--<th>月销量</th>--%>
                <%--<th>操作</th>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td id="showName"></td>--%>
                <%--<td id="showTypeId"></td>--%>
                <%--<td id="showImgSrc"><img src="" alt=""></td>--%>
                <%--<td id="showPrice"></td>--%>
                <%--<td id="showInventNum"></td>--%>
                <%--<td id="showSaleNum"></td>--%>
                <%--<td>--%>
                    <%--<span id="deleteId" style="display: none"></span>--%>
                    <%--<button class="btn btn-danger" onclick="delProduct(this)">删除</button>--%>
                    <%--<a  v-bind:href="'updateProduct.jsp?id='+product.id"><button class="btn btn-default">更新</button></a>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
            <table id="queryProductTable" class="active table table-hover table-striped">
                <tr>
                    <th>序号</th>
                    <th>商品编号</th>
                    <th>商品名</th>
                    <th>商品类型</th>
                    <th>商品缩略图</th>
                    <th>原价</th>
                    <th>售价</th>
                    <th>库存量</th>
                    <th>状态</th>
                </tr>
                <tr v-for="product in mydata">
                    <td>{{mydata.indexOf(product)+1}}</td>
                    <td>{{product.id}}</td>
                    <td>{{product.pname}}</td>
                    <td>{{product.kid}}</td>
                    <td><img v-bind:src="product.pimage" v-bind:alt="product.pname" width="70" height="100"></td>
                    <td>{{product.originprice}}</td>
                    <td>{{product.realprice}}</td>
                    <td>{{product.pnum}}</td>
                    <td v-if="product.status == 0">未审核</td>
                    <td v-if="product.status == 1">上架</td>
                    <td v-if="product.status == 2">下架</td>
                </tr>
            </table>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/vue.js"></script>
<!--引入弹出框插件的js-->
<script src="js/sweetalert2.min.js"></script>
<!--引入自定义的type.js-->
<script src="js/product.js"></script>
<script>
    $("#queryProductTable").hide();
</script>
</body>
</html>