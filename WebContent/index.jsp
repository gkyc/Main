<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
                                            <li><a href="#YC-articles">文章</a></li>
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
                                    <li><a href="#YC-articles">文章</a></li>
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

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(img/Main-bg-1.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="hero-slides-content">
                                <h4 data-animation="fadeInUp" data-delay="100ms">你需要的所有录取资料</h4>
                                <h2 data-animation="fadeInUp" data-delay="400ms">欢迎来到<br>高考志愿辅导</h2>
                                <a href="#YC-articles" class="btn academy-btn" data-animation="fadeInUp" data-delay="700ms">查看更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(img/Main-bg-2.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="hero-slides-content">
                                <h4 data-animation="fadeInUp" data-delay="100ms">你需要的所有录取资料</h4>
                                <h2 data-animation="fadeInUp" data-delay="400ms">欢迎来到<br>高考志愿辅导</h2>
                                <a href="#YC-articles" class="btn academy-btn" data-animation="fadeInUp" data-delay="700ms">查看更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(img/Main-bg-3.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="hero-slides-content">
                                <h4 data-animation="fadeInUp" data-delay="100ms">你需要的所有录取资料</h4>
                                <h2 data-animation="fadeInUp" data-delay="400ms">欢迎来到<br>高考志愿辅导</h2>
                                <a href="#YC-articles" class="btn academy-btn" data-animation="fadeInUp" data-delay="700ms">查看更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Top Feature Area Start ##### -->
    <div class="top-features-area wow fadeInUp" data-wow-delay="300ms">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="features-content">
                        <div class="row no-gutters">
                            <!-- Single Top Features -->
                            <button  id="YC-Main-cha" class="col-12 col-md-4"style="cursor:pointer;border:0;background:none">
                                <div class="single-top-features d-flex align-items-center justify-content-center">
                                    <i class="icon-agenda-1"></i>
                                    <a href="./universities.jsp"><h5>预查-查古识今</h5></a>
                                </div>
                            </button>
                            <!-- Single Top Features -->
                            <button id="YC-Main-ce" class="col-12 col-md-4 YC-check-ce" style="cursor:pointer;border:0;background:none">
                                <div class="single-top-features d-flex align-items-center justify-content-center">
                                    <i class="icon-assistance"></i>
                                    <a id="YC-check-ce4" href="./yucepro.jsp"><h5>预测-测估可能</h5></a>
                                </div>
                            </button>
                            <!-- Single Top Features -->
                            <button id="YC-Main-cehua" class="col-12 col-md-4 YC-check-ceh" style="cursor:pointer;border:0;background:none">
                                <div class="single-top-features d-flex align-items-center justify-content-center">
                                    <i class="icon-telephone-3"></i>
                                    <a id="YC-check-ceh4" href="./yucefuture.jsp"><h5>预策-策划未来</h5></a>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Top Feature Area End ##### -->

    <!-- ##### Course Area Part1 Start ##### -->
    <div class="academy-courses-area section-padding-100-0" id="YC-part-1">
        <div class="container">
            <div class="row">
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:300ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-js.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>查介绍</h4>
                            <p>在这里你可以查到近6年我国各高校详细的录取分数线及相关内容</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp"style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:400ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-md.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>查目的</h4>
                            <p>让你对往年的高校分数有所了解，从而对这次志愿有所把握</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp"style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:500ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-yq.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>查要求</h4>
                            <p>需要填写/选取年份、科类、学校、你所在省份等相关信息</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp"style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:600ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-sj.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>大数据</h4>
                            <p>我们有着庞大的数据，满足你的查找需求</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp"style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:700ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-pc.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>微偏差</h4>
                            <p>其中数据可能存在些许偏差，如有请告知我们</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:800ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-ks.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>可视化</h4>
                            <p>我们会将你所需要的信息以更好的方式展示与你</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Course Area Part1 End ##### -->
    
     <!-- ##### Course Area Part2 Start ##### -->
    <div class="academy-courses-area section-padding-100-0" id="YC-part-2" style="display:none">
        <div class="container">
            <div class="row">
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp"style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:300ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-js.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>测介绍</h4>
                            <p>在这里你可以获得各高校录取你的可能性</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:400ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-md.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>测目的</h4>
                            <p>让你对填报志愿有更清晰的选择方向</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:500ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-yq.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>测要求</h4>
                            <p>需要填写/选取你所在省份、分数、科类、学校等相关信息</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:600ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-sj.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>大数据</h4>
                            <p>我们有着准确的数据分析，给你辨别前方是非</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:700ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-pc.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>微偏差</h4>
                            <p>最终结果仅供参考，请别盲目相信</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:800ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-ks.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>可视化</h4>
                            <p>我们会将你所需要的信息以更好的方式展示与你</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Course Area Part2 End ##### -->
    
     <!-- ##### Course Area Part3 Start ##### -->
    <div class="academy-courses-area section-padding-100-0" id="YC-part-3" style="display:none">
        <div class="container">
            <div class="row">
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:300ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-js.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>策介绍</h4>
                            <p>在这里你可以获得我们为你推荐的道路方向</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:400ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-md.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>策目的</h4>
                            <p>让你对未来更明朗，为你推荐适合你的高校、专业</p> 
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:500ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-yq.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>策要求</h4>
                            <p>需要填写/选取你所在省份、分数、科类、喜好等相关信息</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:600ms;">
                       <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-sj.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>大数据</h4>
                            <p>我们有着明确的数据分析，为你指明前方道路</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->
                <div class="col-12 col-sm-6 col-lg-4 ">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:700ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-pc.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>微偏差</h4>
                            <p>最终结果仅供参考，请别盲目相信</p>
                        </div>
                    </div>
                </div>
                <!-- Single Course Area -->            
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-course-area d-flex align-items-center mb-100 wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;animation-duration:300ms;animation-delay:800ms;">
                        <div class="YC-Main-course-icon">
                          <div style="background:url(./img/YC-ks.png) no-repeat 50% 50%;width:100%;height:100% "></div>
                        </div>
                        <div class="course-content">
                            <h4>可视化</h4>
                            <p>我们会将你所需要的信息以更好的方式展示与你</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <!-- ##### Course Area Part3 End ##### -->
    
   
    
    <!-- ##### Top Popular Courses Area Start ##### -->
    <a name="YC-articles"></a>
    <div class="top-popular-courses-area section-padding-100-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto wow fadeInUp" data-wow-delay="300ms">
                        <span>精选</span>
                        <h3>辅 导 文 章</h3>
                    </div>
                </div>
            </div>
            <div class="row">
               
                <!-- Single Top Popular Course -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="400ms">
                        <div class="popular-course-content">
                            <h5>填报志愿技巧</h5>
                            <span>来自 王栗&nbsp;&nbsp;|&nbsp;&nbsp;2019-02-26</span>
                            <div class="course-ratings">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div>
                            <p>高考成绩出来后，我们该如何填报志愿呢?志愿填报是不好的，那高考就白考了啊!以下就是如何填报高考志愿的一些看法，供大家参考！</p>
                            <a href="article1.jsp" class="btn academy-btn btn-sm">查看更多</a>
                        </div>
                        <div class="popular-course-thumb bg-img" style="background-image: url(img/bg-img/pc-1.jpg);"></div>
                    </div>
                </div>
                
                <!-- Single Top Popular Course -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="500ms">
                        <div class="popular-course-content">
                            <h5>大学专业选择</h5>
                            <span>来自 Mr.wang&nbsp;&nbsp;|&nbsp;&nbsp;2019-02-13</span>
                            <div class="course-ratings">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div>
                            <p>各省陆续公布高考分数，几百万考生的成绩尘埃落定。下一步就要进入志愿填报环节。这一次的选择关系到未来三到四年甚至一生的人生走向</p>
                            <a href="article2.jsp" class="btn academy-btn btn-sm">查看更多</a>
                        </div>
                        <div class="popular-course-thumb bg-img" style="background-image: url(img/bg-img/pc-2.jpg);"></div>
                    </div>
                </div>
                
                <!-- Single Top Popular Course -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="600ms">
                        <div class="popular-course-content">
                            <h5>大学入学小贴士</h5>
                            <span>来自 lhotse&nbsp;&nbsp;|&nbsp;&nbsp;2019-02-19</span>
                            <div class="course-ratings">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div>
                            <p>当你上大学时，你的生活完全改变了。你突然完全独立了，有了很大的自由，有了一个全新的、充满机会的世界，但是也会迷茫找不到方向。</p>
                            <a href="article3.jsp" class="btn academy-btn btn-sm">查看更多</a>
                        </div>
                        <div class="popular-course-thumb bg-img" style="background-image: url(img/bg-img/pc-3.jpg);"></div>
                    </div>
                </div>
                
                <!-- Single Top Popular Course -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-popular-course d-flex align-items-center flex-wrap mb-30 wow fadeInUp" data-wow-delay="700ms">
                        <div class="popular-course-content">
                            <h5>高考提分技巧</h5>
                            <span>来自 王粟&nbsp;&nbsp;|&nbsp;&nbsp;2019-03-01</span>
                            <div class="course-ratings">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div>
                            <p>高考理综如何快速提分?物理重新回归课本，化学减少无谓失分，生物提高做题质量。高考理综审题要缜密、思维要仔细、书写要规范。</p>
                            <a href="article4.jsp" class="btn academy-btn btn-sm">查看更多</a>
                        </div>
                        <div class="popular-course-thumb bg-img" style="background-image: url(img/bg-img/pc-4.jpg);"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Top Popular Courses Area End ##### -->

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
                        <h3>&nbsp;想&nbsp;要&nbsp;了&nbsp;解&nbsp;更&nbsp;多&nbsp;高&nbsp;考&nbsp;志&nbsp;愿&nbsp;相&nbsp;关&nbsp;信&nbsp;息&nbsp;？&nbsp;快&nbsp;联&nbsp;系&nbsp;我&nbsp;们&nbsp;吧&nbsp;！</h3>
                        <a href="about-us.jsp" class="btn academy-btn">查看更多</a>
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
                                    <li><a href="#YC-articles">辅导文章</a></li>
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
	<script type="text/javascript">
	$("#YC-Main-cha").mouseenter(function(){
		$("#YC-part-1").show();
		$("#YC-part-2").hide();
		$("#YC-part-3").hide();
	});
	
	$("#YC-Main-ce").mouseenter(function(){
		$("#YC-part-2").show();
		$("#YC-part-1").hide();
		$("#YC-part-3").hide();
	});
	
	$("#YC-Main-cehua").mouseenter(function(){
		$("#YC-part-3").show();
		$("#YC-part-2").hide();
		$("#YC-part-1").hide();
	});
	
	
	
	function YCcheck(){
		var ce1 = document.getElementById("YC-check-ce1");
        var ce2 = document.getElementById("YC-check-ce2");
        var ce3 = document.getElementById("YC-check-ce3");
        var ce4 = document.getElementById("YC-check-ce4");
        var ceh1 = document.getElementById("YC-check-ceh1");
		var ceh2 = document.getElementById("YC-check-ceh2");
		var ceh3 = document.getElementById("YC-check-ceh3");
		var ceh4 = document.getElementById("YC-check-ceh4");
		var infor = document.getElementById("YC-check-infor");
		var u = <%=username2 %>;
		if(u!=null){
			ce1.href="./yucepro.jsp";ce2.href="./yucepro.jsp";ce3.href="./yucepro.jsp";
			ceh1.href="./yucefuture.jsp";ceh2.href="./yucefuture.jsp";ceh3.href="./yucefuture.jsp";
			ce4.href="./yucepro.jsp"
			ceh4.href="./yucefuture.jsp"
			infor.href="infor.jsp";
		}
		else{
			ce1.href="login.jsp";ce2.href="login.jsp";ce3.href="login.jsp";
			ceh1.href="login.jsp";ceh2.href="login.jsp";ceh3.href="login.jsp";
			ce4.href="login.jsp"
			ceh4.href="login.jsp"
			infor.href="login.jsp";
		}
	}
    </script>
</html>
