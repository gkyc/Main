<%--
  Created by IntelliJ IDEA.
  User: fitz
  Date: 2019/2/28
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>YC-高考志愿辅导</title>

    <!-- Favicon -->
    <link rel="icon" href="img/YC-title.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="js/echarts.min.js"></script>


    <script>
        $(function () {
            $('#university_list a').click(function () {
                var names = []; // 高校名数组
                var imgs = [];  // 高校图片数组
                var locs = [];  // 高校所在地数组
                var feats = []; // 高校特色数组
                var cates = []; // 高校类型数组
                var nets = [];  // 高校网址数组
                var edus = [];  // 高校性质数组
                var lishu = []; // 高校隶属数组

                $.ajax({
                    type: "get",
                    url: "select_sh",
                    data: {
                        loc: $('#university-loc a.on').text(),   // 高校所在地
                        cate: $('#university-cate a.on').text(),   // 高校类型
                        feat: $('#university-feat a.on').text(),    // 高校特色
                        edu: $('#university-edu a.on').text()       // 学历层次
                    },
                    dataType: "json",
                    success: function (result) {
                        if (result) { // 取回数据
                            for (var i = 0; i < result.length; i++) {
                                names.push(result[i].schoolName)
                                imgs.push(result[i].schoolImg);
                                locs.push(result[i].schoolLocation);
                                feats.push(result[i].schoolTese);
                                cates.push(result[i].schoolLeixing);
                                nets.push(result[i].schoolNet);
                                edus.push(result[i].schoolXingzhi);
                                lishu.push(result[i].schoolLishu);
                            }
                            $(this).siblings('a').removeClass('on');    // 删除其他兄弟元素的选中效果
                            $(this).addClass('on');
                        }
                    },
                    error: function (errorMsg) {
                        // 请求失败时执行该函数
                        alert("请求数据失败")
                    }
                });
            });
        });
    </script>
<%--根据条件查询大学--%>

    <style>
        select{
            height: 40px;
            width: 240px;
            margin-left: 30px;
            margin-right: 30px;
            border-radius: 5px;
            text-align: center;
            text-align-last: center;
        }
    </style>
</head>

<body>
    <!-- ##### Preloader ##### -->
    <div id="preloader">
        <i class="circle-preloader"></i>
    </div>

    <!-- ##### Header Area Start #####  -->
    <header class="header-area">
        <!-- Top Header Area -->
        <div class="top-header">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-12 h-100">
                        <div class="header-content h-100 d-flex align-items-center justify-content-between">
                            <div class="academy-logo">
                                <a href="index.jsp"><img src="img/YC-logo.png" alt=""></a>
                            </div>
                            <div class="login-content">
                                <a href="#">注册 / 登陆</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navbar Area -->
        <div class="academy-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="academyNav">

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="index.jsp">主页</a></li>
                                    <li><a href="#">导航</a>
                                        <ul class="dropdown">
                                            <li><a href="index.jsp">主页</a></li>
                                            <li><a href="">预查</a></li>
                                            <li><a href="">预测</a></li>
                                            <li><a href="">预策</a></li>
                                            <li><a href="">文章</a></li>
                                            <li><a href="">关于</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">功能</a>
                                        <div class="megamenu">
                                            <ul class="single-mega cn-col-4">
                                                <li><a href="yucha.jsp" style="font-size:18px">预查</a></li>
                                                <br>
                                                <li><a class="YC-Main-a" href="#">这里有</a></li>
                                                <li><a class="YC-Main-a" href="#">我国各高校</a></li>
                                                <li><a class="YC-Main-a" href="#">近6年</a></li>
                                                <li><a class="YC-Main-a" href="#">详细录取分数</a></li>
                                            </ul>
                                            <ul class="single-mega cn-col-4">
                                                <li><a href="yuce.jsp" style="font-size:18px">预测</a></li>
                                                <br>
                                                <li><a class="YC-Main-a" href="#">这里有</a></li>
                                                <li><a class="YC-Main-a" href="#">你想去、向往的</a></li>
                                                <li><a class="YC-Main-a" href="#">各大学</a></li>
                                                <li><a class="YC-Main-a" href="#">录取你的可能性</a></li>
                                            </ul>
                                            <ul class="single-mega cn-col-4">
                                                <li><a href="yucehua.jsp" style="font-size:18px">预策</a></li>
                                                <br>
                                                <li><a class="YC-Main-a" href="#">这里有</a></li>
                                                <li><a class="YC-Main-a" href="#">你满意、合适的</a></li>
                                                <li><a class="YC-Main-a" href="#">各大学、专业</a></li>
                                                <li><a class="YC-Main-a"href="#">现在及未来的可能性</a></li>
                                            </ul>
                                            <div class="single-mega cn-col-4">
                                                <img src="img/Main-dh.jpg" alt="">
                                            </div>
                                        </div>
                                    </li>
                                    <li><a href="">文章</a></li>
                                    <li><a href="">关于</a></li>
                                    <li><a href="">个人信息</a></li>
                                </ul>
                            </div>
                            <!-- Nav End -->
                        </div>

                        <!-- Calling Info -->
                        <div class="calling-info">
                            <div class="call-center">
                                <a href="#"><i class="icon-telephone-2"></i> <span>(+86) 156 8604 2706</span></a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <h2>预查-查古知今</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### University Select Area Start ##### -->
    <div class="university-select" style="margin-top: 100px">
        <div class="container">
            <div class="section-heading text-center mx-auto wow fadeInUp" data-wow-delay="300ms" >
                <span>YC</span>
                <h3>高考院校库</h3>
            </div>
        </div>
        <div id = "university_list" class="menufix container wow fadeInUp" data-wow-delay="400ms">
            <p id="university-loc">
                <strong  style="font-size: medium">高校所在地：</strong>
                <a class="on" href="">全部</a>
                <a href="#">北京</a>
                <a href="#">天津</a>
                <a href="#">辽宁</a>
                <a href="#">吉林</a>
                <a href="#">黑龙江</a>
                <a href="#">上海</a>
                <a href="#">江苏</a>
                <a href="#">浙江</a>
                <a href="#">安徽</a>
                <a href="#">福建</a>
                <a href="#">山东</a>
                <a href="#">湖北</a>
                <a href="#">湖南</a>
                <a href="#">广东</a>
                <a href="#">重庆</a>
                <a href="#">四川</a>
                <a href="#">陕西</a>
                <a href="#">甘肃</a>
                <a href="#">河北</a>
                <a href="#">山西</a>
                <a href="#">内蒙古</a>
                <a href="#">河南</a>
                <a href="#">海南</a>
                <a href="#">广西</a>
                <a href="#">贵州</a>
                <a href="#">云南</a>
                <a href="#">西藏</a>
                <a href="#">青海</a>
                <a href="#">宁夏</a>
                <a href="#">新疆</a>
                <a href="#">江西</a>
            </p>
            <p id="university-cate">
                <strong  style="font-size: medium">高校类型：</strong>
                <a class="on" href="">全部</a>
                <a href="#">综合</a>
                <a href="#">工科</a>
                <a href="#">农业</a>
                <a href="#">师范</a>
                <a href="#">民族</a>
                <a href="#">林业</a>
                <a href="#">医药</a>
                <a href="#">语言</a>
                <a href="#">财经</a>
                <a href="#">体育</a>
                <a href="#">艺术</a>
                <a href="#">政法</a>
                <a href="#">军事</a>
            </p>
            <p id="university-feat">
                <strong style="font-size: medium">高校特色：</strong>
                <a class="on" href="">全部</a>
                <a href="#">211高校</a>
                <a href="#">985高校</a>
            </p>
            <p id="university-edu">
                <strong style="font-size: medium">学历层次：</strong>
                <a class="on" href="">全部</a>
                <a href="#">本科</a>
                <a href="#">高职专科</a>
                <a href="#">独立学院</a>
                <a href="#">其他</a>
            </p>
        </div>

        <%--university list--%>
        <div class="university-list container wow fadeInUp" data-wow-delay="500ms">
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>
                    <a href="http://college.gaokao.com/school/1/" target="_blank">
                        <img src="http://college.gaokao.com/style/college/images/icon/1.png" onerror="this.src='http://college.gaokao.com/style/college/images/icon_default.png'" width="63" height="63" alt="北京大学">
                    </a>
                    <strong title="北京大学" class="blue">
                        <a href="http://college.gaokao.com/school/1/" target="_blank">北京大学
                        </a>
                    </strong>
                </dt>
                <dd>
                    <div class="right">
                        <p class="topMargin20"><a class="btn_gary" href="http://college.gaokao.com/school/1/" target="_blank">进入主页</a></p>
                    </div>
                    <ul>
                        <li>高校所在地：北京</li>
                        <li>院校特色：<span class="c211 rm5">211</span><span class="c985">985</span></li>
                        <li>高校类型：综合</li>
                        <li>高校隶属：教育部</li>
                        <li>高校性质：本科</li>
                        <li>学校网址：www.pku.edu.cn</li>
                    </ul>
                </dd>
            </dl>

        </div>
    </div>
    <!-- ##### University Select Area End ##### -->

    <%--Paging Area--%>
    <% request.setAttribute("upage",1);%>
    <div>
        <ul class="paging container">
            <li>
                首页
            </li>
            <li>
                上一页
            </li>
            <li>
                下一页
            </li>

                当前第 ${upage} 页
        </ul>
    </div>


    <!-- ##### Partner Area Start ##### -->
    <div class="partner-area section-padding-0-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="partners-logo d-flex align-items-center justify-content-between flex-wrap">
                        <a href="#"><img src="img/Sponsor1.png" alt=""></a>
                        <a href="#"><img src="img/Sponsor2.png" alt=""></a>
                        <a href="#"><img src="img/Sponsor3.png" alt=""></a>
                        <a href="#"><img src="img/Sponsor4.png" alt=""></a>
                        <a href="#"><img src="img/Sponsor5.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Partner Area End ##### -->

    <!-- ##### CTA Area Start ##### -->
    <div class="call-to-action-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cta-content d-flex align-items-center justify-content-between flex-wrap">
                        <h3>Do you want to enrole at our Academy? Get in touch!</h3>
                        <a href="#" class="btn academy-btn">See More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### CTA Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="main-footer-area section-padding-100-0">
            <div class="container">
                <div class="row">
                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <a href="#"><img src="img/YC-logo2.png" alt=""></a>
                            </div>
                            <p>有者，事竟成<br>破釜沉舟，百二秦关终归楚<br>苦心人，天不负<br>卧薪尝胆，三千越甲可吞吴</p>
                            <div class="footer-social-info">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <h6>相关 链接</h6>
                            </div>
                            <nav>
                                <ul class="useful-links"style="float:left">
                                    <li><a href="index.jsp">主页</a></li>
                                    <li><a href="#" style="float:left">预查</a><a href="#"style="float:left">预测</a><a href="#"style="float:left">预策</a></li>
                                    <li><a href="#">辅导文章</a></li>
                                    <li><a href="#">关于我们</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <h6>画廊</h6>
                            </div>
                            <div class="gallery-list d-flex justify-content-between flex-wrap">
                                <a href="img/bg-img/gallery1.jpg" class="gallery-img" title="Gallery Image 1"><img src="img/bg-img/gallery1.jpg" alt=""></a>
                                <a href="img/bg-img/gallery2.jpg" class="gallery-img" title="Gallery Image 2"><img src="img/bg-img/gallery2.jpg" alt=""></a>
                                <a href="img/bg-img/gallery3.jpg" class="gallery-img" title="Gallery Image 3"><img src="img/bg-img/gallery3.jpg" alt=""></a>
                                <a href="img/bg-img/gallery4.jpg" class="gallery-img" title="Gallery Image 4"><img src="img/bg-img/gallery4.jpg" alt=""></a>
                                <a href="img/bg-img/gallery5.jpg" class="gallery-img" title="Gallery Image 5"><img src="img/bg-img/gallery5.jpg" alt=""></a>
                                <a href="img/bg-img/gallery6.jpg" class="gallery-img" title="Gallery Image 6"><img src="img/bg-img/gallery6.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <h6>联系方式</h6>
                            </div>
                            <div class="single-contact d-flex mb-30">
                                <i class="icon-placeholder"></i>
                                <p>西安交通大学</p>
                            </div>
                            <div class="single-contact d-flex mb-30">
                                <i class="icon-telephone-1"></i>
                                <p>Main: 156 8604 2706 <br>Office: 159 9179 9939</p>
                            </div>
                            <div class="single-contact d-flex">
                                <i class="icon-contract"></i>
                                <p>GK_Counsel@businees.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> Colorlib  All rights reserved | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

