<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品评价</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="shortcut icon" href="img/icon.png">

    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <script src="../assets/bootstrap-table/jquery.min.js"></script>
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
</head>
<script>
    var adminType = getCookie("type");
    function actionFormatter(value, row, index) {
        if(adminType==0){
            return [
                '<a class="delete" href="javascript:void(0)" title="删除该评价">',
                '<i class="icon-trash"></i>',
                '</a>'
            ].join('');
        }else if(adminType==1){
            return "无操作权限";
        }
    }

    window.actionEvents = {
        'click .delete': function (e, value, row, index) {
            $.post("service/deleteFoodCommentById",
                {
                    campusId : getCookie("campusId"),
                    foodId:row.foodId,
                    date:row.date,
                    grade:row.grade,
                    server:"56846a8a2fee49d14901d39cc48b8b2a"
                },
                function(text){
                    if(text!=1){
                        alert("删除评价失败");
                    }else{
                        $('#table').bootstrapTable('refresh', {silent: true,query: {foo:'bar'}});
                    }

                }
            );
        },
    };

    $(function(){
        var campusId = getCookie("campusId");
        //alert(campusId);
        $("#table").bootstrapTable({
            url:"../service/getAllComments?server=56846a8a2fee49d14901d39cc48b8b2a&campusId="+campusId
        });
    });

</script>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h1>
                商品评价管理
            </h1>
        </div>
        <div>
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
                    <th data-align="left" data-field="foodId" data-sortable="true">商品Id</th>
                    <th data-align="left" data-field="foodName">商品名称</th>
                    <th data-align="left" data-field="date" data-sortable="true">评论时间</th>
                    <th data-align="left" data-field="nickName" >评论人</th>
                    <th data-align="left" data-field="grade" data-sortable="true">评分</th>
                    <th data-align="left" data-field="comment">内容</th>
                    <th data-align="left" data-field="action" data-formatter="actionFormatter" data-events="actionEvents">删除评价</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</body>
</html>
