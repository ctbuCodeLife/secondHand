/**
 * Created by myq on 2017/4/23.
 */
//增加商品
function addProdcut() {
    //输入非空验证
    var productEle = ["#productName", "#productSubTitle","#typeName", "#imageSrc", "#inventNum", "#monthSaleNum", "#orderLink","#salePrice","#realName","#isRecommend"];
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
    var inventNum =  $("#inventNum").val();
    var saleNum = $("#monthSaleNum").val();
    var orderLink = $("#orderLink").val();
    var salePrice = $("#salePrice").val();
    var realPrice = $("#realPrice").val();
    var isRecommend = $("#isRecommend").val();
    //判断商品是否存在
    $.ajax({
        type: "GET",
        url: "/ishop-admin/getProductByName",
        data: {name: name},
        dataType: "json",
        success: function (data) {
            if (jQuery.isEmptyObject(data) || data == false) {
                //说明商品名不存在可以添加,
                $.ajax({
                    type: "POST",
                    url: "/ishop-admin/addProduct",
                    data: {
                        name: name,
                        subTitle:subTitle,
                        typeId: typeId,
                        imageSrc:imageSrc,
                        inventNum:inventNum,
                        saleNum:saleNum,
                        orderLink:orderLink,
                        salePrice:salePrice,
                        realPrice:realPrice,
                        isRecommend:isRecommend
                    },
                    dataType: "json",
                    success: function (data) {
                        //这里获取到数据展示到前台
                        if(data==true){
                            function autoReturn() {
                                location = "listProduct.jsp";
                            }
                            swal(
                                '添加成功!',
                                '成功添加了一条商品信息!',
                                'success'
                            ).then(function () {
                                setTimeout(autoReturn, 2000);
                            });
                        }else{
                            swal(
                                '添加失败!',
                                '添加失败!',
                                'error'
                            ).then(function () {
                                    location.reload();
                            });
                        }

                    }
                });

            } else {
                //说明商品名存在,不能添加.
                swal(
                    '',
                    '该商品已存在,请重新输入!',
                    'warning'
                ).then(function () {
                    $("#name").focus();
                });
            }
        }
    });
}
//删除商品
function delProduct(that) {
    mydata;
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
    var productEle = ["#productName", "#productSubTitle","#typeName", "#imageSrc", "#inventNum", "#monthSaleNum", "#orderLink","#salePrice","#realName","#isRecommend"];
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
    var inventNum =  $("#inventNum").val();
    var saleNum = $("#monthSaleNum").val();
    var orderLink = $("#orderLink").val();
    var salePrice = $("#salePrice").val();
    var realPrice = $("#realPrice").val();
    var isRecommend = $("#isRecommend").val()
    var productId =$("#id").val();
    alert(productId);
    $.ajax({
        type: "GET",
        url: "/ishop-admin/updateProduct",
        data: {
            name: name,
            subTitle:subTitle,
            typeId: typeId,
            imageSrc:imageSrc,
            inventNum:inventNum,
            saleNum:saleNum,
            orderLink:orderLink,
            salePrice:salePrice,
            realPrice:realPrice,
            isRecommend:isRecommend,
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
    var mydata=[];
    $.ajax({
        type:"GET",
        url:"../api/product/listAll",
        dataType:"json",
        success:function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el:'#productTable',
                data:{
                    mydata:data.data
                }
            });
        }
    })
}
//查看所有商品
function listProductUp() {
    var mydata=[];
    $.ajax({
        type:"GET",
        url:"../api/product/listAll",
        dataType:"json",
        success:function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el:'#productTable',
                data:{
                    mydata:data.data
                }
            });
        }
    })
}

//查看所有商品
function listProduct() {
    var mydata=[];
    $.ajax({
        type:"GET",
        url:"../api/product/listAll",
        dataType:"json",
        success:function (data) {
            //这里获取到数据展示到前台
            var vm = new Vue({
                el:'#productTable',
                data:{
                    mydata:data.data
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
        type:"GET",
        url:"../api/product/findByName",
        data:{name:name},
        dataType:"json",
        success:function (response) {
            //这里获取到数据展示到前台
            if(response.status === 0){
                swal(
                    '查找失败!',
                    '抱歉,没有查找到您要查找的商品',
                    'error'
                )
            }else {
                var vm = new Vue({
                    el:'#queryProductTable',
                    data:{
                        mydata:response.data
                    }
                });
                $("#queryProductTable").show();
            }
        }
    })
}
//通过Id查询商品
function  getProductById() {

}