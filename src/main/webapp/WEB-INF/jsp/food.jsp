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

    <title>商品管理</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../css/style.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <link rel="shortcut icon" href="img/icon.png">
    <link rel="stylesheet" type="text/css"
          href="http://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.css">

    <style>
        .ml10 {
            margin-left: 10px;
        }
        #operate-success{
            padding:10px;
            font-size:16px;
            background-color:#8AC007;
            color:#FBFBFB;
            visibility:hidden
        }
        .inline{
            display: inline;
        }
        .margin-left6{
            margin:48px;
        }
    </style>
</head>
<body>
<div class="container wrapper-per" >
    <div class="row-fluid">
        <div class="page-header">
            <div class="row">
                <div class="span2">
                    <h1 style="background-color:white">商品管理</h1>
                </div>
            </div>
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
            <button id="addFoodCountBtn" type="button" class="btn btn-default">
                一键添加库存
            </button>
        </div>
        <div>
            <table id="table" data-id-field="foodId"data-striped="true"
                   data-toolbar="#toolbar"
                   data-search="true" data-show-refresh="true" data-show-toggle="true"
                   data-pagination="true" data-show-columns="true" data-height="80%"
                   data-click-to-select="true">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-align="left" data-field="foodId" data-sortable="true">商品Id</th>
                    <th data-align="left" data-field="name">名&nbsp;&nbsp;&nbsp;&nbsp;称</th>
                    <th data-align="left" data-field="message" data-sortable="true" data-visible="false">商品介绍</th>
                    <th data-align="left" data-field="price" data-sortable="true">商品价格</th>
                    <th data-align="left" data-field="discountPrice"
                        data-sortable="true" data-sortable="true">折扣价</th>
                    <th data-align="left" data-field="isDiscount"  data-formatter="discountFormatter">打折?</th>
                    <th data-align="left" data-field="foodCount">库存</th>
                    <th data-align="left" data-field="status" data-sortable="true" data-formatter="statusFormatter">商品状态</th>
                    <th data-align="left" data-field="primeCost"
                        data-sortable="true">成本价</th>
                    <th data-align="left" data-field="foodFlag"
                        data-sortable="true">商品标签</th>
                    <th data-align="left" data-field="categoryId" data-visible="false"
                        data-sortable="true">所属分类</th>
                    <th data-align="left" data-field="isFullDiscount" data-formatter="isFullDiscountFormatter">是否满减</th>
                    <th data-align="left" data-field="toHome"
                        data-formatter="toHomeOperateFormatter" data-events="homeImageEvents">推到首页</th>
                    <th data-align="center" data-field="homeImage" data-formatter="homeImageFormatter">首页商品</th>
                    <th data-align="left" data-field="homeImageManage"
                        data-sortable="true" data-formatter="detailImageManageFormatter" data-events="detailImageOperateEvents">详情管理</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<!-- 添加商品Modal start -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">添加商品</h3>
            </div>
            <form id="dataCommit" class="form-horizontal" method="post"
                  enctype="multipart/form-data" action="../service/updateFoods?server=56846a8a2fee49d14901d39cc48b8b2a">
                <div class="modal-body">
                    <div class="form-group" style="display:none">
                        <label class="control-label col-md-4" for="campusId2">校区Id</label>
                        <div class="col-md-8">
                            <input type="text" id="campusId2" name="campusId" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="foodId2">商品Id</label>
                        <div class="col-md-8">
                            <input type="text" id="foodId2" name="foodId"
                                   placeholder="Food Id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="categoryId2">商品分类</label>
                        <div class="col-md-8">
                            <select style="width:47%;padding:4px" id="categoryId2" name="parentId"
                                    class="selectpicker">
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="foodName2">商品名称</label>
                        <div class="col-md-8">
                            <input type="text" id="foodName2" name="foodName"
                                   placeholder="Food Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="message">商品介绍</label>
                        <div class="col-md-8">
                            <input type="text" id="message" name="message"
                                   placeholder="message">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="price2">商品价格</label>
                        <div class="col-md-8">
                            <input type="text" id="price2" name="price"
                                   placeholder="Present Price"> <span class="add-on">￥</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="discountPrice2">折扣价</label>
                        <div class="col-md-8">
                            <input type="text" id="discountPrice2" name="discountPrice"
                                   placeholder="Discount Price"> <span class="add-on">￥</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="primeCost2">成本价</label>
                        <div class="col-md-8">
                            <input type="text" id="primeCost2" name="primeCost"
                                   placeholder="Prime Cost"> <span class="add-on">￥</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="foodTag2">商品标签</label>
                        <div class="col-md-8">
                            <input type="text" id="foodTag2" name="foodTag"
                                   placeholder="商品标签之间请以逗号隔开">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="imgUrl2">商品主图片</label>
                        <div class="col-md-8">
                            <input type="file" id="imgUrl2" name="myfile"
                                   placeholder="Choose Picture">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="foodCount">商品库存</label>
                        <div class="col-md-8">
                            <input type="text" id="foodCount2" name="foodCount"
                                   placeholder="foodCount">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="status">商品状态</label>
                        <div class="col-md-8">
                            <label class="radio inline"> <input type="radio"
                                                                name="status" id="status" value="1" checked> 上架
                            </label> <label class="radio inline margin-left6"> <input type="radio"
                                                                                      name="status" id="status2" value="0"> 下架
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4" for="is_discount">是否打折</label>
                        <div class="col-md-8">
                            <label class="radio inline"> <input type="radio"
                                                                name="is_discount" id="is_discount" value="0" checked>
                                不打折
                            </label> <label class="radio inline margin-left6"> <input type="radio"
                                                                                      name="is_discount" id="is_discount2" value="1"> 打折
                        </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4" for="status">是否满减</label>
                        <div class="col-md-8">
                            <label class="radio inline"> <input type="radio"
                                                                name="isFullDiscount" id="isFullDiscount" value="1" checked> 是
                            </label> <label class="radio inline margin-left6"> <input type="radio"
                                                                                      name="isFullDiscount" id="isFullDiscount" value="0"> 否
                        </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="commitFoodDataButton"
                            class="btn btn-primary">提交更改</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<!-- /.modal -->
<!-- 添加商品Modal End -->

<!-- 推送图片到主页 modal start -->
<div class="modal fade" id="pushToHomeModal" tabindex="-1" roal="dialog"
     aria-labelledby="pushToHomeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="pushToHomeModalLabel">
                    推送到主页
                </h4>
            </div>
            <form class="form-horizontal" method="post"
                  enctype="multipart/form-data"
                  action="../service/uploadHomeImage?server=56846a8a2fee49d14901d39cc48b8b2a">
                <div class="modal-body">
                    <div class="control-group none">
                        <label class="control-label" for="server"></label>
                        <div class="controls">
                            <input type="text" id="server"
                                   name="server" readonly>
                        </div>
                    </div>
                    <div class="control-group none">
                        <label class="control-label" for="campus-id">校区id</label>
                        <div class="controls">
                            <input type="text" id="campus-id"
                                   name="campusId" readonly>
                        </div>
                    </div>
                    <div class="control-group none">
                        <label class="control-label" for="food-id">商品ID</label>
                        <div class="controls">
                            <input type="text" id="food-id"
                                   name="foodId" readonly>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="homeImg">推送图片</label>
                        <div class="controls">
                            <input type="file" id="homeImageFile"
                                   name="homeImageFile" placeholder="Choose Picture">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交更改</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 推送图片到主页 modal end -->


<!-- 详情图片管理 modal start -->
<div class="modal fade" id="manageDetailImageModal" tabindex="-1" role="dialog"
     aria-labelledby="manageDetailImageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="manageDetailImageModalLabel">
                    详情图片管理
                </h4>
            </div>
            <form id="detailImg" class="form-horizontal" method="post"
                  enctype="multipart/form-data"
                  action="../service/uploadDetailImage?server=56846a8a2fee49d14901d39cc48b8b2a">
                <div class="modal-body">
                    <div class="control-group none">
                        <label class="control-label" for="campus_id_detail">校区id</label>
                        <div class="controls">
                            <input type="text" id="campus_id_detail"
                                   name="campusId" value="56846a8a2fee49d14901d39cc48b8b2a" readonly>
                        </div>
                    </div>
                    <div class="control-group none">
                        <label class="control-label" for="server"></label>
                        <div class="controls">
                            <input type="text" id="server"
                                   name="server" readonly>
                        </div>
                    </div>
                    <div class="control-group none">
                        <label class="control-label" for="food_id_detail">商品ID</label>
                        <div class="controls">
                            <input type="text" id="food_id_detail"
                                   name="foodId" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" id="img1" name="img1" class="none"/>
                        <label for="detailImg1" class="col-sm-2 control-label">    图片一</label>
                        <div class="col-sm-4">
                            <img alt="正在加载中" id="showImg1" width="100" height="50">
                        </div>
                        <div calss="col-sm-4">
                            <input type="file" id="detailImg1" name="detailImageFiles"
                                   placeholder="Choose Picture">
                        </div>
                        <div calss="col-sm-2">
                            <input type="checkbox" id="is_delete1" class="inline"  name="is_delete1"/> 删除
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="text" id="img2" name="img2" class="none"/>
                        <label for="detailImg1" class="col-sm-2 control-label">    图片二</label>
                        <div class="col-sm-4">
                            <img alt="正在加载中" id="showImg2" width="100" height="50">
                        </div>
                        <div calss="col-sm-4">
                            <input type="file" id="detailImg1" name="detailImageFiles"
                                   placeholder="Choose Picture">
                        </div>
                        <div calss="col-sm-2">
                            <input type="checkbox" id="is_delete2" class="inline"  name="is_delete2"/> 删除
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" id="img3" name="img3" class="none"/>
                        <label for="detailImg1" class="col-sm-2 control-label">    图片三</label>
                        <div class="col-sm-4">
                            <img alt="正在加载中" id="showImg3" width="100" height="50">
                        </div>
                        <div calss="col-sm-4">
                            <input type="file" id="detailImg1" name="detailImageFiles"
                                   placeholder="Choose Picture">
                        </div>
                        <div calss="col-sm-2">
                            <input type="checkbox" id="is_delete3" class="inline" name="is_delete3"/> 删除
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交修改</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div>
</div><!-- /.modal -->
<!-- 详情图片管理 modal end -->

<!-- 添加库存modal start -->
<div class="modal fade" id="addFoodCountModal" tabindex="-1" role="dialog" aria-labelledby="addFoodCountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="addFoodCountModalLabel">添加库存</h4>
            </div>
            <form class="form-horizontal" role="form">
                <div class="modal-body">
                    <div class="form-group none">
                        <label for="campus_id_add_count" class="control-label col-md-4">校区ID</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="campus_id_add_count" name="campusId" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="count_add_count" class="control-label col-md-2">商品库存</label>
                        <div class="col-md-10">
                            <input type="number" class="form-control" id="count_add_count" name="addCount">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addFoodCountSubmit">提交更改</button>
                </div>
            </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 添加库存modal end -->
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
<script>
    function setSuccess(message){
        if(!message){
            $("#operate-success").text("设置成功！");
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
    var adminType = getCookie("type");
    var campusId = getCookie('campusId');

    if(adminType==1){
        $("#toolbar").hide();
    }else if(adminType==0){
        $("#toolbar").show();
    }
    $("#campusId2").val(getCookie("campusId"));
</script>
<Script>
    var $table = $("#table");
    var $plusButton = $("#plus");
    var $editButton = $("#edit");
    var $deleteButton = $("#delete");
    //var $specialName = $("#specialName");
    //var $specialCount = $("#specialCount");
    var foodId = "";
    var tag=0;
    var rowId;
    var obj = document.getElementById("categoryId2");
    //这个兼容IE与firefox
    //初始化表格数据
    $table.bootstrapTable({
        url : "../service/getAllFoods?server=56846a8a2fee49d14901d39cc48b8b2a&campusId="+getCookie("campusId")
    });

    $(function() {
        /*$("input[name='default_special']").on("change",function(){
            var value = $("input[name='default_special']:checked").val();
            if(value==0){
                alert("请务必添加该商品后为其添加口味。");
                $("#foodCounts").fadeOut(1000);
                $("#foodCount").val("");
            }
            else{
                $("#foodCounts").fadeIn(1000);
                // var div = document.getElementById("myModal");
                // div.scrollTop = div.scrollHeight;
            }
        });*/

        /*	var uploadImageUrl="../service/uploadDetailImage?campusId="+getCookie('campusId');

            $("#detailImg").attr("action",uploadImageUrl);*/
        $editButton.click(function() {
            var array = $table.bootstrapTable('getSelections');
            tag=1;

            if (array.length > 1) {
                alert("编辑操作不能同时选中多条记录！");
            } else if (array.length == 0) {
                alert("请先选中某条记录！");
            } else {
                $("#myModalLabel").text("编辑商品");
                $("#myModal").modal('show');

                $("#foodId2").val(array[0].foodId);
                $("#foodId2").attr('readonly',true);
                $("#foodName2").val(array[0].name);
                $("#price2").val(array[0].price);
                $("#discountPrice2").val(array[0].discountPrice);
                $("#primeCost2").val(array[0].primeCost);
                $("#foodTag2").val(array[0].foodFlag);
                $("#categoryId2").val(array[0].categoryId);
                $("#foodCount2").val(array[0].foodCount);
                $("#message").val(array[0].message);
                var status=document.getElementsByName("status")
                status[1-array[0].status].checked=true;

                var is_discount=document.getElementsByName("is_discount");
                is_discount[array[0].isDiscount].checked=true;
            }
        });

        $plusButton.click(function() {
            $("#myModalLabel").text("添加商品");
            $("#myModal").modal('show');
            tag=0;
        });

        $("#myModal").on("hidden.bs.modal", function() {
            //清楚modal的数据
            $("#foodId2").val("");
            $("#foodId2").attr("readonly",false);
            $("#foodName2").val("");
            $("#price2").val("");
            $("#discountPrice2").val("");
            $("#primeCost2").val("");
            $("#foodTag2").val("");
            $("#categoryId2").val("");
            $("#imgUrl2").val("");
            $("#foodCount2").val("");
            $("#message").val("");
            obj.options.length = 0;

            var status=document.getElementsByName("status")
            status[0].checked=true;

            var is_discount=document.getElementsByName("is_discount");
            is_discount[0].checked=true;
            var isFullDiscount=document.getElementsByName("isFullDiscount");
            isFullDiscount[0].checked=true;
            //var default_special=document.getElementsByName("default_special");
            //default_special[0].checked=true;
        });

        $("#manageDetailImageModal").on("hidden.bs.modal", function() {
            $("#img1").val("");
            $("#img2").val("");
            $("#img3").val("");
            $("#detailImg1").val("");
            $("#detailImg2").val("");
            $("#detailImg3").val("");
            $("#is_delete1").prop("checked",false);
            $("#is_delete2").prop("checked",false);
            $("#is_delete3").prop("checked",false);
            //清楚modal的数据
            /*$("#foodId2").val("");
            $("#foodId2").attr("readonly",false);
            $("#foodName2").val("");
            $("#price2").val("");
            $("#discountPrice2").val("");
            $("#primeCost2").val("");
            $("#foodTag2").val("");
            $("#categoryId2").val("");
            $("#imgUrl2").val("");
            $("#foodCount2").val("");
            $("#message").val("");
            obj.options.length = 0;

            var status=document.getElementsByName("status")
            status[0].checked=true;

            var is_discount=document.getElementsByName("is_discount");
            is_discount[0].checked=true;
            var isFullDiscount=document.getElementsByName("isFullDiscount");
            isFullDiscount[0].checked=true;*/
            //var default_special=document.getElementsByName("default_special");
            //default_special[0].checked=true;
        });

        $("#myModal").on(
            "shown.bs.modal",
            function() {

                $.get(
                    "../service/getAllFoodCategories4Client?server=56846a8a2fee49d14901d39cc48b8b2a&campusId="+campusId,
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
                        console.log(array[0]);
                        for ( var i = obj.options.length - 1; i >= 0; i--) {
                            if (array[0].categoryId == obj.options[i].value) {
                                obj.options[i].selected = true;
                            }
                            ;
                        }
                        ;
                    });
            });
        $deleteButton.click(function() {
            var array = $table.bootstrapTable('getSelections'); //获取选中的所有记录
            var foodIdString = "";
            if (array.length == 0)
                alert("请先选中要删除的记录！"); //选择记录不能为空
            else {
                for ( var i = array.length - 1; i >= 0; i--) {
                    if (i == 0) {
                        foodIdString += array[i].foodId; //连接最末不加，号
                    } else {
                        foodIdString += array[i].foodId + ","; //id用逗号连接
                    }
                }
                ;

                if (confirm("是否确定要执行删除操作！")) {
                    //做删除的访问请求
                    $.post("service/deleteFood", {
                        foodId : foodIdString,
                        campusId : getCookie("campusId"),
                        server:"56846a8a2fee49d14901d39cc48b8b2a"
                    }, function(text) {
                        var json = eval('(' + text + ')');
                        if (json.status == "success") {
                            for ( var i = array.length - 1; i >= 0; i--) {
                                $('#table').bootstrapTable('remove', {
                                    field : 'foodId',
                                    values : [ array[i].foodId ]
                                });
                            }
                            ;
                        } else {
                            alert(json.message);
                        }
                    });
                }
            }

        });
    });

    /*function actionFormatter(value, row, index) {
        return [
        '<a class="addSpecial" href="javascript:void(0)" title="添加口味">',
        '<i class="icon-plus"></i>',
        '</a>',
        '<a class="editSpecial ml10" href="javascript:void(0)" title="编辑口味">',
        '<i class="icon-edit"></i>', '</a>' ].join('');
    }*/

    /*function addSpecialCommit() {
        specialName = $specialName.val();
        specialCount = $specialCount.val();

        if ((specialName != null && specialName != "")
            && (specialCount != null && specialCount != "")) {
            if (!(/[0-9]/.test(specialCount))) {
                alert("口味数量中包含非法字符，请检查后再提交。");
                return;
            };
            $.post("food/addFoodSpecial", {
                foodId : foodId,
                specialName : specialName,
                specialCount : specialCount
            }, function(text) {
                var json = eval('(' + text + ')');
                if (json.status != "success") {
                    alert(json.message);
                } else {
                    $("#addSpecialModal").modal("hide");
                    $('#addSpecialModal').on('hide', function() {
                        $(this).removeData('modal');
                    });
                }
            });
        } else {
            alert("口味名称和口味数量不能为空！");
        }

    }*/

    /*window.actionEvents = {
        'click .addSpecial' : function(e, value, row, index) {
            foodId = row.foodId;
            $("#addSpecialModal").modal("show");

            //$specialName.val(""); //清空数据
            //$specialCount.val("");
            $("#food_name").val("");
            $("#food_name").text(row.name);
        },
        'click .editSpecial' : function(e, value, row, index) {
            $("#editSpecialModal").modal("show");
            rowId=row.foodId;
            $.post("food/getSpecial", {
                foodId : row.foodId
            }, function(text) {
                var json = eval('(' + text + ')');
                if (json.status == "success") {
                    var jsonlist = json.specialList;
                    if(jsonlist.length==0){
                        $("#specialMessage").html("暂无口味可编辑");
                    }
                    var i;
                    for ( i = 1; i <=jsonlist.length; i++) {
                        $("#specialName"+i).val(jsonlist[i-1].name);
                        $("#specialId"+i).val(jsonlist[i-1].specialId).hide();
                        $("#specialCount"+i).val(jsonlist[i-1].foodCount);
                    }
                    while(i<=3){
                        $("#special"+i).hide();
                        i++;
                    }
                } else {
                    alert("获取商品口味失败，请重试，若重试无效，请联系管理员！");
                }

            });
        },
    };*/

    /*$(function(){
        $("#editSpecialModal").on("hidden.bs.modal", function() {
            $("#special1").show();
            $("#special2").show();
            $("#special3").show();

            $("#speicalId1").val("");
            $("#specialId2").val("");
            $("#specialId3").val("");
            $("#specialMessage").html("");
            $("#specialName1").val("");
            $("#specialCount1").val("");
            $("#specialName2").val("");
            $("#specialCount2").val("");
            $("#specialName3").val("");
            $("#specialCount3").val("");
            $("#is_delete1").attr("checked",false);
            $("#is_delete2").attr("checked",false);
            $("#is_delete3").attr("checked",false);
        });

        $("#submitUpdateSpecial").on("click",function(){
            var specialId1=$("#specialId1").val();
            var specialId2=$("#specialId2").val();
            var specialId3=$("#specialId3").val();
            var specialName2=$("#specialName2").val();
            var specialName1=$("#specialName1").val();
            var specialName3=$("#specialName3").val();
            var specialCount1=$("#specialCount1").val();
            var specialCount2=$("#specialCount2").val();
            var specialCount3=$("#specialCount3").val();
            var isDelete1=$("#is_delete1:checked").is(':checked');
            var isDelete2=$("#is_delete2:checked").is(':checked');
            var isDelete3=$("#is_delete3:checked").is(':checked');

            if (specialCount1!=null&&specialCount1!=""&&!(/^\d+$/.test(specialCount1))) {
                alert("口味1数量中包含非法字符，请检查后再提交。");
                return;
            };
            if (specialCount2!=null&&specialCount2!=""&&!(/^\d+$/.test(specialCount2))) {
                alert("口味2数量中包含非法字符，请检查后再提交。");
                return;
            };
            if (specialCount3!=null&&specialCount3!=""&&!(/^\d+$/.test(specialCount3))) {
                alert("口味3数量中包含非法字符，请检查后再提交。");
                return;
            };
            $.post("../food/updateSpecialById",{
                foodId:rowId,
                speicalId1:specialId1,
                speicalId2:specialId2,
                specialId3:specialId3,
                specialName1:specialName1,
                specialName2:specialName2,
                specialName3:specialName3,
                specialCount1:specialCount1,
                specialCount3:specialCount3,
                specialCount2:specialCount2,
                isDelete1:isDelete1,
                isDelete2:isDelete2,
                isDelete3:isDelete3
            },function(text){
                var json = eval('(' + text + ')');
                if(json.status="success")
                    $("#editSpecialModal").modal("hide");
                else{
                    alert(json.message);
                };
            });
        });*/

    $("#commitFoodDataButton").on("click",function(){
        //对表单的数据进行验证
        var categoryId=$("#categoryId2").val();
        var foodCount=$("#foodCount2").val();
        var foodId=$("#foodId2").val();
        var foodName=$("#foodName2").val();
        var price=$("#price2").val();
        var discountPrice=$("#discountPrice2").val();
        var primeCost=$("#primeCost2").val();
        var $foodCommitDataForm=document.getElementById("dataCommit");

        console.log(categoryId);
        if(!(/^[0-9]+$/.test(categoryId))||!(/[0-9]+$/.test(foodId))){
            alert("商品id和上级分类id只可以是数字");
            return;
        }

        if(!(/^\d+(\.\d{1,2})?$/).test(price)){
            alert("商品单价格式有问题,检查后重新输入。");
            return;
        }

        if(!(/^\d+(\.\d{1,2})?$/).test(discountPrice)){
            alert("商品折扣价输入格式有问题,检查后重新输入。");
            return;
        }

        if(primeCost!=null&&primeCost!=""&&!(/^\d+(\.\d{1,2})?$/).test(primeCost)){
            alert("商品成本价输入格式有问题,检查后重新输入。");
            return;
        }

        if(foodName==null||foodName==""){
            alert("商品名称不能为空!");
            return;
        }

        if(!(/^[1-9][0-9]+$/.test(foodCount))){
            alert("商品库存格式有问题,检查后重新输入。");
            return;
        }
        /*var value = $("input[name='default_special']:checked").val();
        if(tag==0&&value==1&&(foodCount==null||foodCount=="")){
        	alert("若使用默认口味，口味数量不能为空。");
        	return;
        }
        */
        if(foodCount!=null&&foodCount!=""&&!(/\d+$/.test(foodCount))){
            alert("商品数量格式有问题，请检查后重新输入");
            return;
        }

        $foodCommitDataForm.submit();
    });
    //});
    function statusFormatter(value, row, index) {
        if (value == "0")
            return "下架";
        else if (value == "1") {
            return "在架";
        }
    }

    function discountFormatter(value, row, index) {
        if (value == "0")
            return "否";
        else if (value == "1") {
            return "是";
        }
    }

    function toHomeFormatter(value, row, index){
        if(value == "0"){
            return "否";
        }else if(value == "1"){
            return "是";
        }
    }

    function homeImageFormatter(value, row, index){
        if(value==""||!value){
            return "暂无图片";
        }
        return "<img height='50' width='100' alt='图片加载中' src="+value+">";
    }

    function detailImageManageFormatter(value, row, index){
        if(adminType==0){
            return [
                '<a class="edit" href="javascript:void(0)" title="edit">',
                '管理',
                '</a>'
            ].join('');
        }else if(adminType==1){
            return "无操作权限";
        }
    }

    window.detailImageOperateEvents={
        'click .edit' : function(e, value, row, index){
            $("#detailImg1").val("");
            $("#detailImg2").val("");
            $("#detailImg3").val("");
            $("#manageDetailImageModal").modal("show");
            $("#campus_id_detail").val(getCookie("campusId"));
            $("#food_id_detail").val(row.foodId);
            $.post(
                '../service/getDetailImg',
                {foodId:row.foodId,campusId:getCookie("campusId"),server:"56846a8a2fee49d14901d39cc48b8b2a"},
                function(data){
                    var json=data.imgs;
                    console.log(json.length);
                    for (var i = json.length - 1; i >= 0; i--)
                    {
                        $("#showImg"+(i+1)).attr("src",json[i]);
                        $("#img"+(i+1)).val(json[i]);
                    };
                },"json"
            );
        }
    };

    function toHomeOperateFormatter(value, row, index){
        if(adminType==0){
            if(row.toHome==1){
                return [
                    '<a class="cancelRecommendOperate" herf="javascript:void(0)" title="open">',
                    '取消推荐',
                    '</a>'
                ].join('');
            }else if(row.toHome==0){
                return [
                    '<a class="toHomeOperate" herf="javascript:void(0)" data-target="#pushToHomeModal" data-toggle="modal" title="open">',
                    '推到首页',
                    '</a>'
                ].join('');
            }
        }else if(adminType==1){
            return "无操作权限";
        }
    }

    window.homeImageEvents = {
        'click .toHomeOperate' : function(e, value, row, index){
            //alert(row);
            $("#food-id").val(row.foodId);
            $('#campus-id').val(getCookie('campusId'));
            $("#homeImageFile").val("");
            //$(this).modal('show');
        },
        'click .cancelRecommendOperate':function(e, value, row, index){
            $.post("../service/cancelRecommend",{
                foodId : row.foodId,
                campusId:getCookie("campusId"),
                server:"56846a8a2fee49d14901d39cc48b8b2a"
            },function(data){
                setSuccess(data.message);
                $table.bootstrapTable('refresh');
            },"json");
        }

    };

    function isFullDiscountFormatter(value, row, index){
        if(value==0){
            return '否';
        }else if(value==1){
            return '是';
        }
    }

    $(function(){
        $("#addFoodCountSubmit").click(function(){
            var campusId = $("#campus_id_add_count").val();
            var addCount = $("#count_add_count").val();
            $.post("../service/addFoodCount",{
                campusId : campusId,
                addCount : addCount,
                server:"56846a8a2fee49d14901d39cc48b8b2a"
            },function(data){
                //alert(data);
                $("#addFoodCountModal").modal('hide');
                $("#table").bootstrapTable('refresh',{silent:true});
                alert(data.message);

            },"json");
        });

        var $addFoodCountBtn = $("#addFoodCountBtn");
        $addFoodCountBtn.click(function(){
            /*var array = $("#table").bootstrapTable('getSelections');
            if(array.length==0){
                alert("请至少选中一条记录！");
            }else if(array.length>1){
                alert("不能同时编辑多条记录！");
            }else if(array.length==1){
                //alert(array[0].foodCount);
                $("#campus_id_add_count").val(getCookie("campusId"));
                $("#food_id_add_count").val(array[0].foodId);
                $("count_add_count").val(0);
                $("#addFoodCountModal").modal('show');
            }*/
            $("#campus_id_add_count").val(getCookie("campusId"));
            $("#addFoodCountModal").modal('show');
        });
    });
</Script>
</body>
</html>

