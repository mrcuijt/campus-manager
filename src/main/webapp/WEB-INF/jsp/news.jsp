<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新闻管理</title>
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet"
          href="../assets/bootstrap-table/bootstrap-editable.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../assets/bootstrap-table/jquery.min.js"></script>
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
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>
            新闻管理&nbsp;&nbsp;
        </h1>
    </div>

    <div id="toolbar" class="btn-group">
        <button id="plus" type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-plus"></i>
        </button>
        <!--  <button id="edit" type="button" class="btn btn-default">
                      <i class="icon-edit"></i>
                  </button> -->
        <button id="delete" type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-minus"></i>
        </button>
    </div>
    <table id="table" data-id-field="newsId" data-pagination="true"
           data-toolbar="#toolbar" data-height="80%" data-show-refresh="true"
           data-show-columns="true" data-show-toggle="true"
           data-toolbar-align="right" data-click-to-select="true">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-align="left" data-field="newsId">新闻Id</th>
            <th data-align="left" data-field="title">标题</th>
            <th data-align="left" data-field="imgUrl"
                data-formatter="formatter">图片</th>
            <th data-align="left" data-field="createTime"
                data-sortable="true">发布时间</th>
            <th data-align="left" data-field="content" data-sortable="true">内容</th>
        </tr>
        </thead>
    </table>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">添加新闻</h3>
            </div>
            <form class="form-horizontal" method="post"
                  enctype="multipart/form-data"
                  action="../news/uploadNewsImage?server=56846a8a2fee49d14901d39cc48b8b2a">
                <div class="modal-body">
                    <div class="control-group none">
                        <label class="control-label" for="campus-id">校区Id</label>
                        <div class="controls">
                            <input type="text" name="campusId" id="campus-id" readonly>
                        </div>
                    </div>
                    <div class="" style="width:500px;height:26px;">
                        <label class="" for="titleId" style="float:left;display:block;width:70px;height:26px;line-height:26px;margin-bottom:0px;">新闻标题</label>
                        <div class="" style="float:left;margin-left:5px;">
                            <input type="text" name="title" id="titleId" placeholder="title">
                        </div>
                    </div>
                    <div class="" style="width:500px;height:26px;margin-top:4px;">
                        <label class="" for="imgUrl" style="float:left;display:block;width:70px;height:26px;line-height:26px;margin-bottom:0px;">新闻图片</label>
                        <div class="" style="float:left;margin-left:5px;">
                            <input type="file" id="myfile" name="myfile">
                        </div>
                    </div>
                    <div class="" style="width:500px;height:46px;margin-top:1px;">
                        <label class="" for="newsContent" style="float:left;display:block;width:70px;height:46px;line-height:46px;margin-bottom:0px;">新闻内容</label>
                        <div class="" style="float:left;margin-left:5px;">
                            <textarea id="content" name="content" placeholder="newsContent"> </textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<script>
    function formatter(value, row, index) {
        return "<image height='50' width='100' src='"+value+"'/>"
    }

    var adminType = getCookie("type");
    /*if(adminType==0){
      $("#toolbar").show();
    }else if(adminType==1){
      $("#toolbar").hide();
    }*/

    $("#campus-id").val(getCookie("campusId"));
    var $table = $("#table");
    var $plusButton = $("#plus");
    var $deleteButton = $("#delete");
    var $title = $("#titleId");

    $table.bootstrapTable({
        url : "../news/getPCAllNews?server=56846a8a2fee49d14901d39cc48b8b2a&campusId="+getCookie("campusId")
    });
    //隐藏的时候清除数据
    $("#myModal").on("hidden.bs.modal", function() {
        $("#titleId").val("");
        $("#myfile").val("");
        $("#content").val("");
    });

    $(function() {
        $plusButton.click(function() {
            $("#myModalLabel").text("添加新闻");
            $("#myModal").modal('show');
        });

        $deleteButton.click(function() {
            var array = $table.bootstrapTable('getSelections'); //获取选中的所有记录
            var newsIdString = "";
            if (array.length == 0)
                alert("请先选中要删除的记录！"); //选择记录不能为空
            else {
                for ( var i = array.length - 1; i >= 0; i--) {
                    if (i == 0) {
                        newsIdString += array[i].newsId; //连接最末不加，号
                    } else {
                        newsIdString += array[i].newsId + ","; //id用逗号连接
                    }
                }
                ;

                if (confirm("是否确定要执行删除操作！")) {
                    //做删除的访问请求
                    $.post("news/deleteNews", {
                        campusId : getCookie("campusId"),
                        newsId : newsIdString,
                        server:"56846a8a2fee49d14901d39cc48b8b2a"
                    }, function(text) {
                        var json = eval('(' + text + ')');
                        if (json.status == "success") {
                            for (var i = array.length - 1; i >= 0; i--) {
                                $('#table').bootstrapTable('remove', {field: 'newsId', values: [array[i].newsId]});
                            };
                        } else {
                            alert(json.message);
                        }
                    });
                }
            }

        });
    });
</script>
</body>
</html>

