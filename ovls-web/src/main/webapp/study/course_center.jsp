<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程中心</title>
<!-- 网页标题栏图标 -->

<script type="text/javascript">
	/**
		这个函数是别人写好的，获得滚到条到当前页面顶部的距离
	
	 */
	function getScrollTop() {
		var scrollPos;
		if (window.pageYOffset) {
			scrollPos = window.pageYOffset;
		} else if (document.compatMode && document.compatMode != 'BackCompat') {
			scrollPos = document.documentElement.scrollTop;
		} else if (document.body) {
			scrollPos = document.body.scrollTop;
		}
		return scrollPos;
	}

	//这个函数作用是，随着滚动条的变化做出判断 执行逻辑
	//-moz代表firefox浏览器私有属性,-ms代表IE浏览器私有属性,-webkit代表chrome、safari私有属性
	//transform代表偏移的意思,translate中数值正数表示向下或向右移,负数代表向上向左移
	window.onscroll = function() {
		var dis = getScrollTop();
		if (dis > 20) {
			$("#pic").css({
				"width" : "100px",
				"height" : "100px",
				"-moz-transform" : "translate(50px, 100px)",
				"-webkit-transform" : "translate(50px, 100px)"
			});

		} else {
			$("#pic").css({
				"width" : "200px",
				"height" : "200px",
				"-moz-transform" : "translate(0px, 0px)",
				"-webkit-transform" : "translate(0px, 0px)"
			});

		}
	};
</script>

<link rel="stylesheet"
	href="/study/style/pagination.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="/study/css/a.css">
<link rel="stylesheet"
	href="/study/css/jquery.css">
<link rel="stylesheet"
	href="/study/css/layer.css">
<link rel="stylesheet"
	href="/study/css/share_style0_16.css">
<link rel="stylesheet" type="text/css"
	href="/study/css/reset.css" />

<style type="text/css">
.myClassList table td dl dd {
	margin-top: 88px
}

#face_panel {
	z-index: 99999999
}
.M-box2{
	position: absolute;
	text-align: center;
	left: 650px;
	zoom: 1;
	buttom: 200px;
	top: 500px;
}
</style>

<link rel="stylesheet"
	href="/study/css/content.css"
	type="text/css">
<style type="text/css">
.bg-other {
	height: 220px;
	background: url(/study/img/u2.jpg) center
		top no-repeat #000;
	background-size: cover
}

#logo a, .logo a {
	display: block;
	height: 60px;
	width: 140px;
	background: url(/study/img/h1.jpg) center
		center no-repeat;
	text-indent: 100%;
	overflow: hidden
}

.user-card-box .user-card-item img {
	width: 36px;
	height: 36px;
	border-color: #4d5559;
	margin-top: 10px
}

.u-container {
	margin-left: 415px;
	min-height: 589px;
	margin-right: 250px;
}

#pic {
	margin-top: -60px;
	margin-left: -10px;
}

.slider .user-pic .suimg {
	width: 200px;
	height: 200px;
	left: 10px;
}

.img_sousuo {
	position: relative;
	left: -25px;
	top: 12px;
}

#layui-layer1 {
	z-index: 19991015;
	width: 330px;
	height: 330px;
	top: 62px;
	left: 1270px;
}

.mod-post .post-row {
	border-bottom: 1px solid #d9dde1;
	overflow: hidden;
	padding: 24px 0 16px 24px;
}

.bd {
	margin-left: 45px;
	margin-top: -20px;
}

#login_pic {
	width: 50px;
	border-radius: 50px;
	top: 18px;
	position: relative;
	left: 10px;
}

.study-tl .time {
	position: absolute;
	left: 0;
	top: 20px;
	margin-left: -75px;
	line-height: 16px;
	font-size: 12px;
	color: #8a8c8f;
}

.study-tl .time::before {
	content: '';
	display: block;
	position: absolute;
	left: 70px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background-color: #d0d6d9;
}
.study-tt {
	padding: 0;
}
.lv_icon_tick{
position: relative;
left: -15px;

}
.lv_icon_drop{

}

</style>

</head>
<body>
	<!-- **页头开始 -->
	<%@include file="head_black.jsp"%>
	<!-- **页头结束 -->

	<!-- 主体开始 -->
	<div id="main">
		<!-- **主体上部背景开始 -->
		<div class="bg-other user-head-info">
			<div class="user-info">
				<h3 class="user-name clearfix">
					<span id="nickname">大兄弟</span>
				</h3>
				<!--25-->
				<p class="about-info">
					<span class="sexSecret " title="保密 "></span> 
					<span class="u-info-learn"><em></em></span> <span
						class="u-info-credit"> <a href="#">积分<em>1</em></a>
					</span> <span class="u-info-mp"> <a href="#">经验<em>0</em></a>
					</span>
				</p>
				<p class="user-desc">大兄弟哈哈哈</p>
				<div class="study-info clearfix">
					<div class="item follows">
						<a href="#"><em>1</em> <span>关注</span> </a>
					</div>
					<div class="item followers">
						<a href="#"><em>0</em> <span>粉丝</span> </a>
					</div>
				</div>
				<!--.study-info end-->
			</div>
			<!-- .user-info end -->
		</div>
		<!-- .big-pic end -->
		<!-- **主体上部背景结束 -->

		<!-- **主体下部开始 -->
		<div class="wrap">
			<!-- **主体左边导航开始 -->
			<div class="slider"
				style="position: fixed; left: 191.5px; top: 95px;">
				<!-- **导航图片开始 -->
				<div class="user-pic">
					<div class="user-pic-bg su-user-pic-bg"></div>
					<!--user-pic-big end-->
					<img id="pic" class="img suimg"
						src="" alt="头像被怪物吃啦!">
					<div class="set-btn" style="display: none;">
						<a href="user_center.jsp"> <!-- **这里需要主页链接 --> <i class="icon-set"></i>
						</a>
					</div>
				</div>
				<!-- **导航图片结束 -->
				<!-- **导航列表开始 -->
				<ul>
					<li onclick="getScrollTop()"><a href="#sgy_fvideo">
					<img alt=""  src="/study/images/lv_icon7.jpg" class="lv_icon_tick">
					<span>浏览记录</span>
					<img alt=""  src="/study/images/lv_icon8.jpg" class="lv_icon_drop">
					</a></li>
					<li onclick="getScrollTop()"><a href="#sgy_fnote">
					<img alt=""  src="/study/images/lv_icon7.jpg" class="lv_icon_tick">
					<span>笔记收藏</span>
					<img alt=""  src="/study/images/lv_icon8.jpg" class="lv_icon_drop">
					</a></li>
				</ul>
				<!-- **导航列表结束 -->
			</div>
			<!-- **主体左边导航结束 -->
			<!-- **主体右边内容框浏览记录开始 -->
			<div id="sgy_fvideo" class="u-container">
				<div class="c-tab clearfix">
					<div class="tool-left l">
						<a href="#" class="sort-item active">最近的学习视频</a>

					</div>
					<%--<div class="tool-right r">
						<div class="tool-all">

							<ul id="js-columbd" class="all-cont" style="display: none;">
								<li><a href="#">全部课程</a></li>
								<li><a href="#">Java</a></li>
								<li><a href="#">全部课程</a></li>
							</ul>
						</div>
					</div>--%>
				</div>

	            <!-- 课程循环处 -->

			</div>
			<!-- **主体右边内容框浏览记录结束 -->
			
			<!-- **主体右边内容框笔记收藏开始 -->
			<div id="sgy_fnote" class="u-container">
				<div class="c-tab clearfix">
					<div class="tool-left l">
						<a href="#" class="sort-item active">我收藏的笔记</a>
					</div>
					<%--<div class="tool-right r">--%>
						<%--<div class="tool-all">--%>
							<%--<ul id="js-columbd" class="all-cont" style="display: none;">--%>

								<%--<li><a  href="#">全部课程</a></li>--%>
								<%--<li><a  href="#">HTML/CSS</a></li>--%>
								<%--<li><a  href="#">Java</a></li>--%>
								<%--<li><a href="#">全部课程</a></li>--%>
							<%--</ul>--%>
						<%--</div>--%>
					<%--</div>--%>
				</div>
				
				<div class="course-list course-list-m js-course-list">
					<ul id="js-note-container" class="mod-post">
                        <%--笔记收藏循环处--%>
					</ul>
				</div>
                
<!-- 				分页
				<div class="M-box2"></div>
 -->
			</div>
			<!-- **主体右边内容框笔记收藏结束 -->
			

		</div>
		<!-- **主体下部结束 -->
	</div>
	<!-- **主体结束 -->

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        //加载用户姓名、头像等信息
        $(function(){
            var nickName = localStorage.nickName;
            $("#nickname").html(nickName);
            var sex =localStorage.sex;
            $(".sexSecret").html(sex);
            var signature =localStorage.signature;//个性签名
            $(".user-desc").html(signature);

            var image = localStorage.image;
            $("#pic").attr("src",image);


        });
    </script>

    <script type="text/javascript">
        $(function(){
            //加载笔记
            loadNotes();
            //加载课程
            loadCourses();
        });

        //加载课程
        function loadCourses(){
            var userId = localStorage.userId;
            $.ajax({
                url:"http://127.0.0.1:9524/ovls-course/get/collectCourse",
                type:"get",
                data:{"userId":userId},
                dataType:"json",
                success:function(result){
                    if(result!=0){
                        for(var i=0;i<result.length;i++){
                            var courseId = result[i].courseId;
                            var collectTime = result[i].collectTime ;
                            var curTime = new Date(collectTime).Format("yyyy-MM-dd hh:mm:ss");
                            $.ajax({
                                url:"http://127.0.0.1:9524/ovls-course/course/"+courseId,
                                type:"get",
                                dataType:"json",
                                async:false,
                                success:function(result2){
                                    var name = result2.name;
                                    var intro = result2.intro;
                                    var image = result2.image;
                                    var str = '';
                                    str+='<div class="js-course-list my-space-course study-tl">';
                                    str+='    <div class="clearfix tl-item  tl-item-first">';
                                    str+='    <span class="time">&nbsp;'+ curTime +'</span>';
                                    str+='    <div class="course-list course-list-m">';
                                    str+='    <ul class="clearfix">';
                                    str+='    <li class="course-one">';
                                    str+='    <div class="course-list-img l">';
                                    str+='    <a href="course.html?id='+courseId+'" target="_blank"> <img alt="图片不知道去哪玩了"';
                                    str+='     src="'+ image+'" width="200" height="113"> </a>';
                                    str+='    </div>';
                                    str+='    <div class="course-list-cont">';
                                    str+='   <h3 class="study-hd">';
                                    str+='    <a href="#" target="_blank">'+ name +'</a> ';
                                    str+='    </h3>';
                                    str+='    <div class="study-points">';
                                    str+='    <h5>'+ intro +'</h5>';
                                    str+='    </div>';
                                    str+='    </div>';
                                    str+='    </li>';
                                    str+='    </ul>';
                                    str+='    </div>';
                                    str+='    </div>';
                                    str+='    </div>';
                                    $("#sgy_fvideo").append(str);
                                }
                            });
                        }
                    }
                }
            });
        }




        //加载笔记
        function loadNotes(){
            var userId = localStorage.userId;
            $.ajax({
                url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/collectNote",
                type:"get",
                data:{"userId":userId},
                dataType:"json",
                success:function(result){
                    if(result!=0){
                        for(var i=0;i<result.length;i++){
                            var noteId = result[i].noteId;
                            var collectTime = result[i].collectTime ;
                            var curTime = new Date(collectTime).Format("yyyy-MM-dd hh:mm:ss");
                            $.ajax({
                                url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/notesByNoteId",
                                type:"get",
                                data:{"noteId":noteId},
                                dataType:"json",
                                async:false,
                                success:function(result2){
                                        var title = result2.title;
                                        var context = result2.context;
                                        var str = '';
                                        str+='<li class="post-row js-find-txt" >';
                                        str+='    <div class="bd">';
                                        str+='    <div class="tit">';
                                        str+='    <a  target="_blank">标题：&nbsp;&nbsp;'+ title +'</a>';
                                        str+='    </div>';
                                        str+='    <div class="js-notelist-content notelist-content mynote">';
                                        str+='    <pre class="autowrap">笔记内容:&nbsp;&nbsp;'+ context+'</pre>';
                                        str+='</div>';

                                        str+='<div class="answercon">';
                                        str+='    </div>';
                                        str+='    <div class="footer clearfix">';
                                        str+='    <span  class="l timeago">收藏时间：&nbsp;'+ curTime +'</span>';
                                        str+='</div>';
                                        str+='</div>';
                                        str+='</li>';
                                        $("#js-note-container").append(str);
                                }
                            });
                        }
                    }
                }
            });
        }

        // 对Date的扩展，将 Date 转化为指定格式的String
        // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
        // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
        // 例子：
        // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
        // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
    </script>
	<!-- **页脚开始 -->
	<%@include file="footer_black.jsp"%>
	<!-- **页脚结束 -->

	<!-- **页面右边固定栏开始 -->
	<div id="J_GotoTop" class="elevator">
	</div>
	<!-- **页面右边固定栏结束 -->
</body>


    </html>