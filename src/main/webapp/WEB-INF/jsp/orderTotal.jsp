<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<meta charset="utf-8">
<head>
    <meta http-equiv="Content-type" content="text/html" />
    <meta name="title" content="foryou" />
    <meta name="language" content="zh" />
    <title>foryou后台管理系统</title>
    <link rel="stylesheet" href="../css/order.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker3.css">
    <link rel="stylesheet"
          href="../css/bootstrap-datepicker3.standalone.css">
    <link rel="icon" href="/favicon.ico?v=2" type="image/x-icon" />
    <link id="bs-css"
          href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="shortcut icon" href="../img/icon.png" type="image/x-icon" />
    <script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript"
            src="../js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="../js/util.js"></script>
    <style type="text/css">
        #content {
            padding: 0px;
        }

        .list_panel input.datepicker {
            width: 116px;
        }
        #select{
            background: #FF4500;
            color: #fff;
            border:1px solid #ff4500;
        }
        div.head-color{
            background-color: #FAFAFA;
        }

    </style>
</head>
<body>
<section id="content">
    <div class="g5 list_panel no_dine main_container" id="list_panel">
        <div class="title_and_filter head-color">
            <h2 name="counts">订单列表</h2>
            <form  id="order_center_filter">
                <span class="ml10">选择日期：</span> <span> <input type="text" value=""
                                                              id="datepicker" class="datepicker">
        </span> <input type="button" id="select" value="查询" class="submit" />
            </form>
        </div>

        <div class="order_filter_summary">
      <span class="fr mr30"> <a class="blue"
                                style="padding: 2px; margin-right: 5px;">1</a>
     </span> 共计：<span name="counts"></span> 张有效订单，总金额：<span name="total_price"></span>元
        </div>

        <div id="list_container">
            <ul id="list_items">
            </ul>
        </div>
    </div>
</section>
<script>
    $('#datepicker').datepicker({
        todayBtn : "linked",
        language : "zh-CN",
        autoclose : true,
    });

    $(function() {
        $('#datepicker').val(time());
        getTotalDate(null);

        $("#select").on("click",function(){
            $("#list_items").text("");
            getTotalDate($("#datepicker").val());
        });
    });


    //需要校区ID
    function getTotalDate(datetime) {

        var campusId = getCookie("campusId");
        //alert(campusId);
        $.post("../order/getOrdersByDate", {
            date : datetime,
            campusId : campusId,
            server:"56846a8a2fee49d14901d39cc48b8b2a"
        }, function(text) {
            var data = eval('(' + text + ')');
            $("h2[name='counts']").text("订单列表(" + data.counts + ")");
            $("span[name='counts']").text(data.counts);
            $("span[name='total_price']").text(data.total_price);

            for (var i = data.orderList.length - 1; i >= 0; i--) {
                formatList(data.orderList[i], i + 1);
            }

        });

    }

    function formatList(data, i) {
        $.get("togetherOrderDetail.txt", function(text) {
            text = text.replace(/(orderId##)/g, data.togetherId).replace(
                /(date##)/g, data.togetherDate).replace(/(orderPrice##)/g,
                data.totalPrice).replace(/(customeAddress##)/g,
                data.address).replace(/(customePhone##)/g,
                data.customePhone).replace(/(index##)/g, i);

            //显示备注
            if (data.message != null) {
                text = text.replace(/(message##)/g, data.message);
            } else {
                text = text.replace(/(message##)/g, "");
            }

            if (data.adminName != null) {
                text = text.replace(/(adminName##)/g, data.adminName);
            } else {
                text = text.replace(/(adminName##)/g, "");
            }
            //判断订单状态
            if (data.status == "2") {
                text = text.replace(/(orderStatus##)/g, "待确认");
            } else if (data.status == "3") {
                text = text.replace(/(orderStatus##)/g, "配送中");
            } else if (data.status == "4"||data.status=="5") {
                text = text.replace(/(orderStatus##)/g, "交易完成");
            }else if (data.status == "9") {
                text = text.replace(/(orderStatus##)/g, "申请退款中");
            }else if (data.status == "10") {
                text = text.replace(/(orderStatus##)/g, "管理员同意退款");
            } else if (data.status == "11") {
                text = text.replace(/(orderStatus##)/g, "退款完成");
            }else{
                text = text.replace(/(orderStatus##)/g, "");
            }

            /*if(data.payWay=="1"){
                text=text.replace(/(payWay##)/g,"支付宝支付");
            }else if(data.payWay=="2"){
                text = text.replace(/(payWay##)/g,"微信支付");
            }else{
                text = text.replace(/(payWay##)/g,"");
            }*/

            if (data.reserveTime != null) {
                text = text.replace(/(reserveTime##)/g, data.reserveTime);
            } else {
                text = text.replace(/(reserveTime##)/g, "立即送达");
            }
            $("#list_items").append(text);

            $.each(data.orderList, function(index, context) {
                $smallOrder = context;
                var price = 0;
                if ($smallOrder.isDiscount == 1) {
                    price = $smallOrder.discountPrice;
                } else {
                    price = $smallOrder.price;
                }

                var totalPrice = $smallOrder.price;
                $("#" + data.togetherId)
                    .append(
                        [
                            '<tr>',
                            '<td class="item_name"><span class="dishname">'
                            + $smallOrder.foodName
                            + '</span></td>',
                            '<td class="item_price">'
                            + price.toFixed(2) + '</td>',
                            '<td class="item_quantity">'
                            + $smallOrder.orderCount
                            + '</td>',
                            '<td class="item_total_price">'
                            + totalPrice.toFixed(2)
                            + '</td>', '</tr>' ].join(''));
            });

        });
    };

    function time()
    {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();
        if (month < 10)
            month = "0" + month;
        if (date < 10)
            date = "0" + date;
        //写入相应id

        return year + "年" + (month) + "月" + date + "日";
    }
</script>
</body>
</html>