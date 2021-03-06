<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="shortcut icon" href="img/icon.png">
</head>
<style>
    #operate-success{
        padding:10px;
        font-size:16px;
        background-color:#8AC007;
        color:#FBFBFB;
        visibility:hidden
    }
</style>
<body>
<div class="container" >
    <div class="row-fluid">
        <div class="page-header">
            <h1>
                首页
            </h1>
        </div>
        <div style="text-align:center;">
    			<span id="operate-success">
        			设置成功
    			</span>
        </div>

        <div>
            <ul id="myTab" class="nav nav-pills" role="tablist">

                <li class="active"><a href="#statistic" role="tab" data-toggle="tab">销量分析</a></li>
                <li><a href="#statictic1" role="tab" data-toggle="tab">销售额分析</a></li>
            </ul>
        </div>
        <!-- 选项卡面板 -->
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane active" id="statistic"></div>
            <!-- <div class="tab-pane active" id="statistic1">

            </div> -->
            <div class="tab-pane" id="statictic1"><iframe src="statistic_.html" id="iframepage" height="400" width="800" scrolling="no"></iframe></div>
        </div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/highcharts.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js" type="text/javascript"></script>
<script src="../js/util.js"></script>
<script type="text/javascript">
    function setSuccess(message){
        if(!message){
            $("#operate-success").text("Well, it works!");
        }else{
            $("#operate-success").text(message);
        }
        //$("#operate-success").show();
        $("#operate-success").css("visibility", "visible");
        window.setTimeout(function(){
            //$("#operate-success").hide();
            $("#operate-success").css("visibility", "hidden");
        }, 2000);
    }
</script>
<script>
    //日期格式化函数
    Date.prototype.format = function(format){
        var o = {
            "M+" : this.getMonth()+1, //month
            "d+" : this.getDate(), //day
            "h+" : this.getHours(), //hour
            "m+" : this.getMinutes(), //minute
            "s+" : this.getSeconds(), //second
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter
            "S" : this.getMilliseconds() //millisecond
        }

        if(/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }

        for(var k in o) {
            if(new RegExp("("+ k +")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
            }
        }
        return format;
    };
    //过去一个月热销
    $(function() {
        //alert(new Date().format("yyyy-MM-dd"));
        var dateEnd = new Date();
        //alert(myDate.format("yyyy-MM-dd"));
        var dateStart = new Date();
        dateStart.setDate(dateEnd.getDate() - 30);
        var xCategories = new Array();
        var seriesData = new Array();
        var start = dateStart.format("yyyy-MM-dd");
        var end = dateEnd.format("yyyy-MM-dd");
        //alert(start);
        $.get("../service/getTopFive?server=56846a8a2fee49d14901d39cc48b8b2a&" + "dateStart=" + start + "&dateEnd="
            + end+"&limit=10&page=1&campusId="+getCookie("campusId"), function(text) {

            var json = eval('(' + text + ')');
            $.each(json.hotFive, function(index, obj) {
                xCategories.push(obj.foodName);
                seriesData.push(obj.sales);
            });
            $('#statistic').highcharts({
                chart : {
                    type : 'column'
                },
                colors : [ '#0d233a' ],
                title : {
                    text : ''
                },
                xAxis : {
                    categories : xCategories
                },
                yAxis : {
                    title : {
                        text : '销售量'
                    }
                },
                series : [ {
                    name : '过去一个月热销',
                    data : seriesData
                } ],
                lang : {
                    noData:'抱歉，无法获取过去一个月热销数据'
                }
            });

        });

        //$("#statistic1").load("statistic_.html");
    });
</script>
</body>
</html>
