<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>热销商品统计</title>
</head>
<body>
<div id="containerMonth" style="min-width: 800px; height: 400px;"></div>
<script src="/js/dateformat-plugin.js"></script>
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.bootcss.com/highcharts/4.1.5/highcharts.js"></script>
<script src="//cdn.bootcss.com/highcharts/4.1.5/modules/exporting.js"></script>
<script>

    //过去一个月的热销
    $(document).ready(function () {
        var nowDate = new Date("2015-05-29");
        nowDate.setMonth(nowDate.getMonth() - 1);
        var start = nowDate.format("yyyy-MM-dd");
        nowDate = new Date();
        var end = nowDate.format("yyyy-MM-dd");
        $.get("/food/1", {"start": start, "end": end, "page": 1, limit: 5}, function (data) {
            var xCategories = new Array();
            var seriesData = new Array();
            $.each(data, function (index, obj) {
                //alert(obj.sellCount);
                xCategories.push(obj.foodName);
                seriesData.push(obj.sales);
            });
            $('#containerMonth').highcharts({
                chart: {
                    type: 'column'
                },
                colors: ['#0d233a'],
                title: {
                    text: ''
                },
                xAxis: {
                    categories: xCategories
                },
                yAxis: {
                    title: {
                        text: '销售量'
                    }
                },
                series: [{
                    name: '过去一个月热销',
                    data: seriesData
                }],
                lang: {
                    noData: '抱歉，无法获取过去一个月热销数据'
                }
            });
        })
    })
    ;
</script>
</body>
</html>
