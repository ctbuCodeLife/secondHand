<%--
  Created by IntelliJ IDEA.
  User: myq
  Date: 2017/4/23
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addType</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <!--提示框插件样式-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert2.min.css">
    <style type="text/css">
        .container {
            width: 500px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>商品类别添加</h2>
    <form action="addType" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="grade" class="col-sm-3 control-label">类别级别</label>
            <div class="col-sm-9">
                <select name="grade" id="grade" onblur="selectGrade(this.value)" class="form-control">
                    <option value="1">一级</option>
                    <option value="2" selected>二级</option>
                    <option value="3">三级</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">类别名</label>
            <div class="col-sm-9">
                <input id="name" type="text" name="name" class="form-control" placeholder="类别名">
            </div>
        </div>
        <div class="form-group">
            <label for="parentId" class="col-sm-3 control-label">父级选择</label>
            <div class="col-sm-9">
                <select name="parentId" id="parentId" class="form-control">
                    <option id="typeGrade" value=""></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="describe" class="col-sm-3 control-label">类别描述</label>
            <div class="col-sm-9">
                <input id="describe" type="text" name="describe" class="form-control" placeholder="类别描述">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="button" onclick="addType()" class="btn btn-default">添加</button>
            </div>
        </div>
    </form>
</div>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vue.js"></script>
<!--引入弹出框插件的js-->
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>
<!--自定义的管理type的js-->
<script src="<%=request.getContextPath()%>/js/type.js"></script>

<script type="text/javascript">

    $(document).ready(function () {
        $("#grade").focus();
    });
</script>
</body>
</html>
