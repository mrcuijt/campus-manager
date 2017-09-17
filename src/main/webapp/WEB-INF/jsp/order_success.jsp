<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>订单管理</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="shortcut icon" href="img/icon.png">
    <link rel="stylesheet"
          href="//rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/css/bootstrap-editable.css">
</head>


<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-export.min.js"></script>
<script
        src="//rawgit.com/kayalshri/tableExport.jquery.plugin/master/tableExport.js"></script>
<script
        src="//rawgit.com/kayalshri/tableExport.jquery.plugin/master/jquery.base64.js"></script>
<script src="../js/bootstrap-table-editable.min.js"></script>
<script
        src="//rawgit.com/vitalets/x-editable/master/dist/bootstrap3-editable/js/bootstrap-editable.js"></script>
<script src="../js/util.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.min.js"></script>
<![endif]-->
<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/locale/bootstrap-table-zh-CN.min.js"></script>
<body>
<div class="container">
    <div class="page-header">
        <h1>
            成功订单管理
        </h1>
    </div>
    <table id="table"
           data-id-field="phone"

           data-pagination="true"
           data-side-pagination="server"
           data-search="true"
           data-height="80%"
           data-show-refresh="true"
           data-show-columns="true"
           data-show-toggle="true"
           data-toolbar-align="right"
    >
        <thead>
        <tr>
            <th data-align="left" data-field="togetherId">订单号</th>
            <th data-align="left" data-field="phone">手机号</th>
            <th data-align="left" data-field="name" data-sortable="true"
            >商品名称</th>
            <th data-align="left" data-field="orderCount"
                data-sortable="true">数量</th>
            <th data-align="left" data-field="price"
                data-sortable="true">价格</th>
            <th data-align="left" data-field="togetherDate"
                data-sortable="true">订购时间</th>
            <th data-align="left" data-field="address"
                data-sortable="true">配送地址</th>
            <th data-align="left" data-field="receiverPhone"
            >收货人</th>
            <th data-align="left" data-field="adminName"
                data-sortable="true">配送人</th>
        </tr>
        </thead>
    </table>
</div>
<script>
    $(function(){
        var campusId = getCookie("campusId");
        //alert(campusId);
        $("#table").bootstrapTable({
            url:"order/getPCSimpleOrder?server=56846a8a2fee49d14901d39cc48b8b2a&status=4&campusId="+campusId
        });
    });
</script>
</body>

</html>

