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
                        <h3>大 学 专 业 选 择</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="400ms">
                    <p>各省陆续公布高考分数，九百多万考生的成绩尘埃落定。下一步就要进入大学志愿填报环节。在适合的分数段里如何选择一个好的学校，心仪的专业就至关重要。这一次的选择关系到未来三到四年甚至一生的人生走向。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="500ms">
                    <p>那如何选一个好的大学专业呢？<br>填报高考志愿有两个方向。一是通过大学选专业，而是通过专业选大学。<br>通过大学选专业。这种情况一般是对某所大学或者某一地域大学有好感，然后根据自己分数进行一个区域性的大学筛选。因为现在大学都是兼容并包，各门类专业都开具的很齐全。所以有情怀的先选大学也是可以的。通过专业选大学。有些考生和家长对专业的倾向性很强，不管是出于个人兴趣还是就业因素。优先选取计划未来学习的专业，然后利用多方信息（大学专业排行榜，某专业的国家实验室数量，相应专业的国家支持项目等）进行专业排序。然后再根据自己的分数选择相应有专业强势的学校进行志愿填报。<br>这两种各有所长，各位准大学生们可以根据个人所需进行选择。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="600ms">
                    <p>选专业必须要避开以下几个坑：<br>热门专业每一段时期都会有一批热门专业，它代表了社会人才供需状态。但这种供需状态是一直动态发展变化的，现在非常热门，可能等你毕业之后发现满大街的都是这个专业的毕业生。竞争激烈，工作难找。高大上专业有很多专业名称起的很高大上，但实际上是很基础的理论学科。例如计算机科学与技术学的是计算机基础理论，是指导应用的学科，和真正的计算机应用有很大的差距。对计算机科学感兴趣的可以报这类专业，而单纯对计算机应用有需求的就要选择相应的应用学科了。家长意见十八九岁的学生还没有形成自己完整的人生观，在选专业这件事情上受家长的影响很大。但要记住一点就是，大学是你来上的，不是你父母上的。家长对孩子专业的选择受限于他们所受的教育程度及对信息的检索分辨能力，有很大的局限性。所以这个关键时候，要对自己负责，勇于提出自己的想法，不要盲目听从。个人感情很多在高中谈恋爱的学生面临大学志愿的时候会想着延续前缘，为了在一起而选择同一院校。爱情值得尊重，但是个人的良好发展是爱情发展的前进力。进了大学，进入截然不同的社会群体，看到更大的世界。环境的巨变是否会影响彼此的感情？为了爱情而选择专业是否能够让彼此在愉快的学习中加深情感？还是需要尊重自己内心的兴趣爱好，坚毅的爱情能够跨越地域的隔阂。

                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="700ms">
                    <p>如何选择合适的专业<br>专业没有高低优劣之分，它们都是对人类知识的组成部分。所以没有绝对好的专业，只有适合自己的。如何挑选合适的专业呢？可以从以下几点来分析选择：<br>自己兴趣/特长所在兴趣是最好的老师。选择自己感兴趣的专业会让自己的大学生活主动而充实。兴趣是选择专业的第一要素，它决定着你是否能够快乐的进行大学学习。如果因为其他原因选择自己不感兴趣甚至反感的专业，整个大学生活将会很痛苦。疲于应付那些没兴趣的专业知识考试，会极大的消耗青春动力。就业方向/地区所在如果对某一个城市特有情怀，或者感觉发展空间较好。可以倾向于特定城市。家庭需要所在如果家庭条件不好，需要上完大学后尽快工作来改变家庭状况，那就要选择比较好就业的应用型学科。师范类，工学类都是比较稳定的就业方向。社会趋势所在随着社会发展，一些从前的优势学科逐渐退出历史舞台。同样新兴学科开始在科学角度绽放光彩。所以在选择专业的时候要看清社会发展趋势。选择有发展潜力的专业。
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="about-slides owl-carousel mt-100 wow fadeInUp" data-wow-delay="800ms">
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