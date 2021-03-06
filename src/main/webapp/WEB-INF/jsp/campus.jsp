<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>校区管理</title>
    <title>校区管理</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../assets/bootstrap-table/jquery.min.js"></script>
    <script src="../assets/bootstrap-table/bootstrap.min.js"></script>
    <script src="../assets/bootstrap-table/jquery.validate.js"></script>
    <script src="../assets/bootstrap-table/messages_cn.js"></script>
    <script src="../assets/bootstrap-table/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/json2/20140204/json2.min.js"></script>
    <![endif]-->
    <!-- <script src="../js/jquery.cookie.js"></script> -->
    <script src="../js/util.js"></script>
</head>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header span2">
            <h1>校区管理</h1>
        </div>
        <div class="span10">
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
                <button id="add_city" type="button" class="btn btn-primary">
                    添加城市
                </button>
            </div>
            <table id="table" data-toggle="table"
                   data-url="/campus/getAllCampus?server=56846a8a2fee49d14901d39cc48b8b2a"data-toolbar="#toolbar"
                   data-pagination="true" data-striped="true" data-search="true"
                   data-show-refresh="true" data-show-toggle="true"
                   data-show-columns="true" data-height="80%"
                   data-click-to-select="true" data-toolbar-align="right">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="campusId" data-visible="false">校区ID</th>
                    <th data-field="campusName">校区名称</th>
                    <th data-field="cityId" data-visible="false">城市ID</th>
                    <th data-field="cityName">所在城市</th>
                    <th data-field="openTime">开店时间</th>
                    <th data-field="closeTime">关店时间</th>
                    <th data-field="status" data-formatter="statusFormatter">状态</th>
                    <th data-field="customService">客服电话</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <!-- 添加校区Modal Start -->
    <div class="modal fade" id="plusModal" tabindex="-1" role="dialog" aria-labelledby="myPlusModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myPlusModalLabel">添加校区</h4>
                </div>
                <div class="modal-body">
                    <form id="plus_campus_form"class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="plus_campus_name" class="col-sm-2 control-label">校区名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="plus_campus_name" name="campusName" placeholder="校区名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plus_city_name" class="col-sm-2 control-label">城市名称</label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <button type="button" class="dropdown-toggle btn btn-default" style="width:100%;" data-toggle="dropdown" id="plus_city_name">
                                        <span id="span_plus_city_name">城市</span>
                                        <b class="caret" style="float:right;margin-top:8px"></b>
                                    </button>
                                    <ul class="dropdown-menu"  style="width:100%">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plus_open_time" class="col-sm-2 control-label">开店时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="plus_open_time" name="openTime"placeholder="例06:00">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plus_close_time" class="col-sm-2 control-label">关店时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="plus_close_time"name="closeTimeoep" placeholder="例23:00">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plus_status" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <!-- <input type="text" class="form-control" id="plus_status" placeholder="状态"> -->
                                <div class="dropdown">
                                    <button type="button" class="dropdown-toggle btn btn-default" style="width:100%;" data-toggle="dropdown" id="plus_status">
                                        <span id="span_plus_status">状态</span>
                                        <b class="caret" style="float:right;margin-top:8px"></b>
                                    </button>
                                    <ul class="dropdown-menu"  style="width:100%">
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" style="text-align:center" href="javascript:void(0)">营业</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" style="text-align:center" href="javascript:void(0)">休息</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="plus_custom_service" class="col-sm-2 control-label">客服电话</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="plus_custom_service" placeholder="客服电话">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="plusSubmit()">提交更改</button>
                        </div>
                    </form>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 添加校区Modal End -->

    <!-- 删除校区Modal Start -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myDeleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myDeleteModalLabel">关闭校区</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="delete_campus_name" class="col-sm-2 control-label">校区名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="delete_campus_name" placeholder="校区名称" readonly>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" onclick="deleteSubmit()">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 删除校区Modal End -->

    <!-- 修改校区Modal Start -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myEditModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myEditModalLabel">修改校区</h4>
                </div>
                <div class="modal-body">
                    <form id="edit-campus-form" class="form-horizontal" role="form">
                        <div class="form-group none">
                            <label for="edit_campus_id" class="col-sm-2 control-label">校区ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_campus_id" placeholder="校区ID" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_campus_name" class="col-sm-2 control-label">校区名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_campus_name" placeholder="校区名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_city_name" class="col-sm-2 control-label">城市名称</label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <button type="button" class="dropdown-toggle btn btn-default" style="width:100%;" data-toggle="dropdown" id="edit_city_name">
                                        <span id="span_edit_city_name">城市</span>
                                        <b class="caret" style="float:right;margin-top:8px"></b>
                                    </button>
                                    <ul class="dropdown-menu"  style="width:100%">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_open_time" class="col-sm-2 control-label">开店时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_open_time" placeholder="开店时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_close_time" class="col-sm-2 control-label">关店时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_close_time" placeholder="关店时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_status" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <!-- <input type="text" class="form-control" id="edit_status" placeholder="状态"> -->
                                <div class="dropdown">
                                    <button type="button" class="dropdown-toggle btn btn-default" style="width:100%;" data-toggle="dropdown" id="edit_status">
                                        <span id="span_edit_status">状态</span>
                                        <b class="caret" style="float:right;margin-top:8px"></b>
                                    </button>
                                    <ul class="dropdown-menu"  style="width:100%">
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" style="text-align:center" href="javascript:void(0)">营业</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" style="text-align:center" href="javascript:void(0)">休息</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_custom_service" class="col-sm-2 control-label">客服</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_custom_service" placeholder="客服">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="editSubmit()">提交更改</button>
                        </div>
                    </form>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 修改校区Modal End -->

    <!-- 添加城市Modal Start -->
    <div class="modal fade" id="addCityModal" tabindex="-1" role="dialog" aria-labelledby="myAddCityModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myAddCityModalLabel">添加城市</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="addcity_city_name" class="col-sm-2 control-label">城市名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="addcity_city_name" placeholder="城市名称">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addCitySubmit()">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 添加城市Modal End -->
</div>

<script>
    var $table = $("#table");
    //全局变量
    var $plusButton = $("#plus");
    var $editButton = $("#edit");
    var $deleteButton = $("#delete");
    var $addCityButton = $("#add_city");
</script>
<script>
    //可供调用方法///////////////////////
    $.validator.addMethod("time", function(value, element) {
        return this.optional(element) || /^\d{1,2}:\d{2}$/.test(value);
    },"时间格式不正确，请检查是否有中文字符");
    ////////////////////////////////////

    ///////////////////////////////
    $("#plus_campus_form").validate({
        rules:{
            campusName:{
                required: true,
            },
            openTime:{
                required: true,
                time:true,
            },
            closeTime:{
                required:true,
                time:true,
            }
        },
        messages:{
            campusName:{
                required: "校区名称必须",
            },
            openTime:{
                required: "开店时间必须",
            },
            closeTime:{
                required: "关店时间必须",
            }
        }
    });
    ///////////////////////////////

    function statusFormatter(value, row, index){
        var html = [];
        switch(value){
            case 0:
                html=[
                    '休息中',
                ];
                break;
            case 1:
                html=[
                    '营业中',
                ];
                break;
        }
        return html.join('');
    }

    //表格上方的3个按钮监听
    //显示Modal并初始化Modal的input标签中的值
    $plusButton.click(function(){
        //城市列表
        //先清空城市下拉菜单
        $("#plus_city_name").next().empty();
        $.get("../campus/getAllCity?server=56846a8a2fee49d14901d39cc48b8b2a",function(data){
            for(var i=0; i<data.length; i++){
                $("#plus_city_name").next().append('<li style="text-align:center">'+data[i].cityName+'</li>');
            }
            //为城市名称下拉列表添加单击事件监听
            $("#plus_city_name").next().children().click(function(){
                //alert($(this).text());
                $("#span_plus_city_name").text($(this).text());
            });
            //为状态下拉列表添加单击事件监听
            $("#plus_status").next().children().click(function(){
                $("#span_plus_status").text($(this).text());
            });


        },"json");

    });

    //显示Modal并初始化Modal的input标签中的值
    $editButton.click(function(){
        var array = $table.bootstrapTable('getSelections');
        if(array.length == 0){
            alert("不能选中多条记录");
        }else if(array.length > 1){
            alert("请先选中某条记录");
        }else{
            //城市列表
            //先清空上次请求的内容
            $("#edit_city_name").next().empty();
            $.get("../campus/getAllCity?server=56846a8a2fee49d14901d39cc48b8b2a",function(data){
                for(var i=0; i<data.length; i++){
                    $("#edit_city_name").next().append('<li style="text-align:center;">'+data[i].cityName+'</li>');
                }
                //为城市下拉列表添加单击事件监听
                $("#edit_city_name").next().children().click(function(){
                    $("#span_edit_city_name").text($(this).text());
                });
                //为状态下拉列表添加单击事件监听
                $("#edit_status").next().children().click(function(){
                    $("#span_edit_status").text($(this).text());
                });

                $("#editModal").modal('show');
            },"json");
            //初始化
            $("#edit_campus_id").val(array[0].campusId);
            $("#edit_campus_name").val(array[0].campusName);
            $("#edit_city_id").val(array[0].cityId);
            $("#span_edit_city_name").text(array[0].cityName);
            $("#edit_open_time").val(array[0].openTime);
            $("#edit_close_time").val(array[0].closeTime);
            if(array[0].status==0){
                $("#span_edit_status").text("休息");
            }else if(array[0].status==1){
                $("#span_edit_status").text("营业");
            }
            $("#edit_custom_service").val(array[0].customService);

        }
    });

    //显示Modal并初始化Modal的input标签中的值
    $deleteButton.click(function(){
        var array = $table.bootstrapTable('getSelections');
        if(array.length>1){
            alert("不能选中多条记录");
        }else if(array.length==0){
            alert("请先选中某条记录");
        }else{
            $("#delete_campus_name").val(array[0].campusName);
            $("#deleteModal").modal('show');
        }

    });

    //显示Modal并初始化Modal的input标签中的值
    $addCityButton.click(function(){
        $("#addCityModal").modal('show');
    });

    //Modal“提交更改”按钮监听
    //Post请求并静态刷新表格数据
    function plusSubmit(){
        var campusName = $("#plus_campus_name").val().trim();
        var cityName = $("#span_plus_city_name").text().trim();
        var openTime = $("#plus_open_time").val().trim();
        var closeTime = $("#plus_close_time").val().trim();
        var status = $("#span_plus_status").text().trim();
        var customService = $("#plus_custom_service").val().trim();

        //判空
        if(!campusName||!cityName||!openTime||!closeTime||!status||!customService){
            alert("对不起，请补填未填写的地方！");
            return;
        }

        //alert(cityName);
        //status值是“休息”或“营业”，要转换成0或1
        if(status=="休息"){
            status = 0;
        }else if(status == "营业"){
            status=1;
        }

        $.post("../campus/addCampus",{
            campusName : campusName,
            cityName : cityName,
            openTime : openTime,
            closeTime : closeTime,
            status : status,
            customService : customService,
            server:"56846a8a2fee49d14901d39cc48b8b2a"
        },function(data){
            $("#plusModal").modal('hide');
            $table.bootstrapTable('refresh',{client:true});
        },"json");
    }

    function editSubmit(){
        var campusId = $("#edit_campus_id").val().trim();
        var campusName = $("#edit_campus_name").val().trim();
        var cityName = $("#span_edit_city_name").text().trim();
        var openTime = $("#edit_open_time").val().trim();
        var closeTime = $("#edit_close_time").val().trim();
        var status = $("#span_edit_status").text().trim();
        var customService = $("#edit_custom_service").val().trim();

        //判空
        if(!campusId||!campusName||!cityName||!openTime||!closeTime||!status||!customService){
            alert("对不起，请补填未填写的地方！");
            return;
        }

        if(status=="休息"){
            status = 0;
        }else if(status == "营业"){
            status=1;
        }
        $.post("../campus/updateCampus",{
            campusId : campusId,
            campusName : campusName,
            cityName : cityName,
            openTime : openTime,
            closeTime : closeTime,
            status : status,
            customService : customService,
            server:"56846a8a2fee49d14901d39cc48b8b2a"
        },function(data){
            $("#editModal").modal('hide');
            $table.bootstrapTable('refresh',{client:true});
        },"json");
    }

    function deleteSubmit(){
        //alert("建议使用关闭校区功能而非删除校区！");
        var array = $table.bootstrapTable('getSelections');
        console.log(array);
        $.post("../campus/closeCampus",
            {campusId:array[0].campusId,closeReason:"该校区已暂停营业,对您造成不便深感抱歉",status:0,server:"56846a8a2fee49d14901d39cc48b8b2a"},
            function(data){
                if(data.status=="success"){
                    alert(data.message);
                    $("#deleteModal").modal('hide');
                }else{
                    alert(data.message);
                }
            },'json');
    }

    function addCitySubmit(){
        var cityName = $("#addcity_city_name").val();

        if(!cityName){
            alert("对不起，请补填未填写的地方！");
            return;
        }

        $.post("../campus/addCity",{
            cityName : cityName,server:"56846a8a2fee49d14901d39cc48b8b2a"
        },function(data){
            if(data.status=="success"){
                alert(data.message);
                $("#addCityModal").modal('hide');
            }else{
                alert(data.message);
            }


        },"json");
    }
</script>
<script>
    //执行方法

</script>
</body>
</html>