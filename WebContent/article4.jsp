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
                                            <li><a href="yucha.jsp">预查</a></li>
                                            <li><a href="yuce.jsp" id="YC-check-ce1">预测</a></li>
                                            <li><a href="yucehua.jsp" id="YC-check-ceh1">预策</a></li>
                                            <li><a href="index.jsp#YC-articles">文章</a></li>
                                            <li><a href="about-us.jsp">关于</a></li>
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
                                                <li><a id="YC-check-ce2" href="yuce.jsp" style="font-size:18px">预测</a></li>
                                                <br>
                                                <li><a class="YC-Main-a" href="#">这里有</a></li>
                                                <li><a class="YC-Main-a" href="#">你想去、向往的</a></li>
                                                <li><a class="YC-Main-a" href="#">各大学</a></li>
                                                <li><a class="YC-Main-a" href="#">录取你的可能性</a></li>
                                            </ul>
                                            <ul class="single-mega cn-col-4">
                                                <li><a id="YC-check-ceh2" href="yucehua.jsp" style="font-size:18px">预策</a></li>
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
                        <h3>高 考 提 分 技 巧</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="400ms">
                    <p>高考理综如何快速提分?物理重新回归课本，化学减少无谓失分，生物提高做题质量。高考理综试卷中，生物试题较少，但综合性强，难度较大，分值较高。高考理综审题要缜密、思维要仔细、书写要规范。下面是高考理综快速提分的方法总结，供参考。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="500ms">
                    <p>高考理综怎样提分最靠谱?<br>1.基础完全不行，属于平时不念书.<br>这类学生不要求助方法、技巧了，在有限的时间内赶紧按照课本顺序把知识点梳理一遍，结合课本章节后的习题，把公式、定理、单词等最基础的要素掌握，才是最佳的提分手段。即使你现在只考200~300分，并不是说你智力有问题，而是你平时所欠下的。你与平时考500多分的中等生，唯一的差距就是基础。如果能有效的利用好50多天，把基础打牢，那么短期内可以追到现在中等生的水平。<br>2.基础教熟，公式定理课本概念等都掌握的很全面，但是不会应用。<br>这类学生是全部考生中最常见的。甚至在考场上，明明知道要考察什么，但是却无法应用。还有一部分是在考场上，不知道题目考查我们什么问题，导致空有经纶满腹，碰到问题时，却不得途径。通常体现在考试时做题没有信心，需要反复确认，解答题时思考时间过长，紧张。依赖熟悉的题型来套用解答。一旦遇到稍微变动的熟悉题型，花费一定时间解答不出时，十分着急，导致影响后面试题。<br>这类同学往往潜意识的认为自己头脑不聪明，有些同学容易对自己产生失望等消极情绪，这是非常不可取的。具体原因玖久高考专家在下文会告诉你。<br>3.基础相对扎实，解题速度较快，没有太多的难题，但是考试往往在会做的题上丢分。<br>这类同学自认为是粗心、马虎，总认为自己认真一些就能考的不错。并且确实在某一次或几次考试中获得好成绩。但是大部分考试还是不高不低。
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="600ms">
                    <p>理综各科如何快速提分<br>1.物理重新回归课本<br>在这最后的冲刺阶段，考生应该按考纲回顾课本知识(概念、公式、定理、定律)。对重点知识的核心要加以强化：如匀变速直线运动公式的推论比基本公式更常考查;向心力、洛仑兹力一定不作功;克服安培力做功等于回路产生的内能、产生的热量;曲线运动总按正交分解;动量定理、动量守恒要先选正方向;克服安培力做功等于整个电路产生的焦耳热求解带电粒子在磁场中运动问题应画轨迹，找圆心，求半径。 重视物理实验：考生实验要从目的、原理、器材、步骤、数据处理、误差分析6个方面着手。设计试验要遵循的原则：安全性、准确性、方便性。
                    <br>全面考虑试题条件：如摩擦力是动摩擦还是静摩擦;弹簧弹力是拉力还是压力;电荷是正还是负，有无初速，是否仅受电场或磁场力作用。成像是实像还是虚像。矢量方向是否确定，机械波向左还是向右传……要注重物理思维方法的灵活运用，一条路走不通就要变换思路考虑问题：如整体法、隔离法、逆向思维法、控制变量法、等效法、对称法、图像法等等;联系实际题要注意抽象成某些物理模型。<br>回归课本形成体系：高考在即，这时考生应该回归课本，盘点一下自己的知识结构，在自己的大脑中形成一个知识体系。同学们可以把以前做过的试卷、题目整理后，检视自己曾经出过的错题，从中找到自己知识上的漏洞，思维方式上的偏差，解题规范上的漏洞。对于这些错题尽量重新做一遍，在这个过程中要思考当初出错的原因，必要时还要重新回到课本澄清一些概念。<br>高考前大多考生基本是放假在家自主复习，有的考生这个时间只看书、只看笔记，不做卷子，结果高考找不到感觉，建议这期间一定每天做卷子，可以是做过的卷子，练练手、热热身、找找感觉，一做就有信心，不要做新的难的卷子，使自己的信心受到挫折。
					<br>2.化学减少无谓失分
					<br>每位同学都要有一个坚定的“抢分”意识，那么如何做到“抢”分?做到题不错二。对于曾经做错的题，要再次重温，认真反思，再次总结知识点，沉淀精华。反思主要从试题涉及的知识点、解题方法、解题规律、失误原因、语言规范、思维的优化等方面进行，而且要将该知识点所考察的内涵和外延都要有一个反思，如果下次遇到同样考察此知识点的题目，但是换了另一种方式来设问，那么就要尽量避免自己以前错误的思维方式，另辟蹊径，才能柳暗花明。这样的反思和积累对解决难度较大的信息迁移题特别有帮助，这类题考查学生通过阅读，提取信息和进行信息加工、处理的能力，也考查学生灵活运用基础知识分析问题和解决问题的综合能力。
					<br>减少无谓失分。在答题时，一要“细心看要求”：要抓住题目中的关键字，例如“正确与错误、大与小、强与弱、能与否，由强到弱或由弱到强，名称与符号，分子式、结构简式、电子式，化学方程式与离子方程式”等，即使题目会做，由于不注意上述词语，就有可能造成失分。二要“准确看条件”：如“所有主族元素”、“标准状况下”、“温度不变”、“室温时”、“无色”、“酸性溶液”等。三要“全面看问题”：知识整合，周密思考，全面判断，滴水不漏，特别提醒碰到“气体”题，注意温度和压强;碰到“字母”题，注意含义及单位。
					<br>注意各量的单位。物质的量浓度(mol/L)，摩尔质量(g/mol)，溶解度(g)、溶质的质量分数和物质的量浓度互换时的体积单位等。题目中隐含性的限制条件如：(1)酸性的无色透明溶液，(2)pH=0的溶液，(3)水电离出的c(OH-)=1×10-14mol/L的溶液等。注意常见符号的应用如“=”，可逆符号、“△H0”、“△H0”、沉淀、气体符号，写电子式时“”的应用、物质的聚集状态、特殊的反应条件等。
					<br>3.生物提高做题质量
					<br>高考生物试题不少内容与识记有关，原来记熟的知识现在有些遗忘了，考前是集中解决这类问题的最佳时间。考生应将记忆不太牢固的知识点、易混淆的基本概念、似是而非模棱两可的内容，依据《考试大纲》对照教材进行集中盘点，课本中的小资料、课外读、小字形式阅读材料、课本中的图表也要来一个重新扫描。
					<br>归纳总结，善于反思。最后这一阶段的复习不做题不行，但沉迷于题海也不行，关键要提高做题质量。总结归纳常见题型的解题规律、方法技巧，从而达到弄懂一道题，旁通一类题的目的。每年高考题出来以后，总能从当年试题中看到近几年试题的影子，但又不是以前试题简单翻版，通过演练近几年的高考真题可亲身感触高考题的命题思路、设问方式，从中感悟解题技巧。<br>考生前一阶段做了大量试题，经历了多次模拟考试，难免做错一些试题，要学会向自己的错误和失败学习，自觉主动地反思错题。错误往往带有顽固性、反复性，有些错误当时理解了，现在可能又模糊了，有些错误其知识点本身就比较难理解，有些错误容易出现模棱两可，需反复强化才能解决。错题暴露考生知识的薄弱环节和思维方法的缺陷。<br>注意审题，规范答题。高考理综试卷中，生物试题较少，但综合性强，难度较大，分值较高。如果审题不够缜密、思维不够仔细、书写不够规范都会付出惨痛代价。在最后这一阶段练习中要特别强调：仔细审题，认真分析，重视表达，规范书写。审题时通读全题，全面、正确地理解题意，不看错题目，留心题中一些关键字如“错误的选项”、“一定”、“都”等。书写答案即完成试卷的终结，应注意以下三个方面：逻辑合理，意思完整，符合专业、数值单位要求。第Ⅱ卷答题的规范性是考生应高度重视的问题，不规范表达不能恰当使用专业术语描述是导致失分关键。细节决定成败!
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="700ms">
                    <p>理综提分要转变学习与解题思维
　　					<br>1.结合《考试说明》一个月掌握全部知识点
　　					<br>虽然高考不纯考查知识点，但是基础毕竟是基石。好在无论学习程度如何，对基础至少都不陌生，最少都有一个概念。作为一个高三生，玖久高考专家根据大量不同层次的考生案例总结出，只要找对了方法，那么一个月足够一个17、8岁的青年掌握大量的信息，为何说一个月内全部能掌握呢?因为从应付高考的角度来说，知识量其实并不大。下面分科介绍如何在短期内掌握全部的知识点。
　　					<br>英语：很多同学认为英语要求单词和全部的语法，其实作为英语，我们首要单词，至于语法，由于不考查纯语法，我们不必刻意去背，当前我们追求的是分数，而不是知识。
　　					<br>英语单词，经过玖久高考肖鹏老师的“词根记忆法”验证，只需要一周(每天2个小时)，就能完全掌握。即把高中单词表花费一定时间按照前缀、词根、后缀列表，你会发现真正要背的不会超过500个词，并且这些词即使再不念书，同学也已经掌握了一半以上，剩下的也无比眼熟。(具体的词根记忆法参见本博文章或参看本博播客)
　　					<br>至于语法，虽然说不必去背，但是基本的语法要熟悉，如时态的先后顺序，基本的从句(时间、地点、物主从句)等即可。为了在高考能获得高分，除了单词，只需要做到每天念一篇课文，做到流畅不结巴即可，你会发现你的英语水平获得很大的提高。考前几天，把历年试卷单选题正确选项代入念熟即可。
　　					<br>数学：数学是让很多同学饮恨的学科。因为数学一旦形成差距，分数拉开的很大，很多同学复习的时候往往注重公式、定理、推论的记背，这是不够的。数学要想掌握全部的知识点，必须学会理解。即复习课本时，把主要精力放在公式是如何来的，怎么推导的，用来解决数学什么问题的。这样的思维去过一次课本，才能把知识朝着应用方向转化。
　　					<br>语文：语文的复习更加简单，放开考试说明，要求背的背，然后就是古文考查的虚实词。
　　					<br>物理：参照数学的复习思想方式，重点放在公式的物理意义(即用公式描述什么物理现象，解决物理什么问题)。物理公式相对不多，记忆量并不大，但是物理实验尤其是步骤、实验对象、实验目的一定要分清记清。
　　					<br>化学：元素周期表一定要同主族、同周期的进行比较，抓住其规律。牢记常用化学元素在周期表的位置(最外电子层个数及分布规律)。有机部分主抓官能团。实验一定要区分清楚特殊现象(气体、沉淀、气味、颜色)。
　　					<br>生物：由于生物考题多衍生扩展，如果全部记忆的话记忆量过大，我们抓重点理解章节内容即可。大家只需做到这一章节大概描述什么内容，记住一些常用的专有名词的大体意思即可。但是生物状态变化的起点、中点、突变点、终点一定要牢记，生物实验部分的物理现象要分清。
　　					<br>2.要学会利用题目信息做题
　　					<br>作为一个考生，很多同学并没有意识到“考生”和“学生”的区别。大家做题时会发现，很多试题你回忆课本知识点找不到答案。考试时题型一换就面目全非，平时的经验无法套用。玖久高考专家告诉你：这是因为高考命题的方式，已经根据《考试说明》进行转变了。以往纯考查知识点的方式渐渐变成考查能力方面转化。因此我们要想提高分数，必须把自己定位在“考生”的位置上。
　　					<br>在做题的时候，要充分利用题目信息去处理问题，而不是套用知识点。面对当今的高考，整理知识点式，不断重复式的复习效率已经不高，意义不大。因为题型的新颖性和灵活性，需要同学们处理的是，不再是单纯的知识点应用，而是如何利用题目的提示信息。也就是解题的入手点和关键点。
　　					<br>这要如何训练呢?其实并不难做题时，无论是具体数字、题目列出的式子、重点描述或解说部分，往往都是解题的出发点和关键点。而每个高三生，都具有一定的思维和辨析能力，只要整个思维从“死记硬背”转变成“无招胜有招”，什么都从题目意思出发，即可在短期内获得极大的提升。
　　					<br>当你做到解答任何题时，都能通过题目所给的信息来解答，你还会犯错丢分吗?
                    </p>
                </div>
                <div class="col-12 col-md-6 wow fadeInUp" data-wow-delay="800ms">
               		<p>理综选择题与解答题如何提高
　　					<br>1.选择题技巧训练
　　					<br>选择题是一类较为特殊的题型，但是占高考总分的比值非常之大，高考750分，约有330分是选择题，并且像数学、文理综题目，一道题的分值也较大。两道选择题相当于一道大题，解答题还有步骤分，但选择题没有。无论是哪一层次的学生，选择题都是属于容易得分也容易丢分的题。每个人都可能会对，但每个人都有一定的概率会错。
　　					<br>在高考最后的阶段了，训练选择题技巧的意义万分重大。每科多对一道题，就是20分。每道题都节约几十秒钟，高考就能留下更多的时间做解答题、填涂等。
　　					<br>而作为高考选择题，命题有十分严格的标准，即要起到考查性和甄选性，在难度设置上还要保证同学们能够在极短的时间内解答。因此在解答选择题的过程中要敢于打破常规，避免小题大做。一定要多利用题目的信息和选项的信息来获取解题的思路，通常大家喜欢严谨的推导，如果计算量小，非常有把握，那么建议同学们这么做。如果对题目把握不大，不能在短时间内计算出来，一定要换个角度，解答选择题，要不折手段的提高准确率和答题速率。
　　					<br>同学们在考试时往往害怕选择题花费时间过多，对自己所选的答案也没有把握，出的简单了，怀疑不会这么简单吧?因此反复验证。出的难了，又认为只是自己不会，别人都会，导致考试时影响整个学科，故而平时训练的时候要本着细心大胆，不拘一格，多角度出发，不要给自己限定在知识点套用的前提下做题，才是训练选择题，提高做题准确率、提高做题速率的根本途径。
　　					<br>2.解答题通解思维
　　					<br>解答题其实并不复杂，数学的解答题基本上思维起点和终点都趋于一致。虽然步骤不同，但是思想方法却有许多相近之处。数学解题的思想并不需要太多，常用的就是正向思维和逆向思维、求同存异思维。我们要善于抓住题目信息给出的关键点，也就是解题的题眼。通常题目中的具体数字、关系表达式、图形图像等都是做题的入手点。千万别拿以往做过的题型去套用，在高考考场上，你能遇到可以用以往做过的题型去套用的可能，是非常非常低下的。
　　					<br>像物理的解答题，几部不需要思考，只要把题目文字转化为公式，不管用得上用不上，一一罗列出来就能联立求解。
　　					<br>像生物、文综的材料分析，整体的思维是判断、解释然后回答。无论是文理综图像分析、材料分析，本质上的解题思维都是文字图像的解析、知识点的选择(课本公式或定义的选择)、材料的组织(公式的联立求解)，最终得出结论。
　　					<br>在高考最后50多天时间内，选择题训练十分关键，因为解答题并不难，特别难的题属于绝大多数同学都不会的，对大部分学生形成不了高考竞争因素，普通的解答题只需要按照上面说的思想去总结思考即可。但选择题是成为高考竞争的最大机遇和挑战，因为题目的灵活性和命题的开拓性，有多种多样的可能把题目做对。选择题并不十分依托考生的知识掌握水平，而很大一部分依托于考生当时思考的角度，导致选择题成为高考竞争的关键题型，也是剩下的时间段内，大家复习的重点题型。要想切实有效的提高高考成绩，思想、方法、技巧、题型一样不能少。
               		</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="about-slides owl-carousel mt-100 wow fadeInUp" data-wow-delay="900ms">
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
                                    <li><a href="yucha.jsp" style="float:left" >预查&nbsp;&nbsp;&nbsp;</a><a href="yuce.jsp"style="float:left" id="YC-check-ce3">预测&nbsp;&nbsp;&nbsp;</a><a href="yucehua.jsp"style="float:left"id="YC-check-ceh3">预策</a></li>
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
			ce1.href="yuce.jsp";ce2.href="yuce.jsp";ce3.href="yuce.jsp";
			ceh1.href="yucehua.jsp";ceh2.href="yucehua.jsp";ceh3.href="yucehua.jsp";
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