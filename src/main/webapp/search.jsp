<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>搜索页面</title>
    <!--根据设备的宽度调整缩放比例   -->
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <!--引入bootstrap的CSS文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css" />
    <!--引入jquery的js文件-->
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
    <style type="text/css">
        .center-block{
            width: 170px;
        }
    </style>
</head>

<body>
<%@include file="head.jsp" %>
<!--创建查询DIV-->
<div class="container">
    <div class="row" style="width:1210px;">
        <div  id="allsearch" class="center-block" style="display: none">
            <div class="searchProductList">
                <p id="pId" style="display: none">{{id}}</p>
                <img id="img" src="" alt="" width="170" height="170" style="display: inline-block;">
                <p>
                    <a  href="JavaScript:;" onclick="location ='product_info.jsp?id='+document.getElementById('pId').innerHTML;">{{pname}}</a>
                </p>
                <p>
                    <font color="#FF0000">商城价：&yen;{{realprice}}</font>
                </p>
            </div>
        </div>
    </div>
</div>
<!--创建footDIV-->
<div class="">
    <center>
        <img src="img/foot.png" align="center"/>
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
<script type="text/javascript">

    window.onload = function () {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if(url.indexOf("?") != -1)
        {
            var str = url.substr(1);
            var strs = str.split("&");
            for(var i = 0; i < strs.length; i ++)
            {
                theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
            }
        }
        var name = theRequest.name;
        $.ajax({
            type:"GET",
            url:"/secondHand/searchByName",
            data:{name:name},
            dataType:"json",
            success:function (data) {
                if(data!=""&&!jQuery.isEmptyObject(data)){
                    //找到了商品
                    var vm = new Vue({
                        el:"#allsearch",
                        data:data
                    });
                    $("#img").attr("src", data.pimage);
                    $("#allsearch").css("display","block");
                }else{
                    $("#allsearch").css("display","none");
                    alert("没有该商品");
                }
            },
            error:function () {
                alert("ajax返回出错");
            }
        });

    }
</script>
</body>
</html>