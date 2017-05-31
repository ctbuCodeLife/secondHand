/**
 * Created by myq on 2017/4/23.
 */
//增加商品
function addProdcut() {
    //输入非空验证
    var productEle = ["#pName", "#kindId", "#pDesc", "#pNum", "#originPrice", "#realPrice", "#pImage"];
    for (var i = 0; i < productEle.length; i++) {
        if ($(productEle[i]).val() === "") {
            $(productEle[i]).focus();
            return;
        }
    }
    var pName = $("#pName").val();
    var kId = $("#kindId").find("option:selected").val();  //获取Select选择的Text
    var pDesc = $("#pDesc").val();
    var pNum = $("#pNum").val();
    var originPrice = $("#originPrice").val();
    var realPrice = $("#realPrice").val();

    //判断商品是否存在
    $.ajax({
        type: "GET",
        url: "../api/product/add",
        data: {
            pName: pName,
            kId: kId,
            pDesc: pDesc,
            pNum: pNum,
            originPrice: originPrice,
            realPrice: realPrice,
            dataType: "json",
            success: function (response) {
                console.log(response);
            }
            //     if (response.status !== 1) {
            //         swal({
            //             title: '提示',
            //             text: response.data[0],
            //             timer: 3000
            //         }).then(
            //             function autoReturn() {
            //                 location.href = response.autoReturn
            //             },
            //             // handling the promise rejection
            //             function (dismiss) {
            //                 setTimeout(autoReturn)
            //                 if (dismiss === 'timer') {
            //                     console.log('I was closed by the timer')
            //                 }
            //             }
            //         )
            //     }
            // }
        }
    });
}
//删除商品
function delProduct(that) {
    var mydata;
    swal({
        title: '删除商品?',
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
                url: "../api/product/delete",
                data: {id: id},
                dataType: "json",
                success: function (response) {
                    mydata = response;
                    console.log(response.data);
                    swal({
                        title: '提示',
                        text: response.data[0],
                        timer: 3000
                    }).then(
                        function autoReturn() {
                            location.href = response.autoReturn
                        },
                        function (dismiss) {
                            setTimeout(autoReturn)
                            if (dismiss === 'timer') {
                                console.log('I was closed by the timer')
                            }
                        }
                    )
                }
            });

        }
    });
}
//修改商品
function updateProdcut() {
    //输入非空验证
    var productEle = ["#productName", "#productSubTitle", "#typeName", "#imageSrc", "#inventNum", "#monthSaleNum", "#orderLink", "#salePrice", "#realName", "#isRecommend"];
    for (var i = 0; i < productEle.length; i++) {
        if ($(productEle[i]).val() === "") {
            $(productEle[i]).focus();
            return;
        }
    }
    var name = $("#productName").val();
    var subTitle = $("#productSubTitle").val();
    var typeId = $("#typeName").val();
    var imageSrc = $("#imageSrc").val();
    var inventNum = $("#inventNum").val();
    var saleNum = $("#monthSaleNum").val();
    var orderLink = $("#orderLink").val();
    var salePrice = $("#salePrice").val();
    var realPrice = $("#realPrice").val();
    var isRecommend = $("#isRecommend").val()
    var productId = $("#id").val();
    alert(productId);
    $.ajax({
        type: "GET",
        url: "/ishop-admin/updateProduct",
        data: {
            name: name,
            subTitle: subTitle,
            typeId: typeId,
            imageSrc: imageSrc,
            inventNum: inventNum,
            saleNum: saleNum,
            orderLink: orderLink,
            salePrice: salePrice,
            realPrice: realPrice,
            isRecommend: isRecommend,
            id: productId
        },
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
        }
    });
    //提示框
    swal(
        '更新成功!',
        '成功更新了一条商品信息!',
        'success'
    ).then(function () {
        location.href = "listProduct.jsp";
    });
}
//查看所有商品
function listProductAll() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listAll",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}
//查看所有上架的商品
function listProductUp() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listAllUp",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}

//查看所有未审核商品
function listProductUnaudit() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listAllUnaudit",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}

//通过name查看商品
function getProductByName() {
    var mydata = [];
    var name = $("#name").val();
    $.ajax({
        type: "GET",
        url: "../api/product/findByName",
        data: {name: name},
        dataType: "json",
        success: function (response) {
            //这里获取到数据展示到前台
            if (response.status === 0) {
                swal(
                    '查找失败!',
                    '抱歉,没有查找到您要查找的商品',
                    'error'
                )
            } else {
                var vm = new Vue({
                    el: '#queryProductTable',
                    data: {
                        mydata: response.data
                    }
                });
                $("#queryProductTable").show();
            }
        }
    })
}
//审核商品
function auditProduct(that) {
    var mydata;
    swal({
        title: '审核商品?',
        text: "确定审核!!!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '确认审核',
        cancelButtonText: "取消"
    }).then(function (isConfirm) {
        if (isConfirm) {
            //执行删除操作
            var p = that.parentNode.firstElementChild;
            var id = p.innerHTML;
            $.ajax({
                type: "GET",
                url: "../api/product/updateStatus",
                data: {
                    id: id,
                    status: 1
                },
                dataType: "json",
                success: function (response) {
                    mydata = response;
                    console.log(response.data);
                    swal({
                        title: '提示',
                        text: response.data[0],
                        timer: 3000
                    }).then(
                        function autoReturn() {
                            location.href = response.autoReturn
                        },
                        function (dismiss) {
                            setTimeout(autoReturn)
                            if (dismiss === 'timer') {
                                console.log('I was closed by the timer')
                            }
                        }
                    )
                }
            });

        }
    });
}
//下架商品
function downProduct(that) {
    var mydata;
    swal({
        title: '下架商品?',
        text: "确定下架!!!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '确认下架',
        cancelButtonText: "取消"
    }).then(function (isConfirm) {
        if (isConfirm) {
            //执行删除操作
            var p = that.parentNode.firstElementChild;
            var id = p.innerHTML;
            $.ajax({
                type: "GET",
                url: "../api/product/updateStatus",
                data: {
                    id: id,
                    status: 2
                },
                dataType: "json",
                success: function (response) {
                    mydata = response;
                    console.log(response.data);
                    swal({
                        title: '提示',
                        text: response.data[0],
                        timer: 3000
                    }).then(
                        function autoReturn() {
                            location.href = response.autoReturn
                        },
                        function (dismiss) {
                            setTimeout(autoReturn)
                            if (dismiss === 'timer') {
                                console.log('I was closed by the timer')
                            }
                        }
                    )
                }
            });

        }
    });
}
//通过Id查询商品
function getProductById() {

}
//查看卖家所有商品
function listProductSaleser() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listUser",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}
//查看所有上架的商品
function listProductSaleserUp() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listUserUp",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}

//查看所有未审核商品
function listProductSaleserUnaudit() {
    var mydata = [];
    $.ajax({
        type: "GET",
        url: "../api/product/listUserUnaudit",
        dataType: "json",
        success: function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el: '#productTable',
                data: {
                    mydata: data.data
                }
            });
        }
    })
}
