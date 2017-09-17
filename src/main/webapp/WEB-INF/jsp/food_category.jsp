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
    <title>无标题文档</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <link rel="shortcut icon" href="../img/icon.png">
</head>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<!-- <script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-zh-CN.min.js"></script> -->

<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/bootstrap-table.min.js"></script>

<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/locale/bootstrap-table-zh-CN.min.js"></script>

<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h1>商品分类管理</h1>
        </div>

        <div id="toolbar" class="btn-group">
            <button id="plus" type="button" class="btn btn-default">
                <i class="icon-plus"></i>
            </button>
            <button id="edit" type="button" class="btn btn-default">
                <i class="icon-edit"></i>
            </button>
            <button id="delete" type="button" class="btn btn-default">
                <i class="icon-trash"></i>
            </button>
        </div>
        <div>
            <table data-toggle="table"
                   data-id-field="foodId"
                   data-toolbar="#toolbar"
                   data-url="/service/getAllFoodCategories"
                   data-search="true" data-show-refresh="true" data-show-toggle="true"
                   data-pagination="true" data-show-columns="true" data-height="80%"
                   data-click-to-select="true">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-align="center" data-field="foodId">商品Id</th>
                    <th data-align="center" data-field="name">昵称</th>
                    <th data-align="center" data-field="price">商品价格</th>
                    <th data-align="center" data-field="discountPrice"

                        data-sortable="true">折扣价</th>
                    <th data-align="center" data-field="status" data-sortable="true">商品状态</th>
                    <th data-align="center" data-field="primePrice"
                        data-sortable="true">成本价</th>
                    <th data-align="center" data-field="foodFlag"
                        data-sortable="true">商品标签</th>
                </tr>
                </thead>
            </table>
        </div>

    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">添加商品</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="foodId">商品Id</label>
                        <div class="controls">
                            <input type="text" id="foodId" placeholder="Food Id">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="foodName">商品名称</label>
                        <div class="controls">
                            <input type="text" id="foodName" placeholder="Food Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="price">商品价格</label>
                        <div class="controls">
                            <input type="text" id="price" placeholder="Present Price">
                            <span class="add-on">￥</span>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="discountPrice">折扣价</label>
                            <div class="controls">
                                <input type="text" id="discountPrice"
                                       placeholder="Discount Price"> <span class="add-on">￥</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="primeCost">成本价</label>
                            <div class="controls">
                                <input type="text" id="primeCost" placeholder="Prime Cost">
                                <span class="add-on">￥</span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="foodTag">商品标签</label>
                        <div class="controls">
                            <input type="text" id="foodTag" placeholder="商品标签之间请以逗号隔开">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="status">商品状态</label>
                        <div class="controls">
                            <label class="radio inline"> <input type="radio"
                                                                name="optionsRadios" id="status" value="1" checked> 上架
                            </label> <label class="radio inline"> <input type="radio"
                                                                         name="optionsRadios" id="status2" value="0"> 下架
                        </label>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary">提交更改</button>
                    </div>
            </div>
            <!-- /.modal-content -->
        </div>
    </div>
    <!-- /.modal -->

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
    <Script>
        var $table = $("#table");
        var $plusButton = $("#plus");
        var $editButton = $("#edit");
        var $deleteButton = $("#delete");

        $(function() {
            $editButton.click(function() {
                var array = $table.bootstrapTable('getSelections');

                if (array.length > 1) {
                    alert("编辑操作不能同时选中多条记录！");
                } else if (array.length == 0) {
                    alert("请先选中某条记录！");
                } else {
                    $("#myModalLabel").text("编辑商品");
                    $("#myModal").modal('show');

                }
            });
        });

        $(function() {
            $plusButton.click(function() {
                $("#myModalLabel").text("添加商品");
                $("#myModal").modal('show');
            });
        });
    </Script>
</body>
</html>

