/**
 * Created by myq on 2017/4/23.
 */

//处理订单
function updateSales(){
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
        '处理成功!',
        '成功处理了一笔订单!',
        'success'
    ).then(function () {
        location.href = "listSales.jsp";
    });
}
//查看所有订单
function listSalesAll() {
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
function getSalesById() {
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
