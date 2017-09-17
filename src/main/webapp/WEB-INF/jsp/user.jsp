<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
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
    <style>
        .ml10 {
            margin-left: 10px;
        }

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
<div class="container">
    <div class="page-header">
        <h1>用户管理&nbsp;&nbsp;</h1>
    </div>
    <div style="text-align: center;">
        <span id="operate-success">设置成功</span>
    </div>
    <div>
        <table id="table" data-toggle="table" data-show-export="false"
               data-search="true" data-url="/user/"
               data-show-refresh="true" data-show-toggle="true"
               data-side-pagination="server" data-pagination="true">
            <thead>
            <tr>
                <!-- <th data-field="state" data-checkbox="true"></th> -->
                <th data-field="phone">手机号</th>
                <th data-field="nickname">昵称</th>
                <th data-field="type">权限</th>
                <th data-field="createTime">注册时间</th>
                <th data-field="lastLoginDate">最后登录时间</th>
                <th data-field="defaultAddress">默认地址</th>
                <th data-field="type" data-formatter="typeFormatter">用户类型</th>
                <th data-field="action" data-formatter="actionFormatter"
                    data-events="actionEvents">权限修改
                </th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script>
    //    $("#table").bootstrapTable({
    //        method: 'get',
    //        contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    //        url:"/user/1",//要请求数据的文件路径
    ////        height:tableHeight(),//高度调整
    ////        toolbar: '#toolbar',//指定工具栏
    //        striped: true, //是否显示行间隔色
    //        dataField: "res",//bootstrap table 可以前端分页也可以后端分页，这里
    //        //我们使用的是后端分页，后端分页时需返回含有total：总记录数,这个键值好像是固定的
    //        //rows： 记录集合 键值可以修改  dataField 自己定义成自己想要的就好
    //        pageNumber: 1, //初始化加载第一页，默认第一页
    //        pagination:true,//是否分页
    //        queryParamsType:'limit',//查询参数组织方式
    //        queryParams:queryParams,//请求服务器时所传的参数
    //        sidePagination:'server',//指定服务器端分页
    //        pageSize:10,//单页记录数
    //        pageList:[5,10,20,30],//分页步进值
    //        showRefresh:true,//刷新按钮
    //        showColumns:true,
    //        clickToSelect: true,//是否启用点击选中行
    ////        toolbarAlign:'right',//工具栏对齐方式
    //        buttonsAlign:'right',//按钮对齐方式
    ////        toolbar:'#toolbar',//指定工作栏
    //    })
    //
    //    //请求服务数据时所传参数
    //    function queryParams(params){
    //        return{
    //            //每页多少条数据
    //            pageSize: params.limit,
    //            //请求第几页
    //            pageIndex:params.pageNumber,
    //        }
    //    }
    //
    //    //查询按钮事件
    ////    $('#search_btn').click(function(){
    ////        $('#mytab').bootstrapTable('refresh', {url: '../index.php/admin/index/userManagement'});
    ////    })
</script>
<script>
    //全局变量
    var adminType = getCookie("type"); //0校区管理员，1总校区管理员
    var campusId = getCookie("campusId");

    //通用方法定义
    function setSuccess(message) {
        if (!message) {
            $("#operate-success").text("Well, it works!");
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

    function typeFormatter(value, row, index) {
        var type = "未定义";
        switch (value) {
            case 0:
                type = "分派员";
                break;
            case 1:
                type = "配送员";
                break;
            case 2:
                type = "普通用户";
                break;
        }
        return type;
    }

    function actionFormatter(value, row, index) {
        if (adminType == 0) {
            //当前角色是校区管理员
            return [
                '<a class="admin ml8" href="javascript:void(0)" title="设为配送员">',
                '&nbsp;<i class="glyphicon glyphicon-heart-empty"></i>&nbsp;',
                '</a>',
                '<a class="common ml8" href="javascript:void(0)" title="设为普通用户">',
                '&nbsp;<i class="glyphicon glyphicon-user"></i>&nbsp;',
                '</a>',
                '<a class="superAdmin ml8" href="javascript:void(0)" title="设置分派员">',
                '&nbsp;<i class="glyphicon glyphicon-heart"></i>&nbsp;',
                '</a>'].join('');
        } else if (adminType == 1) {
            //当前角色是总校区管理员
            return "无权操作";
        }
    }

    window.actionEvents = {
        'click .admin': function (e, value, row, index) {
            //alert("admin");
            $.post("user/setUserAdmin", {
                phone: row.phone,
                campusId: campusId,
                server: "56846a8a2fee49d14901d39cc48b8b2a"
            }, function (text) {
                if (text == -1 || text == 0) {
                    setSuccess("设置配送员失败。");
                } else {
                    setSuccess("设置配送员成功。");
                    $('#table').bootstrapTable('updateRow', {
                        index: index,
                        row: {
                            type: 1
                        }
                    });
                    //$('#table').bootstrapTable('refresh', {silent: true});
                }

            });
        },
        'click .common': function (e, value, row, index) {
            //alert("common");
            $.post("user/setUserCommon", {
                phone: row.phone,
                campusId: campusId,
                server: "56846a8a2fee49d14901d39cc48b8b2a"
            }, function (text) {
                if (text == -1 || text == 0) {
                    setSuccess("设置为普通用户失败。");
                } else {
                    setSuccess("设置为普通用户成功。");
                    $('#table').bootstrapTable('updateRow', {
                        index: index,
                        row: {
                            type: 2
                        }
                    });
                    //$('#table').bootstrapTable('refresh', {silent: true});
                }

            });
        },
        'click .superAdmin': function (e, value, row, index) {
            //alert("superAdmin");
            $.post("user/setUserSuperAdmin", {
                phone: row.phone,
                campusId: campusId,
                server: "56846a8a2fee49d14901d39cc48b8b2a"
            }, function (text) {
                if (text == -1 || text == 0) {
                    setSuccess("设置分派员失败。");
                } else {
                    setSuccess("设置分派员成功。");
                    $('#table').bootstrapTable('updateRow', {
                        index: index,
                        row: {
                            type: 0
                        }
                    });
                    //$('#table').bootstrapTable('refresh', {silent: true});
                }

            });
        }
    };
</script>
<script>
    //需要执行的方法
    $("#table").bootstrapTable('refreshOptions', function () {
        exportDataType: 'all'
    });
</script>
</body>
</html>
