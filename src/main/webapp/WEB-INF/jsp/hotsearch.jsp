<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>搜索标签管理</title>
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
<body>
<div id="info"></div>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h2>搜索标签管理<small>&nbsp;&nbsp;网站搜索框下的热门搜索</small></h2>
        </div>
        <div class="row">
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
                   data-toolbar="#toolbar"
                   data-pagination="true" data-striped="true" data-search="true"
                   data-show-refresh="true" data-show-toggle="true"
                   data-show-columns="true" data-height="80%"
                   data-click-to-select="true" data-toolbar-align="right">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="hotId" data-visible="false">#</th>
                    <th data-field="displayName">显示名称</th>
                    <th data-field="searchTag">搜索标签</th>
                    <th  data-field="hehe" data-formatter="displayFormatter">是否显示</th>
                    <th  data-field="isDisplay" data-formatter="actionFormatter" data-events="actionEvents">显示操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <div class="modal fade" id="hotSearchModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="tagName">添加标签</h3>
                </div>

                <form id="hotSearchData" class="form-horizontal">
                    <div class="modal-body">
                        <div class="form-group none">
                            <label for="hotId" class="col-sm-2 control-label">id</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="hotId" id="hotId" value="0">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="displayName" class="col-sm-2 control-label">标签名称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="dispalyName" id="dispalyName" placeholder="标签名称" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="searchTag" class="col-sm-2 control-label">搜索字段</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="searchTag" id="searchTag" placeholder="搜索字段" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="submitHotSearchData();">提交更改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end-->
    <script type="text/javascript">
        var campusId = getCookie("campusId");
        var $table=$('#table');
        $("#table").bootstrapTable({
            url : '../hotSearch/getHotSearchs?server=56846a8a2fee49d14901d39cc48b8b2a&campusId='+campusId
        });

        function submitHotSearchData(){
            var hotId=$('#hotId').val();
            var displayName=$('#dispalyName').val();
            var searchTag=$('#searchTag').val();

            $.post(
                '../hotSearch/updateHotSearch',
                {hotId:hotId,displayName:displayName,searchTag:searchTag,campusId:campusId,server:"56846a8a2fee49d14901d39cc48b8b2a"},
                function(data){
                    if(data.status=="success"){
                        $('#info').show();
                        $('#info').html("操作成功");
                        setTimeout("$('#info').hide()", 2000 );
                        $('#hotSearchModal').modal('hide');

                        $('#table').bootstrapTable('refresh', {silent: true});

                    }else{
                        $('#info').show();
                        $('#info').html("操作失败");
                        setTimeout("$('#info').hide()", 2000 );
                    }
                },'json'
            );
        }

        function actionFormatter(value, row, index) {
            if(value==1){
                return [
                    '<a class="not-display" herf="javascript:void(0)" title="close">',
                    '不显示',
                    '</a>'
                ].join('');
            }else{
                return [
                    '<a class="to-display" herf="javascript:void(0)" title="open">',
                    '显示',
                    '</a>'
                ].join('');
            }
        }
        function displayFormatter(value, row, index) {

            if(row.isDisplay==1){
                return "是";
            }else{
                return "否"
            }
        }

        $(function(){

            $('#plus').on('click',function(){
                $('#hotSearchModal').modal('show');
            });

            $('#edit').on('click',function(){
                var array = $table.bootstrapTable('getSelections');
                if(array.length>1){
                    $('#info').show();
                    $('#info').html("不可以同时编辑多条数据");
                    setTimeout("$('#info').hide()", 2000 );
                    return;
                }

                $('#hotId').val(array[0].hotId);
                $('#searchTag').val(array[0].searchTag);
                $('#dispalyName').val(array[0].displayName);
                $('#hotSearchModal').modal('show');
                $('#tagName').text('编辑标签');

            });

            $('#delete').on('click',function(){
                if(confirm('是否确定删除')){
                    var array = $table.bootstrapTable('getSelections');
                    if(array.length==0){
                        $('#info').show();
                        $('#info').html("请选中一条记录");
                        setTimeout("$('#info').hide()", 2000 );
                        return;
                    }
                    var $hotSearchIds="";
                    for (var i = array.length - 1; i >= 0; i--) {
                        $hotSearchIds+=array[i].hotId+",";
                    };
                    $.post(
                        '../hotSearch/deleteHotSearchs',
                        {hotIds:$hotSearchIds,server:"56846a8a2fee49d14901d39cc48b8b2a"},
                        function(data){
                            if(data.status=="success"){
                                $('#info').show();
                                $('#info').html("删除成功");
                                setTimeout("$('#info').hide()", 2000 );
                                $('#table').bootstrapTable('refresh', {silent: true});
                            }else{
                                $('#info').show();
                                $('#info').html("删除失败");
                                setTimeout("$('#info').hide()", 2000 );
                            }
                        },'json'
                    );
                }

            });

            $("#hotSearchModal").on("hidden.bs.modal", function() {
                $('#dispalyName').val("");
                $('#searchTag').val('');
                $('#hotId').val('0');
            });
        });

        window.actionEvents = {
            'click .not-display': function (e, value, row, index) {
                $.post(
                    "../hotSearch/setNot2Display",
                    {hotId:row.hotId,campusId:campusId,server:"56846a8a2fee49d14901d39cc48b8b2a"},
                    function(data){
                        if(data.status=="failure"){
                            $('#info').show();
                            $('#info').html("操作失败");
                            setTimeout("$('#info').hide()", 2000 );
                        }else{
                            $('#info').show();
                            $('#info').html("操作成功");
                            setTimeout("$('#info').hide()", 2000 );
                            $('#table').bootstrapTable('refresh', {silent: true});
                        }

                    },'json'
                );
            },
            'click .to-display': function (e, value, row, index) {
                $.post(
                    "../hotSearch/set2Display",
                    {hotId:row.hotId,campusId:campusId,server:"56846a8a2fee49d14901d39cc48b8b2a"},
                    function(data){
                        if(data.status=="failure"){
                            $('#info').show();
                            $('#info').html("操作失败");
                            setTimeout("$('#info').hide()", 2000 );
                        }else{
                            $('#info').show();
                            $('#info').html("操作成功");
                            setTimeout("$('#info').hide()", 2000 );
                            $('#table').bootstrapTable('refresh', {silent: true});
                        }

                    },'json'
                );
            }
        };
    </script>
</body>
</html>
