<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		//加载免费好课
		loadFreeCourse();
		//加载课程菜单
		loadCourseMenu();
		//加载课程推荐
		loadCourseRecommendation();
		//加载学科-价格
		loadCoursePrice();
		//加载学科-评价
		loadCourseScore(); 
		//加载学科-价格
		loadCoursePrice1();
		//加载学科-评价
		loadCourseScore1(); 
		//加载学科-价格
		loadCoursePrice2();
	});
	
	
	//加载Oracle--价格
	function loadCoursePrice2(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/subjectIdPrice",
			type:"get",
			data:{"size":4,"subjectId":27},
			dataType:"json",
			success:function(result){
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var score = result[i].score;
					var image = result[i].image;
					var price = result[i].price;
					//拼一个课程元素
					var str = '';
			
				    str+='<div class="width_217 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
				    str+='<a href="course.html?id='+ id +'">';
				    str+='<div class="width100 float_l img_100 z_inx_1">';
				    str+='	<img src="'+image+'">';
				    str+='</div>';
				    str+='<div class="img_backg2 donghua">';
				    str+='	<span class="margin_t15 float_l ">'+ name +'</span> ';
				    str+='	<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+ intro +'</span>';
				    str+='</div>';
				    str+='<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
				    str+='	<span class="float_l color_red">￥'+ price +'</span> <span class="float_r color_gray"><span>'+ learnCount +'</span>人在学</span>';
				    str+='</div>';
				    str+='</a>';
				    str+='</div>';
					//将课程元素添加到显示区
					$("#orcle01").append(str);
				}
			}
		});
	};
	
	//加载JAVA--价格
	function loadCoursePrice1(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/subjectIdPrice",
			type:"get",
			data:{"size":3,"subjectId":14},
			dataType:"json",
			success:function(result){
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var score = result[i].score;
					var image = result[i].image;
					var price = result[i].price;
					//拼一个课程元素
					var str = '';
			
				    str+='<div class="width_217 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
				    str+='<a href="course.html?id='+ id +'">';
				    str+='<div class="width100 float_l img_100 z_inx_1">';
				    str+='	<img src="'+image+'">';
				    str+='</div>';
				    str+='<div class="img_backg2 donghua">';
				    str+='	<span class="margin_t15 float_l ">'+ name +'</span> ';
				    str+='	<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+ intro +'</span>';
				    str+='</div>';
				    str+='<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
				    str+='	<span class="float_l color_red">￥'+ price +'</span> <span class="float_r color_gray"><span>'+ learnCount +'</span>人在学</span>';
				    str+='</div>';
				    str+='</a>';
				    str+='</div>';

					//将课程元素添加到显示区
					$("#javaCourse").append(str);
				}
			}
		});
	};
 	//加载JAVA--评价
	function loadCourseScore1(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/subjectIdScore",
			type:"get",
			data:{"size":2,"subjectId":14},
			dataType:"json",
			success:function(result){
					//拼一个课程元素
					var str = '';			    
				    str+='<div class="width_220 height364 float_l backg_white border_shadow" id="htmlCourseScore">';
					for(var i=0;i<result.length;i++){
						var id = result[i].id;
						var name = result[i].name;
						var intro = result[i].intro;
						var learnCount = result[i].learnCount;
						var score = result[i].score;
						var image = result[i].image;
						var price = result[i].price;
						
					 str+='<div class="width_220 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
					 str+='<a href="course.html?id='+ id +'">';
					 str+='	<div class="width100 float_l img_100 z_inx_1">';
					 str+='		<img src="'+image+'">';
					 str+='	</div>';
					 str+=' 	<div class="img_backg2 donghua">';
					 str+='		<span class="margin_t15 float_l ">'+name+'</span> ';
					 str+='		<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+intro+'</span>';
					 str+='	</div>';
					 str+='	<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
					 str+='		<span class="float_l color_red">课程评分：</span> ';
					 str+='		<span class="float_r color_gray"><span>'+score+'</span></span>';
					 str+='	</div>';
					 str+='</a>';
					 str+='</div>';
					 }
					 str+='</div>';
					//将课程元素添加到显示区
					$("#javaCourseScore").append(str);
			}
		});
	};
	

	
	//加载HTML--价格
	function loadCoursePrice(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/subjectIdPrice",
			type:"get",
			data:{"size":3,"subjectId":1},
			dataType:"json",
			success:function(result){
				//循环免费好课集合信息
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var score = result[i].score;
					var image = result[i].image;
					var price = result[i].price;
					//拼一个课程元素
					var str = '';
				    str+='<div class="width_217 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
				    str+='<a href="course.html?id='+ id +'">';
				    str+='<div class="width100 float_l img_100 z_inx_1">';
				    str+='	<img src="'+image+'">';
				    str+='</div>';
				    str+='<div class="img_backg2 donghua">';
				    str+='	<span class="margin_t15 float_l ">'+ name +'</span> ';
				    str+='	<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+ intro +'</span>';
				    str+='</div>';
				    str+='<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
				    str+='	<span class="float_l color_red">￥'+ price +'</span> <span class="float_r color_gray"><span>'+ learnCount +'</span>人在学</span>';
				    str+='</div>';
				    str+='</a>';
				    str+='</div>';

					//将课程元素添加到显示区
					$("#htmlCourse").append(str);
				}
			}
		});
	};
 	//加载HTML--评价
	function loadCourseScore(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/subjectIdScore",
			type:"get",
			data:{"size":2,"subjectId":1},
			dataType:"json",
			success:function(result){
				//循环免费好课集合信息
					//拼一个课程元素
					var str = '';			    
				    str+='<div class="width_220 height364 float_l backg_white border_shadow" id="htmlCourseScore">';
					for(var i=0;i<result.length;i++){
						var id = result[i].id;
						var name = result[i].name;
						var intro = result[i].intro;
						var learnCount = result[i].learnCount;
						var score = result[i].score;
						var image = result[i].image;
						var price = result[i].price;
						
					 str+='<div class="width_220 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
					 str+='<a href="course.html?id='+ id +'">';
					 str+='	<div class="width100 float_l img_100 z_inx_1">';
					 str+='		<img src="'+image+'">';
					 str+='	</div>';
					 str+=' 	<div class="img_backg2 donghua">';
					 str+='		<span class="margin_t15 float_l ">'+name+'</span> ';
					 str+='		<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+intro+'</span>';
					 str+='	</div>';
					 str+='	<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
					 str+='		<span class="float_l color_red">课程评分：</span> ';
					 str+='		<span class="float_r color_gray"><span>'+score+'</span></span>';
					 str+='	</div>';
					 str+='</a>';
					 str+='</div>';
					 }
					 str+='</div>';
					//将课程元素添加到显示区
					$("#htmlCourseScore").append(str);
			}
		});
	};
	

	//加载课程菜单
	function loadCourseMenu(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-direction/direction/all",
			type:"get",
			dataType:"json",
			success:function(result){
				//循环方向信息，生成菜单
				for(var i=0;i<result.length;i++){
					var directionId = result[i].id;
					var directionName = result[i].name;
					var subjects = result[i].subjects;
					var courses = result[i].courses;
					//拼一个菜单元素
					var str = '';
					str+='<div class="width100 float_l tab_qiehuan ">';
					str+='	<div class="width100 float_l text_c height64 line_hei64 color_white bianhuabeijing backg_jqian padding_lr20">';
					str+='		<div class="width100 float_l text_l height64 line_hei64 color_white border_b_baise fon_siz16">';
					str+='			<span>'+directionName+'</span> <span class="float_r">></span>';
					str+='		</div>';
					str+='	</div>';
					str+='	<div class="width_700 float_l lunbofenlei dis_none img_backg'+(15+i%4)+'">';
					str+='		<div class="width100 float_l padding40">';
					str+='			<div class="width100 float_l margin_b40">';
					str+='				<span class="width100 color_shenred fon_siz16 float_l margin_b20">分类目录</span>';
					str+='				<ul class="width100 ul_lis float_l">';
					for(var j=0;j<subjects.length;j++){
						var subjectId = subjects[j].id;
						var subjectName = subjects[j].name;
						str+='					<li>';
						str+='						<a href="course_list.jsp?id='+subjectId+'&directionName='+directionName+'&subjectName='+subjectName+'">'+subjectName+'</a>';

						str+='					</li>';
						if(j<subjects.length-1){
							str+='				<li>/</li>';
						}
					}					
					str+='				</ul>';
					str+='			</div>';
					
					str+='			<div class="width100 float_l margin_b40">';
					str+='				<span class="width100 color_shenred fon_siz16 float_l margin_b20">推荐</span>';
					str+='				<ul class="width100 ul_lis float_l">';
					for(var k=0;k<courses.length;k++){
						var courseId = courses[k].id;
						var courseName = courses[k].name;
						str+='					<li class="width100 float_l margin_b15">';
						str+='						<a href="course.html?id='+ courseId +'">课程 | '+courseName+'</a>';
						str+='					</li>';
                     }		
					str+='				</ul>';
					str+='			</div>';
					str+='		</div>';
					str+='	</div>';
					str+='</div>';
					//将菜单元素添加到显示区
					$("#menu").append(str);
				}
				//为动态生成菜单元素添加切换特效
				$('.tab_qiehuan').hover(
					function() {
						$(this).children(".bianhuabeijing").css("background-color",
							"#8a8f93").next().css("display", "block")
					},
					function() {
						$(this).children(".bianhuabeijing").css("background-color",
							"#a9aaae").next().css("display", "none")
				});
			}
		});
	};
	
	
	//加载免费好课
	function loadFreeCourse(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/free",
			type:"get",
			data:{"size":5},
			dataType:"json",
			success:function(result){
				//循环免费好课集合信息
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var score = result[i].score;
					var image = result[i].image;
					//拼一个课程元素
					var str = '';
					str+='<div class="width_220 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
					str+='<a href="course.html?id='+ id +'">';
					str+='	<div class="width100 float_l img_100 z_inx_1">';
					str+='		<img src="'+image+'">';
					str+='	</div>';
					str+='	<div class="img_backg2 donghua">';
					str+='		<span class="margin_t15 float_l ">'+name+'</span> ';
					str+='		<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+intro+'</span>';
					str+='	</div>';
					str+='	<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
					str+='		<span class="float_l color_red">评分:'+score+'</span> <span class="float_r color_gray"><span>'+learnCount+'</span>人在学</span>';
					str+='	</div>';
					str+='</a>';
					str+='</div>';
					//将课程元素添加到显示区
					$("#freeCourse").append(str);
				}
			}
		});
	};
	
	//加载课程推荐
	function loadCourseRecommendation(){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/recommendation",
			type:"get",
			data:{"size":5},
			dataType:"json",
			success:function(result){
				//循环免费好课集合信息
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var score = result[i].score;
					var image = result[i].image;
					var price = result[i].price;
					//拼一个课程元素
					var str = '';
					str+='<div class="width_220 height172 float_l margin_r20 border_shadow jingguoxianshi over_pos bianshou">';
					str+='<a href="course.html?id='+id+'">';
					str+='<div class="width100 float_l img_100 z_inx_1">';
				    str+='	<img src="'+ image +'">';
				    str+='</div>';
				    str+='<div class="img_backg2 donghua">';
				    str+='	<span class="margin_t15 float_l ">'+ name +'</span>'; 
				    str+='<span class="float_l fon_siz12 line_hei16 color_gray margin_t5 posi_relative ">'+ intro +'</span>';
				    str+='</div>';
				    str+='<div class="width100 float_l padding_lr20 height48 fon_siz12 line_hei48 z_inx_3 posi_relative backg_white">';
				    str+='	<span class="float_l color_red">￥'+ price +'</span> <span class="float_r color_gray"><span>'+ learnCount +'</span>人在学</span>';
				    str+='</div>';
				    str+='</a>';
				    str+='</div>';
					//将课程元素添加到显示区
					$("#zymCourse").append(str);
				}
			}
		});
	};
	
	</script>

	<head>
		<meta charset="utf-8">
		<title>程序猿-梦工厂</title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="css/muke.css">
	
		
		<!-- 网页标题栏图标 -->
		<link rel="SHORTCUT ICON" href="img/favicon.ico"/>
	
		<!-- 名师推荐样式  -->
		<style type="text/css">
			#teacher {
				display:inline-block; 
				width: 216px; 
				height:364px;
				position: relative; 
				left:20px;
				background-color: white; 
				box-shadow: 10px 10px 5px #888888;
			}
			#teacher_top{
				text-align: center; 
				position: relative; 
				top: 30px;
				
			}
			#teacher_intro{
				position: relative; 
				top: 30px;
				font-size: 12px; 
				width: 180px; 
				height: 110px;
				margin: 0 auto; 
				color: RGB(130,130,130); 
				line-height: 1.5em; 
				letter-spacing:1.2px;
				overflow: hidden;
			}
		</style>
	</head>
	
		
	
	<body>
		<%@include file="head.jsp"%>		
<!--========================轮播图==============================-->
		<div class="width100 float_l margin_t-405 margin_b40">
			<div class="width_1200 margin_auto">
				<div class="width100 float_l height460 posi_relative">
					<div class="width100 float_l">
						<div class="focusBox">
							<ul class="pic">
								<li>
									<a href="${pageContext.request.contextPath}/study/course_list.jsp"><img src="${pageContext.request.contextPath}/study/img/index1.jpg" /></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/study/course_list.jsp"><img src="${pageContext.request.contextPath}/study/img/index2.jpg" /></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/study/course_list.jsp"><img src="${pageContext.request.contextPath}/study/img/index3.jpg" /></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/study/course_list.jsp"><img src="${pageContext.request.contextPath}/study/img/index4.jpg" /></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/study/course_list.jsp"><img src="${pageContext.request.contextPath}/study/img/index5.jpg" /></a>
								</li>
							</ul>
							<a class="prev" href="javascript:void(0)"></a>
							<a class="next" href="javascript:void(0)"></a>
							<a class="next" href="javascript:void(0)"></a>
							<a class="next" href="javascript:void(0)"></a>
							<a class="next" href="javascript:void(0)"></a>
							<ul class="hd">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>

					<div id="menu" class="width_220 float_l height460 posi_absolute backg_jqian padding_t5 bianshou">
						
						<!-- 调用服务动态生成菜单 -->
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
		<script type="text/javascript">
			$(".focusBox").slide({
				mainCell: ".pic",
				effect: "left",
				autoPlay: true,
				delayTime: 500
			});
		</script>
<!--========================== 实战推荐 =============================-->
		<div class="width100 float_l margin_b40">
			<div class="width_1200 margin_auto">

				<div class="width100 float_l margin_b20">
					<div class="float_l">
						<span class="fon_siz16">课程推荐</span>
					</div>
					
				</div>
				<div class="width100 float_l" id="zymCourse">
				   <!-- 动态生成课程推荐元素 -->
					
					</div>
				</div>
			</div>
		</div>

<!--========================== 免费好课 =============================-->
		<div class="width100 float_l margin_b40">
			<div class="width_1200 margin_auto">

				<div class="width100 float_l margin_b20">
					<div class="float_l">
						<span class="fon_siz16">免费好课</span>
					</div>
				</div>
					
				<div class="width100 float_l" id="freeCourse">
			
					<!-- 动态生成免费好课元素 -->
				</div>
			</div>
		</div>

<!--========================== Html-前端工程师 =============================-->
		<div class="width100 float_l padding_tb45 backg_qiangray">
			<div class="width_1200 margin_auto">
				<div class=" width_220 height364 float_l img_backg3 margin_r20">
					<div class="width100 float_l padding_lr20 color_white fon_siz32 b_weight700 margin_t10">
						<span>Html<br>前端工程师
					</span>
					</div>
					<div class="width100 float_l padding_lr20 color_white fon_siz16 margin_t30 jiantoubianhua bianshou">
						<a href="${pageContext.request.contextPath}/study/download/HTML5.CHM"><span>API 下载<span class="margin_l5 wobianhua">></span></span></a>
					</div>
					<div class="width100 float_l padding_lr20 color_white fon_siz12 bianshou line_hei26 color_shenred wobeijingguos margin_t120">
						<a>超文本标记语言 HyperText Markup Language 简称：HTML，是一种标记语言。</a>
					</div>
				</div>
				<div class="width_712 float_l margin_r20" id="htmlCourse">
					<div  class=" width100 float_l height172 kaishimeiyou img_backg12 text-center line_hei172 margin_b20">
						<span class="fon_siz20 color_white b_weight700" style="font-size: 26px;">靡不有初&nbsp;&nbsp;鲜克有终</span>
					</div>
					<!-- 追加html课程 -->
				

				</div>
				
				<div class="width_220 height364 float_l backg_white border_shadow" id="htmlCourseScore">
					<!-- 追加htmlCourseScore 课程评分列表，由高到低 -->
				
			
				</div>
				
			</div>
		</div>

<!--========================== java-工程师 =============================-->
<div class="width100 float_l backg_qiangray padding_b45">
			<div class="width_1200 margin_auto">
				<div class=" width_220 height364 float_l img_backg11 margin_r20">
					<div class="width100 float_l padding_lr20 color_white fon_siz32 b_weight700 margin_t10">
						<span>Java<br>开发工程师
					</span>
					</div>
					<div class="width100 float_l padding_lr20 color_white fon_siz16 margin_t30 jiantoubianhua bianshou">
						<a href="${pageContext.request.contextPath}/study/download/JDK_API_1_6_zh_CN.CHM"><span>API 下载<span class="margin_l5 wobianhua">></span></span></a>
					</div>
					<div class="width100 float_l padding_lr20 fon_siz12 bianshou line_hei26 color_blue wobeijingguosa margin_t120">
						<a>Java是由Sun公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。</a>
					</div>
				</div>
				<div class="width_712 float_l margin_r20" id="javaCourse">
					<div class=" width100 float_l height172 kaishimeiyou img_backg10 text-center line_hei172 margin_b20">
						<span class="fon_siz20 color_white b_weight700" style="font-size: 26px;">不忘初心&nbsp;&nbsp;方得始终</span>
					</div>
					
				
				</div>

				<div class="width_220 height364 float_l backg_white border_shadow" id="javaCourseScore">
					<!-- 追加javaCourseScore 课程评分列表，由高到低 -->
				</div>
			</div>
		</div>
<!--========================== Oracle 工程师 =============================-->
		<div class="width100 float_l backg_qiangray">
			<div class="width100 float_l">
				<div class="width_1200 margin_auto">
					<div  id="orcle01" class="width100 float_l" id="courseOracle">
						<div class=" width_220 height172 float_l img_backg14 margin_r20">
							<div class="width100 float_l padding_lr20 color_white fon_siz32 b_weight700 margin_t10">
								<span>Oracle<br>DBA
							</span>
							</div>
							<div class="width100 float_l padding_lr20 color_white fon_siz16 margin_t30 jiantoubianhua bianshou">
								<a href="${pageContext.request.contextPath}/study/download/ORACLE.chm"><span>API 下载<span class="margin_l5 wobianhua">></span></span></a>
							</div>
						</div>
					
					
					</div>
				</div>
			</div>
		</div>

	<%@include file="footer.jsp"%>
	</body>

</html>