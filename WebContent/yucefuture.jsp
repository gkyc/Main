<%--
  Created by IntelliJ IDEA.
  User: fitz
  Date: 2019/3/5
  Time: 11:37
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

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <!-- Buttons 库的核心文件 -->
    <link rel="stylesheet" href="css/buttons.css">

    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/prefixfree.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/echarts.min.js"></script>

    <script>
        var provinces=["北京市","天津市","河北省","山西省","内蒙古自治区","辽宁省"
            ,"吉林省","黑龙江省","上海市","江苏省","浙江省","安徽省","福建省","江西省","山东省"
            ,"河南省","湖北省","湖南省","广东省","广西壮族自治区","海南省","四川省","贵州省"
            ,"云南省","重庆市","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区"
            ,"新疆维吾尔自治区"];

        var subjects = ["农学","历史学","哲学","工学","教育学","文学","法学","理学","管理学","经济学","艺术学"];

        $(function(){
            // 加载省份数据
            for( let i = 0; i < provinces.length; i++ ) {
                $("#province").append("<option value='"+provinces[i]+"'>"+provinces[i]+"</option>");
                $("#toProvince").append("<option value='"+provinces[i]+"'>"+provinces[i]+"</option>");
            }
            // 加载专业大类数据
            for( let i = 0; i < subjects.length; i++ ) {
                $("#major").append("<option value='"+subjects[i]+"'>"+subjects[i]+"</option>");
            }
        });
    </script>

    <script>
        function checkScore() {
            var score = $('#score_input').val();
            // console.log(score);
            if( score !== '') {
                $('#score_input').removeClass('borderRed'); // 移除class，使原来的红色边框变成正常颜色
                $('#score_null').hide();    // 不显示错误提示信息
                return true;
            }else {
                $('#score_input').addClass('borderRed');   // 添加class，使输入框变红
                $('#score_null').show();    // 显示错误提示信息
                return false;
            }
        }

        function showPlan(){
            var province = $('#province').val();
            var toProvince = $('#toProvince').val();    // 多选框，取回数组变量
            var subject = $('#subject').val();
            var major = $('#major').val();              // 多选框，取回数组变量
            var score = $('#score_input').val();

            console.log(JSON.stringify(toProvince));
            // 验证是否选择省份和文理科
            if(province === '' || subject === '' || score === '' || toProvince === '' || major === '') {
                alert('请填写必要信息！');
            }
            else {
                $('#plan_area').hide();
                $('#loading').show();


                $('#plan_proving_text').html("");
                $('#plan_major_text').html("");
                if( subject === "理科") {
                    $('#plan_proving_text').append("<p>您来自"+province+"，是一名思维缜密，热爱探索的理科生，您的高考分数为：" +
                        "<strong>"+score+"</strong>，不论高与低，祝贺你，通过了高考这一人生意义非凡的阶段！</P><br>");
                } else {
                    $('#plan_proving_text').append("<p>您来自"+province+"省，是一名腹有诗书气自华的文科生，您的高考分数为：" +
                        "<strong>"+score+"</strong>，不论高与低，祝贺你，通过了高考这一人生意义非凡的阶段！</P><br>");
                }
                if(toProvince.indexOf(province) === -1) {    // 想去省份包含生源地省份
                    $('#plan_proving_text').append("<P>你向往外地的省份，正所谓“读万卷书，行万里路”，根据你选择的省份，我们向你推荐以下高校:</P><br>")
                } else {
                    $('#plan_proving_text').append("<P>你想留在本省，离不开那一方水土，正所谓“胡马依北风，越鸟朝南枝”，根据你选择的省份，我们向你推荐以下高校:</P><br>")
                }
                $('#plan_major_text').append("<p>此外，根据你选择的感兴趣学科，我们向您推荐的高校有：</P>")
                // 将数据传送后后端并取回结果
                $.ajax({
                        type: "get",
                        url: "recommend",
                        traditional: true,  // 防止深度序列化
                        data: {
                            province: province,
                            subject: subject,
                            score: score,
                            toProvince: toProvince,
                            major: major
                        },
                        dataType: "json",
                        success: function (result) {
                            if(result) {
                                var schoolName = [];
                                var proRank = [];
                                var beAdmit = [];
                                var conRank = [];
                                for( let i = 0; i < result.length; i++ ) {
                                    schoolName.push(result[i].schName);
                                    proRank.push(result[i].proRank);
                                    beAdmit.push(result[i].beAdmit);
                                    conRank.push(result[i].conRank);
                                }
                                var pChart = echarts.init(document.getElementById("plan_province"));
                                pChart.setOption({
                                    tooltip : {
                                        trigger: 'axis',
                                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                        }
                                    },
                                    legend: {
                                        data: ['省排名分值', '被录取概率分值','全国排名分值']
                                    },
                                    grid: {
                                        left: '3%',
                                        right: '4%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    xAxis:  {
                                        type: 'value'
                                    },
                                    yAxis: {
                                        type: 'category',
                                        data: schoolName
                                    },
                                    series: [
                                        {
                                            name: '省排名分值',
                                            type: 'bar',
                                            stack: '总量',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'insideRight'
                                                }
                                            },
                                            data: proRank
                                        },
                                        {
                                            name: '被录取概率分值',
                                            type: 'bar',
                                            stack: '总量',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'insideRight'
                                                }
                                            },
                                            data: beAdmit
                                        },
                                        {
                                            name: '全国排名分值',
                                            type: 'bar',
                                            stack: '总量',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'insideRight'
                                                }
                                            },
                                            data: conRank
                                        }]
                                });
                                setTimeout(function (){
                                    $('#loading').hide();
                                    $('#plan_area').show();
                                    document.getElementById('pay').style.display='';
                                },3000);
                            }
                        },
                        error: function (errorMsg) {
                            setTimeout(function (){
                                $('#loading').hide();
                                alert("请求数据失败，请稍后再试~");
                            },3000);
                        }
                });
            }
        }
    </script>

    <style>
        select {
            box-shadow: 0px 0px 3px #71dd8a inset;
            height: 30px;
            width: 260px;
            margin-left: 30px;
            margin-right: 50px;
            border-radius: 5px;
            text-align: center;
            text-align-last: center;
        }
        .borderRed{border: 1px solid red;}
        #plan_area p{
            font-size: 18px;
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
            <h2>预策-策划未来</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- #### Predict Probability Start Area #### -->
    <div id="wrapper"  class="mt-100">
        <div class="container">
            <div id="condition_form" class="mb-100" style="margin-top: 125px">
                <form>
                    <select class="mb-15 selectpicker mr-50" id="province" title="请选择您所在的省份" >
                    </select>

                    <select class="mb-15 selectpicker mr-50" id="subject" title="请选择文理科" value="">
                        <option>文科</option>
                        <option>理科</option>
                    </select>

                    <select id="toProvince" multiple class="mb-15 selectpicker mr-50" title="请选择您向往的省份" data-max-options="3">
                    </select>

                    <select id="major" multiple class="mb-15 selectpicker mr-50" title="请选择您感兴趣的专业类别" data-max-options="3">
                    </select>

                    <label for="score_input">请输入您的分数：</label>
                    <input class="ml-30" id="score_input" type="text" onblur="checkScore()" oninput="value=value.replace(/[^\d]/g,'')" maxlength="3" style=" height: 30px;width: 100px; border-radius: 5px;box-shadow: 0px 0px 3px #71dd8a inset; vertical-align:middle;text-align: left;" >
                    <span id="score_null" style="color:red; display: none">不可为空</span>

                    <button type="button" class="button button-action button-pill" onclick="showPlan()">
                        <img src="img/query-white.png"/>
                    </button>

                </form>
            </div>

            <div id="loading" style="width: 100%; height: 400px; padding-top: 100px; display: none">
                <div class='loader loader--circularSquare' style="margin: auto;"></div>
            </div>

            <div id="plan_area" style="display: none;width: 100%">
                <div id="plan_proving_text"></div>
                <div id="plan_province" style="width: 800px; height: 600px; margin: auto"></div>
                <div id="plan_major_text"></div>
                <div id="plan_major"></div>
            </div>

            <div id="pay" class="container mt-100 mb-100" style="display: none">
                <span style="margin-left: 30px; font-size: 20px;font-weight: 600;">对您有帮助？为了网页功能的继续完善，请支持我们</span>
                <a href="./donate.jsp" target="_blank" class="button button-action button-pill"><span style="font-size: 18px">￥$我要小额赞助，鼓励作者实现更多功能</span></a>
            </div>
        </div>
    </div>

    <!-- ##### Partner Area Start ##### -->
    <div class="partner-area section-padding-0-100 mt-100">
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
        <div id="main-footer-area" class="main-footer-area section-padding-100-0">
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
                                    <li><a href="index.jsp#YC-articles">辅导文章</a></li>
                                    <li><a href="about-us.jsp">关于我们</a></li>
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
    <script src="js/bootstrap/bootstrap-select.min.js"></script>
    <script src="js/bootstrap/defaults-zh_CN.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <script type="text/javascript" color="34,139,34" opacity='0.8' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
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
