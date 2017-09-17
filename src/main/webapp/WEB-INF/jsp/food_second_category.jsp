<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>无标题文档</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="shortcut icon" href="img/icon.png">
    <link rel="stylesheet" type="text/css"
          href="http://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.css">
</head>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<!-- <script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-zh-CN.min.js"></script> -->

<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/bootstrap-table.min.js"></script>

<script
        src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.4.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
    function formatter(value, row, index) {
        return "<image height='50' width='100' src='"+value+"'/>";
    }
</script>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h1>零食二级分类管理</h1>
        </div>

        <div id="toolbar" class="btn-group">
            <button id="plus" type="button" class="btn btn-default">
                <i class="icon-plus"></i>
            </button>
            <button id="edit" type="button" class="btn btn-default">
                <i class="icon-edit"></i>
            </button>
            <button>
                <i class="icon-trash"></i>
            </button>
        </div>
        <div>
            <table id="table" data-toggle="table" data-id-field="categoryId"
                   data-toolbar="#toolbar"
                   data-url="../food/getAllFoodSecondCategorys" data-search="true"
                   data-show-refresh="true" data-show-toggle="true"
                   data-pagination="true" data-show-columns="true" data-height="80%"
                   data-click-to-select="true">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-align="center" data-field="categoryId">二级分类Id</th>
                    <th data-align="center" data-field="category">名称</th>
                    <th data-align="center" data-field="imgUrl"
                        data-formatter="formatter">分类图片</th>
                    <th data-align="center" data-field="parentId"
                        data-sortable="true">上级分类</th>
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
                <h3 class="modal-title" id="myModalLabel">添加食品分类</h3>
            </div>

            <form id="secondCategoryForm" class="form-horizontal"
                  enctype="multipart/form-data"
                  action="../food/updateFoodSecondCategory" method="post">
                <div class="modal-body">
                    <div class="control-group">
                        <label class="control-label" for="category_id">食品二级分类Id</label>
                        <div class="controls">
                            <input type="text" name="categoryId" id="category_id"
                                   placeholder="Category Id">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="category_name">二级分类名称</label>
                        <div class="controls">
                            <input type="text" name="categoryName" id="category_name"
                                   placeholder="Category Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="img_url">二级分类图片</label>
                        <div class="controls">
                            <input type="file" id="img_url" name="myfile"
                                   placeholder="image">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="parent_id">上级分类</label>
                        <div class="controls">
                            <!-- <input type="text" id="parent_id"
                            placeholder="Frist Category Id"> -->
                            <select id="parent_category" name="parentId"
                                    class="selectpicker">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="secondFoodCategorySubmit"
                            class="btn btn-primary">提交更改</button>
                </div>
            </form>
        </div>

    </div>
    <!-- /.modal-content -->
</div>
</div>
<!-- /.modal -->
</body>
<Script>
    var $table = $("#table");
    var $plusButton = $("#plus");
    var $editButton = $("#edit");
    var $deleteButton = $("#delete");
    var obj = document.getElementById("parent_category");
    var flag = 0;

    $(function() {
        $editButton.click(function() {
            var array = $table.bootstrapTable('getSelections');
            falg = 1;
            if (array.length > 1) {
                alert("编辑操作不能同时选中多条记录！");
            } else if (array.length == 0) {
                alert("请先选中某条记录！");
            } else {
                $("#myModalLabel").text("编辑食品二级分类");
                $("#myModal").modal('show');

                $("#category_id").val(array[0].categoryId);
                $("#category_name").val(array[0].category);
                //$("#category_id").attr("disabled",true);
            }
            ;
        });

        $plusButton.click(function() {
            flag = 0;
            $("#myModalLabel").text("添加食品二级分类");
            $("#myModal").modal('show');
        });
        // $('.selectpicker').selectpicker();

        $("#myModal").on("hidden.bs.modal", function() {
            $("#category_id").val("");
            $("#category_name").val("");
            $("#img_url").val("");
            obj.options.length = 0;
        });

        $("#myModal").on(
            "shown.bs.modal",
            function() {
                var obj = document
                    .getElementById("parent_category");
                //这个兼容IE与firefox
                $.get(
                    "../food/getAllFoodFristCategorys",
                    function(text) {
                        var json = eval('(' + text
                            + ')');
                        for ( var i = 0; i < json.length; i++) {
                            obj.options
                                .add(new Option(
                                    json[i].category,
                                    json[i].categoryId));
                        }
                        ;
                        var array = $table
                            .bootstrapTable('getSelections');
                        for ( var i = obj.options.length - 1; i >= 0; i--) {
                            if (array[0].parentId == obj.options[i].value) {
                                obj.options[i].selected = true;
                            }
                            ;
                        }
                        ;
                    });
            });
    });
    $(function() {
        $deleteButton.click(function() {
            if (confirm("是否确定删除？")) {
                var array = $table.bootstrapTable('getSelections');
                var categoryIds = "";
                for ( var i = array.length - 1; i >= 0; i--) {
                    categoryIds += array[i].categoryId + ","
                }
                ;

                $.post("../food/deleteFoodCategory", {
                    categoryIds : categoryIds
                }, function(json) {
                    json = eval('(' + json + ')');
                    if (json.status == "success") {
                        for ( var i = array.length - 1; i >= 0; i--) {
                            $('#table').bootstrapTable('remove', {
                                field : 'categoryId',
                                values : [ array[i].categoryId ]
                            });
                        }
                        ;
                    } else {
                        alert(json.message);
                    }
                });
            }
        });
        var dataSecondCategoryForm = document
            .getElementById("secondCategoryForm");

        $("#secondFoodCategorySubmit").click(
            function() {
                if ($("#category_id").val() == null
                    || $("#category_id").val() == ""||!(/^\d+$/.test($("#category_id").val()))) {
                    alert("二级分类ID格式有问题");
                    return;
                }

                if ($("#category_name").val() == null
                    || $("#category_name").val() == "") {
                    alert("二级分类名称不能为空");
                    return;
                }

                dataSecondCategoryForm.submit();
            });

    });
</Script>
</html>

