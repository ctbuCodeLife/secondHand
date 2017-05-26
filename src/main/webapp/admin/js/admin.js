
//增加管理员
function addAdmin() {
    //输入非空验证
    var adminEle = ["#roleId", "#name", "#password", "#realName", "#email", "#phone"];
    for (var i = 0; i < adminEle.length; i++) {
        if ($(adminEle[i]).val() === "") {
            $(adminEle[i]).focus();
            return;
        }
    }
    var name = $("#name").val();
    var roleId = $("#roleId").val();
    var password = $("#password").val();
    var realName = $("#realName").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    //判断管理员是否存在
    $.ajax({
        type: "GET",
        url: "/ishop-admin/getAdminByName",
        data: {name: name},
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            if (jQuery.isEmptyObject(data) || data == false) {
                //说明管理员名不存在可以添加,
                $.ajax({
                    type: "POST",
                    url: "/ishop-admin/addAdmin",
                    data: {
                        roleId: roleId,
                        name: name,
                        password: password,
                        realName: realName,
                        email: email,
                        phone: phone
                    },
                    dataType: "json",
                    success: function (data) {
                        //这里获取到数据展示到前台
                        swal(
                            '添加成功!',
                            '成功添加了一条管理员信息!',
                            'success'
                        );
                        //2秒后自动跳转
                        function autoReturn() {
                            location = "listAdmin.jsp";
                        }
                        setTimeout(autoReturn, 2000);
                    }
                });

            } else {
                //说明管理员名存在,不能添加.
                swal(
                    '',
                    '该管理员名已存在,请重新输入!',
                    'warning'
                ).then(function () {
                    $("#name").focus();
                });
            }
        }
    });


}
//删除管理员
function delAdmin(that) {
    swal({
        title: '删除管理员?',
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
                url: "/ishop-admin/delAdmin",
                data: {id: id},
                dataType: "json",
                success: function (data) {
                    //这里获取到数据展示到前台
                    if(data === true){
                        swal(
                            '删除成功!',
                            '您已经成功删除管理员',
                            'success'
                        ).then(function () {
                            location.reload();
                        });
                    }else {
                        swal(
                            '删除失败!',
                            '删除管理员失败',
                            'success'
                        )
                    }
                }
            });

        }
    });
}
//修改管理员
function updateAdmin() {
    var adminEle = ["#id", "#roleId", "#name", "#password", "#realName", "#email", "#phone"];
    //输入框非空验证
    for (var i = 0; i < adminEle.length; i++) {
        if ($(adminEle[i]).val() === "") {
            $(adminEle[i]).focus();
            return;
        }
    }
    var id = $("#id").val();
    var roleId = $("#roleId").val();
    var name = $("#name").val();
    var password = $("#password").val();
    var realName = $("#realName").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    $.ajax({
        type: "GET",
        url: "/ishop-admin/updateAdmin",
        data: {
            id: id,
            roleId: roleId,
            name: name,
            password: password,
            realName: realName,
            email: email,
            phone: phone
        },
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
        }
    });
    //提示框
    swal(
        '更新成功!',
        '成功更新了一条管理员信息!',
        'success'
    ).then(function () {
        location.href = "listAdmin.jsp";
    });
}
//查看所有管理员
function listAdmin() {
    mydata = [];
    $.ajax({
        type: "GET",
        url: "/ishop-admin/listAdmin",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#adminTable',
                data: {
                    mydata: data
                }
            });
            $("#queryTable").addClass("show");
        }
    })
}
//通过name查看admin
function getAdmin() {
    var nameValue = $("#name").val();
    var nameEle = document.getElementById("showName");
    var roleIdEle = document.getElementById("showroleId");
    var passwordEle = document.getElementById("showPassword");
    var phoneEle = document.getElementById("showPhone");
    var emailEle = document.getElementById("showEmail");
    var realNameEle = document.getElementById("showRealName");
    var idEle = document.getElementById("deleteId");
    $.ajax({
        type: "GET",
        url: "/ishop-admin/getAdminByName",
        data: {name: nameValue},
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            if (data.id === undefined) {
                $("#queryAdminTable").hide();
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
                $("#queryAdminTable").show();
                //显示数据
                nameEle.innerHTML = data.name;
                roleIdEle.innerHTML = data.roleId;
                passwordEle.innerHTML = data.password;
                phoneEle.innerHTML = data.phone;
                emailEle.innerHTML = data.email;
                realNameEle.innerHTML = data.realName;
                idEle.innerHTML = data.id;
                //更新更新按钮
                $("#updateBtn").attr("href", "updateAdmin.jsp?id=" + data.id);
            }
        }
    });
}
