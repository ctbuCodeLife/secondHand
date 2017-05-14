<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/5/14
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>上传商品</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/my.js"></script>
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

        .container .row div {
            /* position:relative;
             float:left; */

        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
        #button-group{
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
        }
        #button-group div:nth-child(1){
            margin-left: 120px;
        }
        #button-group div:nth-child(2){
            margin-left: 40px;
        }
    </style>
</head>

<body>
<div class="container">
    <%@ include file="head.jsp"%>

    <div class="container"
         style="width: 100%; background: url('image/regist_bg.jpg');">
        <div class="row">

            <div class="col-md-2"></div>

            <div class="col-md-8"
                 style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
                <font>上传商品</font>
                <form name="registerform" id="registerform" action="api/product/add"
                      method="post" class="form-horizontal" style="margin-top: 5px;">
                    <div class="form-group">
                        <label for="pName" class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-6">
                            <input id="pName" name="pName" type="text" class="form-control"
                                   placeholder="请输入商品名"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="kindId" class="col-sm-2 control-label">商品种类</label>
                        <div class="col-sm-6">
                            <select id="kindId" name="kindId" class="form-control">
                                <option value="1">手机数码</option>
                                <option value="2">生活用品</option>
                                <option value="3"  selected>二手书</option>
                                <option value="4">服装</option>
                                <option value="5">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pDesc" class="col-sm-2 control-label">商品描述</label>
                        <div class="col-sm-6">
                            <textarea name="pDesc" id="pDesc" class="form-control" cols="37" rows="5" placeholder="请输入商品描述"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pNum" class="col-sm-2 control-label">商品数量</label>
                        <div class="col-sm-6">
                            <input id="pNum" name="pNum" type="number" class="form-control"  placeholder="请输入商品数量">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="originPrice" class="col-sm-2 control-label">商品原价</label>
                        <div class="col-sm-6">
                            <input name="originPrice" id="originPrice" type="number" class="form-control" id="inputMPrice"
                                   placeholder="价格">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="realPrice" class="col-sm-2 control-label">商品现价</label>
                        <div class="col-sm-6">
                            <input name="realPrice" id="realPrice" type="number" class="form-control" id="inputIPrice"
                                   placeholder="价格">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="uploadImg" class="col-sm-2 control-label">上传图片</label>
                        <div class="col-sm-6">
                            <input id="uploadImg" name="uploadImg" type="file" class="form-control"
                                   placeholder="价格">
                        </div>
                    </div>
                    <div id="button-group" class="form-group">
                        <div class="col-sm-offset-2">
                            <input type="submit" width="100" value="上传" name="submit"
                                   style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                        </div>
                        <div class="col-sm-offset-2">
                            <input type="reset" width="100" value="重置" name="submit"
                                   style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <%@ include file="foot.jsp"%>
</div>
</body>

</html>