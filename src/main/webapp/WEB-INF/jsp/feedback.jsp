<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户反馈</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <link rel="shortcut icon" href="img/icon.png">
</head>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h1>用户反馈</h1>
        </div>

        <div>
            <table data-toggle="table"
                   data-url="user/getFeedbacks?server=56846a8a2fee49d14901d39cc48b8b2a"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-pagination="true"
                   data-show-columns="true"
                   data-height="80%">
                <thead>
                <tr>
                    <th data-align="left" data-field="phoneId">用户手机号</th>
                    <th data-align="left" data-field="date">反馈时间</th>
                    <th data-align="left" data-field="suggestion">反馈内容</th>
                </tr>
                </thead>
            </table>
        </div>

    </div>
</div>
<script src="../assets/bootstrap-table/jquery.min.js"></script>
<script src="../assets/bootstrap-table/jquery.validate.js"></script>
<script src="../assets/bootstrap-table/messages_cn.js"></script>
<script src="../assets/bootstrap-table/bootstrap.min.js"></script>
<script src="../assets/bootstrap-table/bootstrap-table.js"></script>
<script src="../assets/bootstrap-table/bootstrap-table-export.js"></script>
<script src="../assets/bootstrap-table/tableExport.js"></script>
<script src="../assets/bootstrap-table/bootstrap-table-editable.js"></script>
<script src="../assets/bootstrap-table/bootstrap-editable.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.min.js"></script>
<![endif]-->
<script src="../js/util.js"></script>
</body>
</html>

