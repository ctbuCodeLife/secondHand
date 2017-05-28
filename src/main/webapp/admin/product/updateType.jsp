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
    <title>更新类别</title>
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
    <h2>商品类别修改</h2>
    <form action="#" method="post" class="form-horizontal">
        <div class="form-group">
            <input id="id" type="hidden" name="id" class="form-control"  >
            <label for="grade" class="col-sm-3 control-label">类别级别</label>
            <div class="col-sm-9">
                <select name="grade" id="grade" onblur="selectGrade(this.value)" class="form-control">
                    <option value="1" onclick="">一级</option>
                    <option value="2" onclick="">二级</option>
                    <option value="3" onclick="">三级</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">类别名</label>
            <div class="col-sm-9">
                <input id="name" type="text" name="name" class="form-control"  placeholder="类别名">
            </div>
        </div>
        <div class="form-group">
            <label for="parentId" class="col-sm-3 control-label">父级选择</label>
            <div class="col-sm-9">
                <select id="parentId" name="parentId"  class="form-control">
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="describe" class="col-sm-3 control-label">类别描述</label>
            <div class="col-sm-9">
                <input id="describe" type="text" name="describe" class="form-control"  placeholder="类别描述">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <button type="button" onclick="updateType()" class="btn btn-default">修改</button>
            </div>
        </div>
    </form>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/vue.js"></script>
<!--引入弹出框插件的js-->
<script src="../js/sweetalert2.min.js"></script>
<!--引入自定义的type.js-->
<script src="../js/type.js"></script>
<script>
        $(document).ready(function(){
            var idValue = location.search.split("=")[1];
            var idELe = document.getElementById("id");
            var grade = document.getElementById("grade");
            var name = document.getElementById("name");
            var parentId = document.getElementById("parentId");
            var typeGrade = document.getElementById("typeGrade");
            var describe = document.getElementById("describe");
            $.ajax({
                    type: "GET",
                    url: "/ishop-admin/getTypeById",
                    data: {id: idValue},
                    dataType: "json",
                    success: function (data) {
                        //这里获取到数据展示到前台
                        console.log(data);
                        idELe.value = data.id;
                        grade.value = data.grade;
                        name.value = data.name;
                        describe.value = data.describe;
                        //
//                        parentId.value = data.parentId;
                        $.ajax({
                            type: "GET",
                            url: "/ishop-admin/getTypeById",
                            data: {id: data.parentId},
                            dataType: "json",
                            success: function (parentData) {
                                console.log(parentData);
                                $("#parentId").append("<option  value=" + parentData.parentId + ">" + parentData.name + "</option>");
                            }
                        });


                    }
            });
            $("#grade").focus();
           // selectGrade(grade);
        });
</script>
</body>
</html>
