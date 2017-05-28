<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/4/23
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addProduct</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
    <style type="text/css">
        .container{
            width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>商品添加</h2>
    <form action="#" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="productName" class="col-sm-3 control-label">商品名</label>
            <div class="col-sm-9">
                <input id="productName" type="text" name="productName" class="form-control"  placeholder="商品名">
            </div>
        </div>
        <div class="form-group">
            <label for="productSubTitle" class="col-sm-3 control-label">商品子标题</label>
            <div class="col-sm-9">
                <input id="productSubTitle" type="text" name="productSubTitle" class="form-control"  placeholder="商品子标题">
            </div>
        </div>
        <div class="form-group">
            <label for="typeName" class="col-sm-3 control-label">类别名</label>
            <div class="col-sm-9">
                <input id="typeName" name="typeName" type="text"  class="form-control"  placeholder="类别名">
            </div>
        </div>
        <div class="form-group">
            <label for="imageSrc" class="col-sm-3 control-label">图片地址</label>
            <div class="col-sm-9">
                <img v-bind:src="product.imageSrc" v-bind:alt="product.name" width="70" height="100">
                <input id="imageSrc" name="imageSrc" type="text"  class="form-control"  placeholder="图片地址">
            </div>
        </div>
        <div class="form-group">
            <label for="inventNum" class="col-sm-3 control-label">库存</label>
            <div class="col-sm-9">
                <input id="inventNum" name="inventNum" type="email" class="form-control"  placeholder="库存">
            </div>
        </div>
        <div class="form-group">
            <label for="monthSaleNum" class="col-sm-3 control-label">月销量</label>
            <div class="col-sm-9">
                <input id="monthSaleNum" name="monthSaleNum" type="tel" class="form-control"  placeholder="月销量">
            </div>
        </div>
        <div class="form-group">
            <label for="orderLink" class="col-sm-3 control-label">订购连接</label>
            <div class="col-sm-9">
                <input id="orderLink" name="orderLink" type="tel" class="form-control"  placeholder="订购连接">
            </div>
        </div>
        <div class="form-group">
            <label for="realPrice" class="col-sm-3 control-label">原价</label>
            <div class="col-sm-9">
                <input id="realPrice" name="realPrice" type="tel" class="form-control"  placeholder="原价">
            </div>
        </div>
        <div class="form-group">
            <label for="salePrice" class="col-sm-3 control-label">售价</label>
            <div class="col-sm-9">
                <input id="salePrice" name="salePrice" type="tel" class="form-control"  placeholder="售价">
            </div>
        </div>
        <div class="form-group">
            <label for="isRecommend" class="col-sm-3 control-label">是否推荐</label>
            <div class="col-sm-9">
                <select name="isRecommend" id="isRecommend" class="form-control">
                    <option value="1">推荐</option>
                    <option value="0">不推荐</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="button" onclick="addProdcut()" class="btn btn-default">添加</button>
            </div>
        </div>
    </form>
</div>
<script src="../js/jquery.min.js"></script>
<%--<script src="../js/vue.js"></script>--%>
<!--引入弹出框插件的js-->
<script src="../js/sweetalert2.min.js"></script>
<!--自定义的管理product的js-->
<script src="../js/product.js"></script>
<script>
    $(document).ready(function () {
       swal(
           'test',
           'test msaged',
           'success'
       );
    });
</script>
</body>
</html>
