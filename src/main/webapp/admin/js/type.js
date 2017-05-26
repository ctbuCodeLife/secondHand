/**
 * Created by myq on 2017/4/23.
 */
function selectGrade(grade) {
    if (grade == "1") {
        //类别等级为1时,父类别没有,禁用父类别
        $("#parentId > option").remove();
        $("#parentId").attr("disabled", "disable");
    } else {
        $("#parentId").attr("disabled", false);
        var mydata = [];
        $.ajax({
            type: "GET",
            url: "/ishop-admin/getTypeByGrade",
            data: {grade: grade},
            dataType: "json",
            success: function (data) {
                //这里获取到数据展示到前台
                if (data !== undefined) {
                    //console.log(data.length)
                    //清除之前的数据
                    $("#parentId > option").remove();
                    var length = data.length;
                    for (var i = 0; i < length; i++) {
                        console.log(data[i].id + " " + data[i].name);
                        $("#parentId").append("<option  value=" + data[i].parentId + ">" + data[i].name + "</option>");
                    }
                }
            }
        });
    }
}
//增加类别
function addType() {
    //输入非空验证
    var typeEle = ["#grade", "#name", "#parentId", "#describe"];
    for (var i = 0; i <typeEle.length; i++) {
        if ($(adminEle[i]).val() === "") {
            $(adminEle[i]).focus();
            return;
        }
    }
    var grade = $("#grade").val();
    var name = $("#name").val();
    var parentId = $("#parentId").val();
    var describe = $("#describe").val();

    //判断类别是否存在
    $.ajax({
        type: "GET",
        url: "/ishop-admin/existsTypeByName",
        data: {name: name},
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            if (data === false) {
                //说明类型名不存在可以添加,
                $.ajax({
                    type: "POST",
                    url: "/ishop-admin/addType",
                    data: {
                        grade:grade,
                        name:name,
                        parentId:parentId,
                        describe:describe
                    },
                    dataType: "json",
                    success: function (data) {
                        //这里获取到数据展示到前台
                        if(data === true){
                            swal(
                                '添加成功!',
                                '成功添加了一条信息!',
                                'success'
                            );
                            //2秒后自动跳转
                            function autoReturn() {
                                location = "listType.jsp";
                            }

                            setTimeout(autoReturn, 2000);
                        }else{
                            swal(
                                '添加失败!',
                                '了一条信息!',
                                'error'
                            ).then(function () {
                                location.reload()
                                }
                            );
                        }
                    }
                });

            } else {
                //说明类别名存在,不能添加.
                swal(
                    '添加失败',
                    '该类别名已存在,请重新输入!',
                    'warning'
                ).then(function () {
                    $("#name").focus();
                });
            }
        }
    });
}
//删除管理员
function delType(that) {
    swal({
        title: '删除类别?',
        text: "删除后就不可恢复!",
        type: 'error',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '确认删除',
        cancelButtonText: "取消"
    }).then(function (isConfirm) {
        if (isConfirm) {
            //执行删除操作
            var p = that.parentNode.firstElementChild;
            var id = p.innerHTML;
            $.ajax({
                type: "GET",
                url: "/ishop-admin/delType",
                data: {id: id},
                dataType: "json",
                success: function (data) {
                    //这里获取到数据判断删除是否成功
                    if(data === true) {
                        swal(
                            '删除成功!',
                            '成功删除一条信息',
                            'success'
                        ).then(function () {
                            location.href = "listType.jsp";
                        });
                    }
                }
            });

        }
    });
}
//更改商品类型
function  updateType() {
    var typeEle = ["#id", "#grade","#name", "#parentId", "#describe"];
    //输入框非空验证
    for (var i = 0; i <typeEle.length; i++) {
        if ($(typeEle[i]).val() === "") {
            $(typeEle[i]).focus();
            return;
        }
    }
    var id = $("#id").val();
    var grade = $("#grade").val();
    var name = $("#name").val();
    var parentId = $("#parentId").val();
    var describe = $("#describe").val();
    $.ajax({
        type: "GET",
        url: "/ishop-admin/updateType",
        data: {
            id:id,
            grade:grade,
            name:name,
            parentId:parentId,
            describe:describe
        },
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            if (data != false){
                //提示框
                swal(
                    '更新成功!',
                    '成功更新了一条类别信息!',
                    'success'
                ).then(function () {
                    location.href = "listType.jsp";
                });
            } else {
                //提示框
                swal(
                    '失败!',
                    '更新失败!',
                    'error'
                ).then(function () {
                    location.reload();
                });
            }
        }
    });

}
//查询所有商品类型
function  listType(grade) {
    $mydata=[];
    $.ajax({
        type:"GET",
        url:"/ishop-admin/listType",
        data:{
          grade:grade
        },
        dataType:"json",
        success:function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el:'#typeTable',
                data:{
                    mydata:data
                }
            });
        }
    })
}

//根据name查询商品类型
function getType() {
    //输入框的内容
    var nameValue = $("#name").val();

    var showName = document.getElementById("showName");
    var showGrade = document.getElementById("showGrade");
    var showParent = document.getElementById("showParent");
    var showDescribe = document.getElementById("showDescribe");

    var idEle = document.getElementById("deleteId");
    $.ajax({
        type: "GET",
        url: "/ishop-admin/getTypeByName",
        data: {name: nameValue},
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            if (data.id === undefined) {
                $("#queryTypeTable").hide();
                //查询到数据展示到前台
                //没找到数据给出提示
                //提示框
                swal(
                    '查找失败!',
                    '抱歉,没有查找到您要查找的信息',
                    'error'
                )
            } else {
                //显示表格
                $("#queryTypeTable").show();
                //显示数据
                showName.innerHTML = data.name;
                showGrade.innerHTML = data.grade;
                showDescribe.innerHTML = data.describe;
                showParent.innerHTML = data.parentId;

                idEle.innerHTML = data.id;
                //更新更新按钮
                $("#updateBtn").attr("href", "updateType.jsp?id=" + data.id);
            }
        }
    });
}