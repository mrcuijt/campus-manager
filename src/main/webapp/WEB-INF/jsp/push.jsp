<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>for you推送平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="shortcut icon" href="../img/icon.png">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/util.js"></script>

</head>
<style type="text/css">
    #pushForm label.error{
        color:red;
        font-size:15px;
        font-family: "新宋体";
    }
    .block{
        display: block;
    }
</style>
<body>
<div class="container">
    <div class="page-header">
        <h1>
            信息推送管理&nbsp;&nbsp;<small>向用户推送消息</small>
        </h1>
    </div>
    <form id="pushForm" enctype="multipart/form-data">
        <div class="control-group none">
            <label for="campusId" style="font-weight:bold;font-size:1.4em">校区id:</label>
            <div class="controls">
                <input type="text" id="campusId" name="campusId"/>
            </div>
        </div>
        <div class="control-group">
            <label for="push_data" style="font-weight:bold;font-size:1.4em">推送内容：</label>
            <div class="controls">
                <textarea id="push_data" class="form-control" rows="5" style="width:100%" name="push_data"  placeholder="推送的内容....."></textarea>
            </div>
        </div>
        <div class="control-group block">
            <label class="control-label">推送对象：</label>
            <div class="controls">
                <label class="checkbox"> <input type="checkbox"
                                                name="pushDeviceAndroid" value="1" id="androidPush" checked>
                    Android设备
                </label> <label class="checkbox inline"> <input type="checkbox"
                                                                name="pushDeviceIos" value="1" id="iOSPush" checked> iOS设备
            </label>
            </div>
        </div>
        <div class="control-group block">
            <div class="controls">
                <label class="radio"> <input type="radio"
                                             name="alert" id="alertAll" value="1" checked>
                    广播(所有人)
                </label> <label class="radio inline"> <input type="radio"
                                                             name="alert" id="alertSuperAdmin" value="2"> 广播（分派员）
            </label>
                <label class="radio inline"> <input type="radio"
                                                    name="alert" id="alertAdmin" value="3">
                    广播（配送员）
                </label> <label class="radio inline"> <input type="radio"
                                                             name="alert" id="alertUser" value="4"> 个体用户(手机号)
            </label>
            </div>

        </div>
        <div class="control-group">
            <label class="control-label"></label>
            <div class="controls" id="phoneLabel">
                <input type="text"  placeholder="手机号" name="phone" id="phone">
            </div>
        </div>
        <button id="push_data_commit" type="submit" class="btn btn-primary">发布推送</button>
    </form>
</div>
<script type="text/javascript">
    var $pushForm=$("#pushForm");
    var $campusId=getCookie("campusId");

    var validator;
    $(function(){
        $("#phoneLabel").hide();
        $("#campusId").val($campusId);
        validator=$pushForm.validate({
            debug:false,
            rules:{
                push_data:{
                    required:true,
                    maxlength:76
                },

            },
            messages:{
                push_data:{
                    required:"推送的内容不能为空！",
                    maxlength:"不能超过76个字"
                }
            },
            submitHandler: function(form) {
                //	var data=$("pushForm").serialize();
                $.ajax({
                    type:"post",
                    dataType:"json",
                    data:$("#pushForm").serialize(),
                    url : "../push/pushPlatForm?server=56846a8a2fee49d14901d39cc48b8b2a",
                    success:function(data){
                        if (data=="success") {
                            alert("推送发布成功！");
                        }
                    }
                });
            }
        });

        /*var radios=document.getElementByTagName("alert")
        if(radios[3].checked==true){

        }*/

        $("input[name='alert']").on("change",function(){
            var value = $("input[name='alert']:checked").val();
            if(value!=4){
                $("#phoneLabel").fadeOut(1000);
            }
            else{
                $("#phoneLabel").fadeIn(1000);
            }
        });
    });
</script>
</body>
</html>