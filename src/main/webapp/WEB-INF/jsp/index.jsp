<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/9/15
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>后台管理</title>
    <link rel="Shortcut Icon" href="/img/icon.png"/>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
    <link rel='stylesheet' type='text/css' href='/css/style.css'/>
    <link rel="stylesheet" type="text/css" href="/css/iconfont/iconfont.css"/>
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script type='text/javascript' src="/js/bootstrap.min.js"></script>
</head>
<style>
    a:hover {
        text-decoration: none
    }

    .left {
        width: 120px;
        float: left;
        margin-left: -22px;
    }

    .right {
        float: left;
        width: 1100px;
        margin-top: 42px;
    }

    #campusDropdown {
        visibility: hidden
    }

    .sideBar ul {
        border-right: 1px solid #eee;
    }
</style>

<body>
<!--导航条模板参照 http://www.runoob.com/bootstrap/bootstrap-v2-navbar.html-->
<header class='navbar navbar-fixed-top'>
    <div class='navbar-inner'>
        <div class='container-fluid'>
            <a class='brand pull-left'><img src="img/icon.png" width="20px" height="auto">&nbsp;后台管理</a>
            <ul class='nav pull-right'>
                <li>
                    <div>
                        <button type="button" id="one_key_open" onclick="oneKeyOpen()" class="btn btn-default">一键开店
                        </button>
                    </div>
                </li>
                <li>
                    <!-- 添加校区下拉菜单 -->
                    <div class="dropdown" id="campusDropdown">
                        <button type="button" class="btn dropdown-toggle"
                                id="dropdownMenu1" data-toggle="dropdown">
                            校区 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu"
                            aria-labelledby="dropdownMenu1" id="dropdown-campus">

                        </ul>
                    </div>
                </li>
                <li><a href="/user/logout?server=56846a8a2fee49d14901d39cc48b8b2a" rel='tooltip'
                       title='退出'><i class='icon-white icon-off'></i></a></li>
            </ul>
        </div>
    </div>
</header>

<section class='container-fluid pad20'>
    <section class='row-fluid'>
        <div class="sideBar left">
            <br/>
            <ul>
                <li class="active">
                    <figure style="color: black">
                        <i class="iconfont icon-zhuye"></i>
                        <a href="/cn/main" target="content">首页&nbsp;&nbsp;</a>
                    </figure>
                    <hr/>
                </li>

                <li>
                    <figure>
                        <i class='iconfont1 icon-icon-test'></i>
                        <a href="/cn/user" target="content">用戶&nbsp;&nbsp;
                        </a>
                    </figure>
                    <hr/>
                </li>

                <li>
                    <figure>
                        <i class="iconfont2 icon-shangpinfenlei"></i>
                        <a href="/cn/food_first_category" target="content">
                            &nbsp;商品分类&nbsp;&nbsp;
                        </a>

                    </figure>
                    <hr/>
                </li>

                <li>
                    <figure>
                        <i class="iconfont3 icon-shangpin"></i>
                        <a href="pages/food.html" target="content">商品&nbsp;&nbsp;

                        </a>
                    </figure>
                    <hr/>
                </li>
                <li id="preferential">
                    <figure>
                        <i class="iconfont4 icon-tubiaozhizuomoban"></i>
                        <a href="pages/preferential.html" target="content">
                            </i>满减优惠
                        </a>
                    </figure>
                    <hr/>
                </li>
                <li>
                    <figure>
                        <i class="iconfont5 icon-icon-tests"></i>
                        <a href="pages/food_comment.html" target="content">商品评价&nbsp;&nbsp;

                        </a>
                    </figure>
                    <hr/>
                </li>


                <li>
                    <figure>
                        <i class="iconfont6 icon-dingdanhuizong"></i>
                        <a href="pages/orderTotal.html" target="content"> 订单汇总&nbsp;
                        </a>
                    </figure>
                    <hr/>
                </li>

                <li class='dropper' id="orders" onclick="if($('#ChildMenu1').css('display')=='none'){
                    $('#ChildMenu1').css('display','block')
                        $('#jiantou').attr('class','iconfont22 icon-jiantouxia')
}else{
                    $('#ChildMenu1').css('display','none')
                    $('#jiantou').attr('class','iconfont21 icon-jiantouyou')

}"
                    }>
                    <figure>
                        <i class='iconfont7 icon-dingdan'></i>
                        <span>订单&nbsp;</span>
                        <i class="iconfont21 icon-jiantouyou" id="jiantou"></i>
                        <%--<i class="iconfont22 icon-jiantouxia"></i>--%>
                    </figure>
                    <hr/>
                    <ul class='subSide' id="ChildMenu1">
                        <li><a href="pages/order_success.html" target="content"><i
                                class='iconfont8 icon-chenggong-copy' style="color: black"></i>&nbsp;已成功</a>
                            <hr/>
                        </li>
                        <li><a href="pages/order_wait_release.html" target="content"><i
                                class='iconfont9 icon-daifahuo' style="color: black"></i>&nbsp;待发货</a>
                            <hr/>
                        </li>
                        <li><a href="pages/order_deliver.html" target="content"><i
                                class='iconfont10 icon-fahuo' style="color: black"></i>&nbsp;配送中</a>
                            <hr/>
                        </li>
                        <li><a href="pages/order_refund.html" target="content"><i
                                class='iconfont11 icon-tuikuan' style="color:black;"></i>&nbsp;退款中</a>
                            <hr/>
                        </li>
                        <li id="valideOrder"><a href="pages/order_invalide.html" target="content"><i
                                class='iconfont12 icon-sheweizanhuanwuxiao' style="color: black"></i>&nbsp;无效订单</a>
                            <hr/>
                        </li>
                    </ul>
                </li>

                <li>
                    <figure>
                        <a href="pages/news.html" target="content"> <i
                                class='iconfont13 icon-caiyixiu092206' style="color: black"></i> 主页图片&nbsp;&nbsp;
                        </a>
                    </figure>
                    <hr/>
                </li>
                <li>
                    <figure>
                        <a href="pages/push.html" target="content"> <i
                                class='iconfont14 icon-xiaoxituisong' style="color: black"></i> 消息推送&nbsp;&nbsp;
                        </a>
                    </figure>
                    <hr/>
                </li>

                <li id="li-campus-admin">
                    <figure>
                        <a href="pages/campus_admin.html" target="content">
                            <i class="iconfont15 icon-guanliyuanzhanghaoshezhi" style="color: black"></i>
                            账号管理
                        </a>
                    </figure>
                    <hr/>
                </li>
                <li id="li-campus">
                    <figure>
                        <a href="pages/campus.html" target="content">
                            <i class="iconfont16 icon-xiaoquguanli" style="color: black"></i>
                            校区管理&nbsp;&nbsp;
                        </a>
                    </figure>
                    <hr/>
                </li>
                <li id="hotsearch">
                    <figure>
                        <a href="pages/hotsearch.html" id="hotsearchs" target="content"><i
                                class='iconfont17 icon-sousuo' style="color:#000;"></i>搜索标签 </a>
                    </figure>
                    <hr/>
                </li>
                <li>
                <li id="closeStore">
                    <figure>
                        <a href="pages/close.html" target="content">
                            <i class="iconfont18 icon-guanbidianpu" style="color: black"></i>一键关店
                        </a>
                    </figure>
                    <hr/>
                </li>
                <!-- <li><figure>
                        <a href="pages/help.html" target="content"><i
                            class='icon-question-sign'></i> 帮助 </a>
                    </figure><hr/></li>
                <li> -->
                <li>
                    <figure>
                        <a href="pages/feedback.html" target="content"><i
                                class='iconfont19 icon-yonghufankui' style="color: black"></i> 用户反馈 </a>
                    </figure>
                    <hr/>
                </li>
                </li>
                <li>
                    <figure>
                        <a href="pages/modifypassword.html" target="content"><i
                                class='iconfont20 icon-jjshmima' style="color: black"></i> 修改密码 </a>
                    </figure>
                    <hr/>
                </li>
                </li>
            </ul>

        </div>
        <div class='right' style="width:1050px;border-left:1px solid #eee;">
            <iframe id="content" name="content" src="/cn/main"
                    style="height:720px;width:1100px" scroling="yes" frameborder="0"
                    border="0" marginwidth="0" marginheight="0"></iframe>
        </div>

    </section>
</section>
</body>
</html>

