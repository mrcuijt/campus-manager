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
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-table.min.css">
    <link rel="shortcut icon" href="/img/icon.png">
    <script src="/js/dateformat-plugin.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/highcharts.js"></script>
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
            <div class="tab-pane" id="statictic1"><iframe src="/cn/statistic_" id="iframepage" height="400" width="800" scrolling="no"></iframe></div>
        </div>
    </div>
</div>

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
    //过去一个月热销
    $(function() {
        var nowDate = new Date("2015-05-29");
        nowDate.setMonth(nowDate.getMonth() - 1);
        var start = nowDate.format("yyyy-MM-dd");
        nowDate = new Date();
        var end = nowDate.format("yyyy-MM-dd");
        //alert(start);"/food/1", {"start": start, "end": end, "page": 1, limit: 5}
        $.get("/food/1",{"start": start, "end": end, "page": 1, limit: 5} , function(data) {
            var xCategories = new Array();
            var seriesData = new Array();
            $.each(data, function (index, obj) {
                //alert(obj.sellCount);
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

//        $("#statistic1").load("statistic_.html");
    });
</script>
</body>
</html>
