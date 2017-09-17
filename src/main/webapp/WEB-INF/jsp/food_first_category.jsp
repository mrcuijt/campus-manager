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
    <title>分类管理</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <link rel="shortcut icon" href="../img/icon.png">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        #operate-success {
            padding: 10px;
            font-size: 16px;
            background-color: #8AC007;
            color: #FBFBFB;
            visibility: hidden
        }
    </style>
</head>
<body>
<div>
    <div class="container">
        <div class="row-fluid">
            <div class="page-header">
                <h1>商品分类管理</h1>
            </div>

            <div style="text-align:center;">
						<span id="operate-success">
    						设置成功
    					</span>
            </div>

            <div id="toolbar" class="btn-group">
                <button id="plus" type="button" class="btn btn-default">
                    <i class="glyphicon glyphicon-plus"></i>
                </button>
                <button id="edit" type="button" class="btn btn-default">
                    <i class="glyphicon glyphicon-edit"></i>
                </button>
                <button id="delete" type="button" class="btn btn-default">
                    <i class="glyphicon glyphicon-minus"></i>
                </button>
            </div>
            <table id="table"
                   data-id-field="categoryId"
                   data-toolbar="#toolbar"
                   data-pagination="true"
                   data-search="true"
                   data-url="/foodcategory/1"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-show-columns="true"
                   data-toggle="table"
                   data-show-export="true"
                   data-height="80%"
                   data-toolbar-align="right"
                   data-sort-order="asc"
                   data-click-to-select="true">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-align="center" data-field="categoryId" data-visible="false">商品分类Id</th>
                    <th data-align="center" data-field="category">分类名称</th>
                    <th data-align="center" data-field="isOpen" data-formatter="isOpenFormatter">是否开通</th>
                    <th data-align="center" data-field="dasd" data-formatter="operateFormatter"
                        data-events="operateEvents">操作
                    </th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<!--添加商品modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h3 class="modal-title" id="myModalLabel">添加商品</h3>
            </div>

            <form class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group none">
                        <label class="control-label col-sm-3" for="category_id">商品分类Id</label>
                        <div class="col-sm-8">
                            <input type="text" id="category_id" placeholder="Category Id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="category_name">分类名称</label>
                        <div class="col-sm-8">
                            <input type="text" id="category_name" placeholder="Category Name">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="submitData();" class="btn btn-primary">提交更改</button>
                </div>
            </form>
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
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.min.js"></script>
<![endif]-->
<script src="../js/util.js"></script>
<script>
    function setSuccess(message) {
        if (!message) {
            $("#operate-success").text("设置成功！");
        } else {
            $("#operate-success").text(message);
        }
        //$("#operate-success").show();
        $("#operate-success").css("visibility", "visible");
        window.setTimeout(function () {
            //$("#operate-success").hide();
            $("#operate-success").css("visibility", "hidden");
        }, 2000);
    }
</script>
<script>
    var adminType = getCookie("type");
    var $table = $("#table");
    if (adminType == 1) {
        $("#toolbar").hide();
    } else if (adminType == 0) {
        $("#toolbar").show();
    }
    var campusId = getCookie("campusId");
    //表格数据初始化
//    $(function () {
//        var campusId = getCookie("campusId");
        //alert(campusId);
//        $("#table").bootstrapTable({});
        /*$("#table").ajaxComplete(function(){
            $("#table>tbody>tr>td:odd:odd").text("fdsdfgd");
        });*/
//    });

    function isOpenFormatter(value, row) {
        if (value == 1) {
            return "是";
            //<a href="javascript:void(0)" data-name="name" data-pk="undefined"
            //data-value="Item 0" class="editable editable-click"
            //data-original-title="" title="">Item 0</a>
        }
        else {
            return "否";
        }
    }

    function operateFormatter(value, row, index) {
        if (adminType == 1) {
            return "无操作权限";
        } else if (adminType == 0) {
            if (row.isOpen == 1) {
                return [
                    '</a>',
                    '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
                    '关闭',
                    '</a>'
                ].join('');
            } else if (row.isOpen == 0) {
                return [
                    '<a class="like" href="javascript:void(0)" title="Like">',
                    '开通',
                    '</a>'
                ].join('');
            }
            return "无操作权限";
        }

    }

    window.operateEvents = {
        'click .like': function (e, value, row, index) {

            //alert('You click like icon, row: ' + JSON.stringify(row));
            //console.log(value, row, index);
            if (confirm("确认开通此分类吗？")) {
                $("#table").bootstrapTable('updateRow', {
                    index: index, row: {
                        isOpen: 1
                    }
                });

                //alert(campusId);
                $.post("../service/updateFoodCategory", {
                    categoryId: row.categoryId,
                    categoryName: row.category,
                    campusId: campusId,
                    isOpen: 1,
                    status: 1,//0是添加，1是更新
                    server: "56846a8a2fee49d14901d39cc48b8b2a"
                }, function (data) {
                    setSuccess(data.message);
                }, "json");
            }
            //alert(row.isOpen);
        },
        'click .remove': function (e, value, row, index) {
            //alert('You click like icon, row: ' + JSON.stringify(row));
            if (row.serial > 0 && row.serial < 9) {
                //这些分类不能删，不能关
                //alert("抱歉，此分类为主要分类，无法关闭");
                //return;
            }
            //console.log(value, row, index);
            if (confirm("确认关闭此分类吗？")) {
                $("#table").bootstrapTable('updateRow', {
                    index: index, row: {
                        isOpen: 0
                    }
                });
                var campusId = getCookie("campusId");
                //alert(campusId);
                $.post("../service/updateFoodCategory", {
                    categoryId: row.categoryId,
                    categoryName: row.category,
                    campusId: campusId,
                    isOpen: 0,
                    status: 1,//0是添加，1是更新
                    server: "56846a8a2fee49d14901d39cc48b8b2a"
                }, function (data) {
                    setSuccess(data.message);
                }, "json");
            }
        }
    };
    /*$(function(){
        $("#table>tbody>tr>td:odd:odd").click(function(){
            alert("checked");
        });
    });*/
</script>
<Script>

    var $plusButton = $("#plus");
    var $editButton = $("#edit");
    var $deleteButton = $("#delete");
    var flag;

    $(function () {
        $editButton.click(function () {
            var array = $table.bootstrapTable('getSelections');
            flag = 1;
            if (array.length > 1) {
                alert("编辑操作不能同时选中多条记录！");
            } else if (array.length == 0) {
                alert("请先选中某条记录！");
            } else {
                $("#myModalLabel").text("编辑商品分类");
                $("#myModal").modal('show');
                $("#category_id").val(array[0].categoryId);
                $("#category_name").val(array[0].category);
                $("#category_id").attr("disabled", true);
            }

        });
    });

    $(function () {
        $deleteButton.click(function () {

            if (confirm("是否确定删除？")) {
                var array = $table.bootstrapTable('getSelections');
                var categoryIds = "";
                for (var i = array.length - 1; i >= 0; i--) {
                    //判断序列是否是1-8，是的话，不能删除
                    if (array[i].serial > 0 && array[i].serial < 9) {
                        alert("主要分类不能删除！");
                        return;
                    }
                    categoryIds += array[i].categoryId + ",";
                }
                ;
                //alert(data.seller.campusId);
                var campusId = getCookie("campusId");
                $.post("../service/deleteFoodCategory", {
                    server: "56846a8a2fee49d14901d39cc48b8b2a",
                    categoryIds: categoryIds,
                    campusId: campusId
                }, function (json) {
                    json = eval('(' + json + ')');
                    if (json.status == "success") {
                        for (var i = array.length - 1; i >= 0; i--) {
                            $('#table').bootstrapTable('remove', {field: 'categoryId', values: [array[i].categoryId]});
                        }
                        ;
                    } else {
                        alert(json.message);
                    }
                });
            }
        });
    });

    $(function () {
        $plusButton.click(function () {
            flag = 0;
            $("#myModalLabel").text("添加商品分类");
            $("#category_id").attr("disabled", false);
            $("#myModal").modal('show');

        });
    });
    $("#myModal").on("hidden.bs.modal", function () {
        $("#category_id").val("");
        $("#category_name").val("");
    });

    function submitData() {
        var categoryId = $("#category_id").val();
        var categoryName = $("#category_name").val();

        $(function () {
            var campusId = getCookie("campusId");
            $.post("../service/updateFoodCategory", {
                campusId: campusId,
                categoryId: categoryId,
                categoryName: categoryName,
                status: flag,
                isOpen: 1,
                server: "56846a8a2fee49d14901d39cc48b8b2a"
            }, function (text) {
                var json = eval('(' + text + ')');
                if (json.status == "success") {
                    $("#myModal").modal('hide');
                    $('#table').bootstrapTable('refresh', {
                        silent: true,
                        query: {
                            foo: 'bar'
                        }
                    });
                    alert(json.message);
                } else {
                    alert(json.message);
                }
            });
        });
    }
</Script>
</body>
</html>


