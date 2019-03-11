<%--
  Created by IntelliJ IDEA.
  User: fitz
  Date: 2019/2/27
  Time: 9:04
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
    <!-- Buttons 库的核心文件 -->
    <link rel="stylesheet" href="css/buttons.css">

    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="js/echarts.min.js"></script>

    <script>
        var provinces=["北京市","天津市","河北省","山西省","内蒙古自治区","辽宁省"
            ,"吉林省","黑龙江省","上海市","江苏省","浙江省","安徽省","福建省","江西省","山东省"
            ,"河南省","湖北省","湖南省","广东省","广西壮族自治区","海南省","四川省","贵州省"
            ,"云南省","重庆市","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区"
            ,"新疆维吾尔自治区"];

        // 加载省份数据
        $(function(){
            for( var i = 0; i < provinces.length; i++ ) {
                $("#province").append("<option value='" + provinces[i] + "'>"+provinces[i]+"</option>");
            }
        });

        // 获取universities.jsp页面传来的参数
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = {};
            if ( url.indexOf("?") !== -1 ) {
                var str = url.substr(1);
                var strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = decodeURIComponent(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }



    </script>



    <%--点击查询按钮后加载数据，显示echarts组件--%>
    <script>

        function showdata() {
            document.getElementById("echart").style.display="";

            // 基于准备好的Dom, 初始化echart实例
            var myChart = echarts.init(document.getElementById('echart'));
            // 显示标题，图例和空的坐标轴
            myChart.setOption({
                title: {
                    text: '往年录取分数线'
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                xAxis: {
                    data: []
                },
                yAxis: {
                    scale: true
                },
                series: [{
                    name: '理科',
                    type: 'line',
                    data: []
                }]
            });
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画

            var years=[];    //年份数组（实际用来盛放X轴坐标值）
            var scores=[];    //分数数组（实际用来盛放Y坐标值）
            var param = GetRequest();   // 获取页面url后的参数
            var university = param['university'];
            var province = $('#province').val();
            var subject = $('#subject').val();
            // 验证是否选择省份和文理科
            if(province.substring(0,2) === '--' || subject.substring(0,2) === '--') {
                alert('请选择生源地省份和文理科！')
            }
            else{

                $.ajax({
                    type : "post",
                    async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                    url : "showdata",    //请求发送到showdataServlet处
                    data : {
                        province: province,
                        subject: subject,
                        university: university,
                    },
                    dataType : "json",        //返回数据形式为json
                    success : function(result) {
                        //请求成功时执行该函数内容，result即为服务器返回的json对象
                        if (result) {
                            for(var i=0;i<result.length;i++){
                                years.push(result[i].year);    //挨个取出year别并填入年份数组
                            }
                            for(var i=0;i<result.length;i++){
                                scores.push(result[i].lScore);    //挨个取出lScore并填入score数组
                            }
                            myChart.hideLoading();    //隐藏加载动画
                            myChart.setOption({        //加载数据图表
                                xAxis: {
                                    data: years
                                },
                                series: [{
                                    // 根据名字对应到相应的系列
                                    name: '理科',
                                    data: scores
                                }]
                            });
                        }

                    },
                    error : function(errorMsg) {
                        //请求失败时执行该函数
                        alert("图表请求数据失败!");
                        myChart.hideLoading();
                    }
                })

            }
        }
    </script>

    <style>
        select{
            box-shadow: 0px 0px 3px #71dd8a inset;
            height: 38px;
            width: 320px;
            margin-left: 100px;
            margin-right: 30px;
            border-radius: 5px;
            text-align: center;
            text-align-last: center;
        }
    </style>
</head>

<body onload="YCcheck()">
<!-- ##### Preloader ##### -->
<div id="preloader">
    <i class="circle-preloader"></i>
</div>

<!-- ##### Header Area Start ##### -->
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
                            <%
                                String username = request.getParameter("username");
                                String username2 = (String)session.getAttribute("username");
                                if(username2!=null){
                            %>
                            <div>
                                <a href="infor.jsp" style="margin-right:20px">
                                    <img alt="" src="img/Main-face.jpg" style="width:60px;height:60px;border-radius:50%;margin-right:10px">${usernc}
                                </a>
                                <a href="logout">登出</a>
                            </div>
                            <%
                            }else{
                                if(username!=null){
                                    session.setAttribute("username", username);
                            %>
                            <div>
                                <a href="infor.jsp" style="margin-right:20px">
                                    <img alt="" src="img/Main-face.jpg" style="width:60px;height:60px;border-radius:50%;margin-right:10px">${usernc}
                                </a>
                                <a href="logout">登出</a>
                            </div>
                            <%
                            }else{
                            %>
                            <a href="login.jsp">注册 / 登录</a>
                            <%
                                    }
                                }
                            %>
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
                                        <li><a href="./universities.jsp">预查</a></li>
                                        <li><a href="./yucepro.jsp" id="YC-check-ce1">预测</a></li>
                                        <li><a href="./yucefuture.jsp" id="YC-check-ceh1">预策</a></li>
                                        <li><a href="index.jsp#YC-articles">文章</a></li>
                                        <li><a href="about-us.jsp">关于</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">功能</a>
                                    <div class="megamenu">
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="./universities.jsp" style="font-size:18px">预查</a></li>
                                            <br>
                                            <li><a class="YC-Main-a" href="#">这里有</a></li>
                                            <li><a class="YC-Main-a" href="#">我国各高校</a></li>
                                            <li><a class="YC-Main-a" href="#">近6年</a></li>
                                            <li><a class="YC-Main-a" href="#">详细录取分数</a></li>
                                        </ul>
                                        <ul class="single-mega cn-col-4">
                                            <li><a id="YC-check-ce2" href="./yucepro.jsp" style="font-size:18px">预测</a></li>
                                            <br>
                                            <li><a class="YC-Main-a" href="#">这里有</a></li>
                                            <li><a class="YC-Main-a" href="#">你想去、向往的</a></li>
                                            <li><a class="YC-Main-a" href="#">各大学</a></li>
                                            <li><a class="YC-Main-a" href="#">录取你的可能性</a></li>
                                        </ul>
                                        <ul class="single-mega cn-col-4">
                                            <li><a id="YC-check-ceh2" href="./yucefuture.jsp" style="font-size:18px">预策</a></li>
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
                                <li><a href="index.jsp#YC-articles">文章</a></li>
                                <li><a href="about-us.jsp">关于</a></li>
                                <li><a href="infor.jsp" id="YC-check-infor">个人信息</a></li>
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

    <!-- ##### Data Query Area Start ##### -->
    <div class="data-query" style="margin-top: 150px">
        <div class="container">
            <div class="section-heading text-center mx-auto wow fadeInUp" data-wow-delay="300ms" >
                <span>The Best</span>
                <h3>往年高考数据</h3>
            </div>

            <%--条件查询和数据展示area--%>
            <div id="f-select-university" class="text-center mx-auto mb-200" >
                <%--选择待查询省份,和文理科 提交到showDataServlet，返回json数据--%>
                <select id="province">
                    <option>---请选择---</option>
                </select>
                <select id="subject">
                    <option>---请选择---</option>
                    <option>文科</option>
                    <option>理科</option>
                </select>
                <button type="button" class="button button-action button-pill" onclick="showdata() ">
                    <img src="img/query-white.png"/>
                </button>

                <div id="echart" style="height: 500px; width: 80%; display: none" class="text-center mx-auto mt-50">

                </div>

            </div>
        </div>
    </div>
    <!-- ##### Data Query Area End ##### -->



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
                            <p>有志者，事竟成<br>破釜沉舟，百二秦关终归楚<br>苦心人，天不负<br>卧薪尝胆，三千越甲可吞吴</p>
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
                                    <li><a href="./universities.jsp" style="float:left" >预查&nbsp;&nbsp;&nbsp;</a><a href="./yucepro.jsp" style="float:left" id="YC-check-ce3">预测&nbsp;&nbsp;&nbsp;</a><a href="./yucefuture.jsp" style="float:left" id="YC-check-ceh3">预策</a></li>
                                    <li><a href="./index.jsp#YC-articles">辅导文章</a></li>
                                    <li><a href="./about-us.jsp">关于我们</a></li>
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
                                <a href="img/bg-img/gallery2.jpg" class="gallery-img" title="Gallery Image 2" style="float:left"><img src="img/bg-img/gallery2.jpg" alt=""></a>
                                <a href="img/bg-img/gallery3.jpg" class="gallery-img" title="Gallery Image 3" style="float:left;margin-right:33%"><img src="img/bg-img/gallery3.jpg" alt=""></a>
                                <a href="img/bg-img/gallery4.jpg" class="gallery-img" title="Gallery Image 4" style="float:left"><img src="img/bg-img/gallery4.jpg" alt=""></a>
                                <a href="img/bg-img/gallery6.jpg" class="gallery-img" title="Gallery Image 6" style="float:left;margin-right:33%"><img src="img/bg-img/gallery6.jpg" alt=""></a>
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
                                <p>咸宁西路28号西安交通大学</p>
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
    </footer>
    <!-- ##### Footer Area Start ##### -->


    <!-- ##### All Javascript Script ##### -->
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>
    <script>
        function YCcheck(){
            var ce1 = document.getElementById("YC-check-ce1");
            var ce2 = document.getElementById("YC-check-ce2");
            var ce3 = document.getElementById("YC-check-ce3");
            var ceh1 = document.getElementById("YC-check-ceh1");
            var ceh2 = document.getElementById("YC-check-ceh2");
            var ceh3 = document.getElementById("YC-check-ceh3");
            var infor = document.getElementById("YC-check-infor");
            var u = <%=username2 %>;
            if(u!=null){
                ce1.href="./yucepro.jsp";ce2.href="./yucepro.jsp";ce3.href="./yucepro.jsp";
                ceh1.href="./yucefuture.jsp";ceh2.href="./yucefuture.jsp";ceh3.href="./yucefuture.jsp";
                infor.href="infor.jsp";
            }
            else{
                ce1.href="login.jsp";ce2.href="login.jsp";ce3.href="login.jsp";
                ceh1.href="login.jsp";ceh2.href="login.jsp";ceh3.href="login.jsp";
                infor.href="login.jsp";
            }
        }
    </script>
</html>
