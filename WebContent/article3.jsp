<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>YC-高考志愿辅导-辅导文章</title>

    <!-- Favicon -->
    <link rel="icon" href="img/YC-title.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	</script>
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
                                	String usernc = request.getParameter("usernc");
                                	if(usernc!=null){session.setAttribute("usernc", usernc);}
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
                                %>                            </div>
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
            <h2>辅导文章</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### About Us Area Start ##### -->
    <section class="about-us-area mt-50 section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto wow fadeInUp" data-wow-delay="300ms">
                        <span>精选</span>
                        <h3>大 学 入 学 小 贴 士</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="400ms">
                    <p>大学的话会跟高中的生活完全不一样，它会有特别多的空闲时间。别让自己闲下来，充实自己，多看看书学学习，不要沉迷游戏和手机。当你上大学时，你的生活完全改变了。没有父母在身边提醒你做功课，可以睡懒觉，你突然完全独立了，有了很大的自由，有了一个全新的、充满机会的世界，但是也会迷茫找不到方向。这些建议可以帮助你轻松过渡到大学生活。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="500ms">
                    <p>谨慎交友，别对一个陌生人暴露出你的内心的柔软。大学真的是小社会，挺复杂的，特别是室友，小编曾听班里的女生说，她们宿舍六个人，三个小团体，唉，不得不说，小编的大一生活，连个交心的朋友都没有。当然，遇见可以交心的人一定要把握住。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="600ms">
                    <p>社团尽量就申请一个，学生组织如果真的想进的话，也一个就好，班干部一定要申请。一般在学生组织第一年叫干事，说白了就是干事情的。班干部可是个香饽饽，基本上有些荣誉的话先是给班干部，再是学习好的，哪怕是一个不起眼的班干部也是很好的。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="700ms">
                    <p>学校发的通知书里面一般会夹着一张手机卡，那张卡尽量还是要用的，如果你是在外省的话，那个卡的流量还是很实惠的。在大学，特别是大一，你会遇见很多的赞助，让你拿你的手机号以及别的信息去注册部分东西。有些让拿身份证或者银行卡的那些一定要拒绝，手机的估计你也推不掉，所以用这个新号可以注册。另外，现在的软件，基本上注册都要手机号，一些常用的软件你可以用你经常用的那个号。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="800ms">
                    <p>开放的心态接受新的生活<br>新地方。新室友。新的情况。当你刚上大学的时候，一切都不一样了。处理这些变化的一个万无一失的方法就是保持开放的心态。期待新的变化和情况定期发生，并开放地认识新的人，听取不同的观点。大学除了学习教科书上的事实和理论。大学的大部分时间都在探索新课题，结交朋友，结识来自不同背景的人。<br>小贴士:大学是一个更大更多样的空间，你会碰到各式各样的情况，良好的心态可以让你更好的去接受适应。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="900ms">
                    <p>与同龄人交流<br>你可能身处一个陌生的新地方，但你并不孤单。在课堂上和坐在你旁边的人聊天，或者和住在你宿舍里的人聊天。不要急于建立友谊，在你找到适合你个性和兴趣的人之前，可能需要一段时间。与此同时，享受结识新朋友的过程，并习惯与他人接触。<br>小贴士:记住你的室友也是刚进大学的。你可能不会成为亲密的朋友，但更好地了解她绝对是值得的，因为宿舍是接下来大学生活中你们长期共享的空间。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="1000ms">
                	<p>加入课外组织<br>让大学感觉更像家的一个方法是做一些你喜欢的活动或找到符合你兴趣的俱乐部。大学校园里到处都是学生俱乐部和组织，俱乐部运动队和其他团体，所以很有可能你会找到一个适合你需要的。<br>小贴士:可以到学生服务中心咨询想法，或者咨询一些组织。
                	</p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="1100ms">
                	<p>学会管理时间<br>大学校园里的课外活动很容易让你分心，但别忘了你也要学习。复习你的课程大纲，或者让你的导师找出每门课程的作业和考试的截止日期，然后使用日历或计划表来记录这些截止日期。一定要安排好时间来学习，这样你就不会等到最后一分钟了——这在大学里是行不通的，你可不想每次考试都有挂科的。<br>小贴士:你也会想要在一天中安排一些有趣的活动或空闲时间，但是毕竟学校学习是第一位的。
                	</p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="1200ms">
                	<p>照顾好自己<br>在大学里，你很容易被所有需要完成的事情压垮，如果你做得太多，没有时间留给自己，你就会感到压力。压力过大或疲劳会导致疾病或疲惫。确保你在大学期间有足够好的身体，并尽量安排时间放松或锻炼。<br>小贴士：你可以加入一个自己喜欢的体育类社团，有空时可以参与社团活动，放松自己。
                	</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="about-slides owl-carousel mt-100 wow fadeInUp" data-wow-delay="1300ms">
                        <img src="img/articles-img/articles-bg-3.jpg" alt="">
                        <img src="img/articles-img/articles-bg-2.jpg" alt="">
                        <img src="img/articles-img/articles-bg-1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### About Us Area End ##### -->

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
                                    <li><a href="./universities.jsp" style="float:left" >预查&nbsp;&nbsp;&nbsp;</a><a href="./yucepro.jsp"style="float:left" id="YC-check-ce3">预测&nbsp;&nbsp;&nbsp;</a><a href="./yucefuture.jsp"style="float:left"id="YC-check-ceh3">预策</a></li>
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