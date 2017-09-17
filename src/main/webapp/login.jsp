<%@ page pageEncoding="utf-8" language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link rel="Shortcut Icon" href="img/icon.png"/>
    <title>后台管理</title>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <jsp:include page="common.jsp"/>
    <!-- Custom styles for this template-->
    <script src="/js/general-brower-login.js"></script>
    <style type="text/css">
        .message {
            color: red
        }

        #dropdownMenu1, [role=presentation] {
            width: 220px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">
            <div class="modal show" id="loginModal" aria-hidden="true">
                <div class="modal-header">
                    <h2>For优管理平台</h2>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="phone">用户名</label>
                            <div class="controls">
                                <input type="text" id="phone" placeholder="">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="password">密码</label>
                            <div class="controls">
                                <input type="password" id="password"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="password">验证码</label>
                            <div class="controls">
                                <input type="text" id="captcha"
                                       placeholder="">
                                <img src="captcha.jpg" width="70px"
                                     id="safeCode"
                                     onclick="this.src='captcha.jpg?d='+Math.random();"
                                     style="cursor:pointer"/>
                            </div>
                        </div>
                        <div class="control-group" style="height:60px">
                            <label class="control-label" for="dropdownMenu1">角色</label>
                            <%--Bootstrap 按钮下拉菜单--%>
                            <div class="controls">
                                <div class="dropdown">
                                    <button type="button" class="btn dropdown-toggle btn-primary" id="dropdownMenu1"
                                            data-toggle="dropdown">
                                        角色<span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="javascript:void(0)">校区管理员</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="javascript:void(0)">总校区管理员</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div id="message" class="pull-left message"></div>
                    <button type="button" class="btn btn-primary" id="submitMeun">&nbsp;登录&nbsp;</button>
                    <!-- <a href="/user/forgetPassword" target="_blank"class="inline">Forget password?</a> -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#dropdownMenu1").next().children().children().click(function () {
        $('#dropdownMenu1').text($(this).text());
    });
</script>
</body>
</html>

