<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang='en'>
<meta charset='utf-8'>
<head>
    <title>一键关店</title>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="../js/util.js"></script>
    <style>
        #operate-success{
            padding:10px;
            font-size:16px;
            background-color:#8AC007;
            color:#FBFBFB;
            visibility:hidden
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row-fluid">
        <div class="page-header">
            <h1>
                一键关店
            </h1>
        </div>
        <div style="text-align:center;margin-bottom:20px">
				<span id="operate-success">
    			设置成功
    			</span>
        </div>
        <div>
            <form class="form" style="width:50%">
                <div class="form-group" style="hight:200px;margin-bottom:6px">
                    <label for="campus_name" class="col-sm-2 control-label">校区</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="campus_name"
                               readonly="readonly" />
                    </div>
                </div>
                <br/>
                <br/>
                <div class="form-group">
                    <label for="close_reason" class="col-sm-2 control-label">原因</label>
                    <div class="col-sm-10">
							<textarea id="close_reason" class="form-control" rows="3"
                                      placeholder="提醒：您的关店原因会被直接推送给相关用户，请使用敬语！！！"></textarea>
                    </div>
                </div>
                <div class="form-group" style="float:right;margin-top:20px">
                    <input type="button" class="btn btn-default" onclick="" value="取消"/>
                    <input type="button"  class="btn btn-primary" onclick="toClose();" value="确认"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    //定义通用方法
    function setSuccess(message){
        if(!message){
            $("#operate-success").text("Well, it works!");
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
    $(function(){
        $.post("../campus/getCampusById",{
            campusId : getCookie("campusId"),
            server:"56846a8a2fee49d14901d39cc48b8b2a"
        },function(data){
            $("#campus_name").val(data.campus.campusName);
        },"json");
    });

    function toClose(){
        var closeReason = $("#close_reason").val();
        if(!closeReason){
            alert("对不起，关店原因不能为空！");
        }
        else{
            $.post("../campus/closeCampus",{
                campusId : getCookie("campusId"),
                closeReason : closeReason,
                status : 0,//关店传0，开店传1。
                server:"56846a8a2fee49d14901d39cc48b8b2a"
            },function(data){
                setSuccess(data.message);
                if(data.status=='success'){
                    document.cookie="status=0";
                }
            },"json");
        }
    }
</script>
</html>
