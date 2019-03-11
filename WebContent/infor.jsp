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
    <title>YC-高考志愿辅导-个人信息</title>

    <!-- Favicon -->
    <link rel="icon" href="img/YC-title.png">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="style.css">
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	</script>
	
	<style type="text/css">
	select{
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
                                	String usernc = request.getParameter("usernc");
                                	String password = (String)session.getAttribute("password");
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
            <h2>个人信息</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->
    
    
    <!-- ##### Information Area Start ##### -->
    <div class="container" style="margin-top:150px;margin-bottom:100px">
	    	<form action="infor" method="post" onSubmit="return check()" id="inforform">
				<div style="margin-left:50px;margin-right:50px;">
                    <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                    <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6><a role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-align: center;line-height: 1.3;font-weight: 700;font-size: 1.75rem;">必填信息
                                    <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                    <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a></h6>
                            <div id="collapseOne" class="accordion-content collapse show">
                           		<hr style="background-color: #ccc;border: 0;height: 1px;margin-bottom:30px">
								昵称：<input id="infor-name" type="text" name="name" value="${usernc }" class="YC-sxinxi">
								&nbsp;&nbsp;&nbsp;&nbsp;文 / 理科：<select id="infor-subject" name="subject" value="" class="YC-sxinxi" style="margin-right:0">
										<option>---请选择---</option><option value="0">理科</option><option value="1">文科</option>
										</select><br>
								生源地：<select  id="infor-pro" name="pro" value="" class="YC-sxinxi"><option>---请选择---</option></select>
								高考分数：<input id="infor-mark" type="text" name="mark" value="${mark }" class="YC-sxinxi"style="margin-right:0">
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo" style="text-align: center;line-height: 1.3;font-weight: 700;font-size: 1.75rem;">选填信息
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                        </a>
                            </h6>
                            <div id="collapseTwo" class="accordion-content collapse">
                            	<hr style="background-color: #ccc;border: 0;height: 1px;margin-bottom:30px">
                            	电话：<input type="text" name="phone" value="${phone }" class="YC-sxinxi">
								&nbsp;&nbsp;邮箱：<input type="text" name="mail" value="${mail }" class="YC-sxinxi" style="margin-right:0"><br>
								目标省份：<select id="infor-pro1" name="ideal_pro1" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select>
										<select id="infor-pro2" name="ideal_pro2" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select>
										<select id="infor-pro3" name="ideal_pro3" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select><br>
								目标专业：<select id="infor-major1" name="major1" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select>
										<select id="infor-major2" name="major2" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select>
										<select id="infor-major3" name="major3" value="" class="YC-sxinxi" style="margin-right:30px"><option>---请选择---</option></select><br>
                            	目标院校：<select id="province1" name="ideal_sch_pro1"class="YC-sxinxi" style="margin-right:30px" onchange="updateSchool1(document.getElementById('province1'),document.getElementById('school1'))">
					                        <option>--请选择高校所在省份--</option>
					                    </select>
					                    <select id="school1" name="ideal_sch1" class="YC-sxinxi">
					                        <option>---请选择---</option>
					                    </select><br>
										<select id="province2" name="ideal_sch_pro2" class="YC-sxinxi" style="margin-left: 70px;margin-right:30px" onchange="updateSchool2(document.getElementById('province2'),document.getElementById('school2'))">
					                        <option>--请选择高校所在省份--</option>
					                    </select>
					                    <select id="school2" name="ideal_sch2" class="YC-sxinxi" >
					                        <option>---请选择---</option>
					                    </select><br>
					                    <select id="province3" name="ideal_sch_pro3" class="YC-sxinxi" style="margin-left: 70px;margin-right:30px" onchange="updateSchool3(document.getElementById('province3'),document.getElementById('school3'))">
					                        <option>--请选择高校所在省份--</option>
					                    </select>
					                    <select id="school3" name="ideal_sch3" class="YC-sxinxi">
					                        <option>---请选择---</option>
					                    </select>
                            </div>
                        </div>
                        <!-- single accordian area -->
                        <div class="panel single-accordion">
                            <h6>
                                <a role="button" aria-expanded="true" aria-controls="collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree" style="text-align: center;line-height: 1.3;font-weight: 700;font-size: 1.75rem;">修改密码
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a>
                            </h6>
                            <div id="collapseThree" class="accordion-content collapse">
                            	<hr style="background-color: #ccc;border: 0;height: 1px;margin-bottom:30px">
                            	新密码：<input id="newpassword" type="password" name="password" value="" class="YC-sxinxi">
								确认密码：<input id="repeatpassword" type="password" name="repassword" value="" class="YC-sxinxi" style="margin-right:0">
                            </div>
                        </div>
                 	</div>
                 	<div style="text-align: center;"><button type="submit" class="btn academy-btn m-2">保存</button></div>
				</div>
			</form>
		</div>
    </div>
    <!-- ##### Information Area End ##### -->
     
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
	
function check(){
    var np = document.getElementById("newpassword");
    var rp = document.getElementById("repeatpassword");
    if(np.value != ""){
        if(np.value == rp.value) return true;
        if(np.value != rp.value){
            alert("两次密码不一致");
            return false;
        }
    }
    if(np.value == ""){
    	np.value="<%=password%>";
    	return true;
    }
};
</script>

<script>
         var provinces=["北京市","天津市","河北省","山西省","内蒙古自治区","辽宁省"
            ,"吉林省","黑龙江省","上海市","江苏省","浙江省","安徽省","福建省","江西省","山东省"
            ,"河南省","湖北省","湖南省","广东省","广西壮族自治区","海南省","四川省","贵州省"
            ,"云南省","重庆市","西藏自治区","陕西省","甘肃省","青海省","宁夏回族自治区"
            ,"新疆维吾尔自治区"];
		
        var majors=["农学","历史学","哲学","工学","教育学","文学","法学","理学","管理学","经济学","艺术学"];
        $(function(){
            for( var i = 0; i < provinces.length; i++ ) {
                $("select[name*='pro']").append("<option>"+provinces[i]+"</option>");
            }
            for( var i = 0; i < majors.length; i++ ) {
                $("select[name^='major']").append("<option>"+majors[i]+"</option>");
            }
            var subject = document.getElementById("infor-subject");
        	var sub = '${subject}';
        	for(i=0;i<subject.length;i++){
        		if(subject[i].value==sub) 
        			subject[i].selected=true;
        	}
        	var pro = document.getElementById("infor-pro");
        	var p = '${user_pro}';
        	for(i=0;i<pro.length;i++){
        		if(pro[i].text==p) 
        			pro[i].selected=true;
        	}
        	var sch_pro1 = document.getElementById("province1");
        	var sp1 = '${ideal_sch_pro1}';
        	console.log(sp1);
        	for(i=0;i<sch_pro1.length;i++){
        		if(sch_pro1[i].text===sp1){ 
        			sch_pro1[i].selected=true;
        			if ("createEvent" in document) {
        				var evt = document.createEvent("HTMLEvents");
        				evt.initEvent("change", false, true);
        				sch_pro1.dispatchEvent(evt);
        			}
        				else
        					sch_pro1.fireEvent("onchange");
        		}
        	}
        	var sch_pro2 = document.getElementById("province2");
        	var sp2 = '${ideal_sch_pro2}';
        	for(i=0;i<sch_pro2.length;i++){
        		if(sch_pro2[i].text===sp2){ 
        			sch_pro2[i].selected=true;
        			if ("createEvent" in document) {
        				 var evt = document.createEvent("HTMLEvents");
        				 evt.initEvent("change", false, true);
        				 sch_pro2.dispatchEvent(evt);
        				}
        				else
        					sch_pro2.fireEvent("onchange");
        		}
        	}
        	var sch_pro3 = document.getElementById("province3");
        	var sp3 = '${ideal_sch_pro3}';
        	for(i=0;i<sch_pro3.length;i++){
        		if(sch_pro3[i].text===sp3){ 
        			sch_pro3[i].selected=true;
        			if ("createEvent" in document) {
       				 var evt = document.createEvent("HTMLEvents");
       				 evt.initEvent("change", false, true);
       				 sch_pro3.dispatchEvent(evt);
       				}
       				else
       					sch_pro3.fireEvent("onchange");
        		}
        	}
        	var pro1 = document.getElementById("infor-pro1");
        	var p1 = '${ideal_pro1}';
        	for(i=0;i<pro1.length;i++){
        		if(pro1[i].text==p1) 
        			pro1[i].selected=true;
        	}
        	var pro2 = document.getElementById("infor-pro2");
        	var p2 = '${ideal_pro2}';
        	for(i=0;i<pro2.length;i++){
        		if(pro2[i].text==p2) 
        			pro2[i].selected=true;
        	}
        	var pro3 = document.getElementById("infor-pro3");
        	var p3 = '${ideal_pro3}';
        	for(i=0;i<pro3.length;i++){
        		if(pro3[i].text==p3) 
        			pro3[i].selected=true;
        	}
        	var major1 = document.getElementById("infor-major1");
        	var m1 = '${major1}';
        	for(i=0;i<major1.length;i++){
        		if(major1[i].text==m1) 
        			major1[i].selected=true;
        	}
        	var major2 = document.getElementById("infor-major2");
        	var m2 = '${major2}';
        	for(i=0;i<major2.length;i++){
        		if(major2[i].text==m2) 
        			major2[i].selected=true;
        	}
        	var major3 = document.getElementById("infor-major3");
        	var m3 = '${major3}';
        	for(i=0;i<major3.length;i++){
        		if(major3[i].text==m3) 
        			major3[i].selected=true;
        	}
        	
        	
        });
		
        function updateSchool1(province, school) {   // provice， school： getElementById获得的组件
            console.log(province+' '+school);
            school.innerHTML='<option>---请选择---</option>';
            var index = province.selectedIndex;     // 拿到省份select选中项的索引
            var selectedProvince = province.options[index].text;  // 拿到省份select选中项的值
            console.log(selectedProvince);
            var schools = [];   // 相应高校数组

            if( selectedProvince.substring(0,2) === "--" ) {
                return;
            }
            else {
                $.ajax({
                    async: true,
                    type: "get",
                    url: "selectSh",
                    data: {
                        loc: selectedProvince,
                    },
                    dataType: "json",
                    success: function (result) {
                        if(result) {
                            // 存储高校数据
                            for( var i = 0; i < result.length; i++ ) {
                                schools.push(result[i]);
                            }
		                    for(var j = 0; j < schools.length; j++){
		                        school.innerHTML += '<option value="'+schools[j]+'">'+schools[j]+'</option>';
		                    }
		                    var sch1 = document.getElementById("school1");
		                	var s1 = '${ideal_sch1}';
		                	for(i=0;i<sch1.length;i++){
		                		if(sch1[i].text==s1) 
		                			sch1[i].selected=true;
		                	}
                        }
                    },
                    error: function (errorMsg) {
                        // 请求失败时执行该函数
                        alert("获取高校列表数据失败~")
                    }
                })
            }
        }
        
        function updateSchool2(province, school) {   // provice， school： getElementById获得的组件
            console.log(province+' '+school);
            school.innerHTML='<option>---请选择---</option>';
            var index = province.selectedIndex;     // 拿到省份select选中项的索引
            var selectedProvince = province.options[index].text;  // 拿到省份select选中项的值
            console.log(selectedProvince);
            var schools = [];   // 相应高校数组

            if( selectedProvince.substring(0,2) === "--" ) {
                return;
            }
            else {
                $.ajax({
                    async: true,
                    type: "get",
                    url: "selectSh",
                    data: {
                        loc: selectedProvince,
                    },
                    dataType: "json",
                    success: function (result) {
                        if(result) {
                            // 存储高校数据
                            for( var i = 0; i < result.length; i++ ) {
                                schools.push(result[i]);
                            }
		                    for(var j = 0; j < schools.length; j++){
		                        school.innerHTML += '<option value="'+schools[j]+'">'+schools[j]+'</option>';
		                    }
		                    var sch2 = document.getElementById("school2");
		                	var s2 = '${ideal_sch2}';
		                	for(i=0;i<sch2.length;i++){
		                		if(sch2[i].text==s2) 
		                			sch2[i].selected=true;
		                	}
                        }
                    },
                    error: function (errorMsg) {
                        // 请求失败时执行该函数
                        alert("获取高校列表数据失败~")
                    }
                })
            }
        }
        
        function updateSchool3(province, school) {   // provice， school： getElementById获得的组件
            console.log(province+' '+school);
            school.innerHTML='<option>---请选择---</option>';
            var index = province.selectedIndex;     // 拿到省份select选中项的索引
            var selectedProvince = province.options[index].text;  // 拿到省份select选中项的值
            console.log(selectedProvince);
            var schools = [];   // 相应高校数组

            if( selectedProvince.substring(0,2) === "--" ) {
                return;
            }
            else {
                $.ajax({
                    async: true,
                    type: "get",
                    url: "selectSh",
                    data: {
                        loc: selectedProvince,
                    },
                    dataType: "json",
                    success: function (result) {
                        if(result) {
                            // 存储高校数据
                            for( var i = 0; i < result.length; i++ ) {
                                schools.push(result[i]);
                            }
		                    for(var j = 0; j < schools.length; j++){
		                        school.innerHTML += '<option value="'+schools[j]+'">'+schools[j]+'</option>';
		                    }
		                    var sch3 = document.getElementById("school3");
		                	var s3 = '${ideal_sch3}';
		                	for(i=0;i<sch3.length;i++){
		                		if(sch3[i].text==s3) 
		                			sch3[i].selected=true;
		                	}
                        }
                    },
                    error: function (errorMsg) {
                        // 请求失败时执行该函数
                        alert("获取高校列表数据失败~")
                    }
                })
            }
        }


    </script>

</html>
