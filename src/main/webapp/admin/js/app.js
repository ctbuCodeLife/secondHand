/**
 * Created by tao on 2017/4/5 0005.
*/

function getCookie(Name) {
    var search = Name + "="//查询检索的值
    var returnvalue = "";//返回值
    if (document.cookie.length > 0) {
        sd = document.cookie.indexOf(search);
        if (sd!= -1) {
            sd += search.length;
            end = document.cookie.indexOf(";", sd);
            if (end == -1)
                end = document.cookie.length;
            //unescape() 函数可对通过 escape() 编码的字符串进行解码。
            returnvalue=unescape(document.cookie.substring(sd, end))
        }
    }
    return returnvalue;
}

function findLog() {
        $.ajax({
                type:"POST",
                url:"/attend/findlog",
                dataType:"json",
                data:{
                    uid:getCookie("userId")
                },
                success:function (data) {
                    //清楚之前的数据
                    $('#table').bootstrapTable('destroy');
                    $('#table').bootstrapTable({
                        data: data
                    })
                }
            }
        );
    }

/**提交日志**/
function addLog(){
        var addFrom = document.addfrom;
        var uid = addFrom.uid;
        var workdate = addFrom.workdate;
        var describe = addFrom.describe;
        var worktime= addFrom.worktime;
        var difficulty = addFrom.difficulty;
        var remark = addFrom.remark;
        var dd = {
                uid:uid.value,
                workdate:workdate.value,
                describe:describe.value,
                worktime:worktime.value,
                difficulty:difficulty.value,
                remark:remark.value
        }
        $.ajax({
                type:"POST",
                url:"/attend/addlog",
                dataType:"json",
                data:dd,
                success:function (msg) {
                   if(msg == true){
                       alert("提交成功");
                   }else{
                       alert("提交失败");
                   }
                   //清空模态框的数据
                    uid = addFrom.uid;
                   workdate.value = "";
                   describe.value = "";
                   worktime.value = "";
                   difficulty.value = "";
                   remark.value = "";
                   //关闭模态框
                   $("#closeModel").click();
                   findLog();
                }

            }
        )
    }


function exportXls() {
    $.ajax({
            type:"POST",
            url:"/attend/findlog",
            dataType:"json",
            data:{
                uid:getCookie("userId")
            },
            success:function (data) {
                //$("#table").tableExport({type:'json',escape:'false'});
               // JSONToCSVConvertor(data, "Vehicle Report", true);
                location.href="exportExcel";
            }
        }
    );
    }

function findAllLog() {
        var data = {
            rows:[]
        }
        $.ajax({
                type:"POST",
                url:"/attend/admin/allLog",
                dataType:"json",
                data:{
                },
                success:function (result) {
                   console.log(result);
                }
            }
        );

    }

$(document).ready(function(){
    $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd',
        language: 'cn',
        pickDate: true,
        pickTime: true,
        hourStep: 1,
        minuteStep: 15,
        secondStep: 30,
        inputMask: true
    });
})

