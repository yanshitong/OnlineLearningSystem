<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>程序猿——梦工厂</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta property="qc:admins" content="77103107776157736375" />
<meta property="wb:webmaster" content="c4f857219bfae3cb" />
<meta http-equiv="Access-Control-Allow-Origin" content="*" />
<meta http-equiv="Cache-Control" content="no-transform " />
<meta http-equiv="Content-Security-Policy"
	content="script-src 'self' 'unsafe-inline' 'unsafe-eval' *.imooc.com *.mukewang.com *.baidu.com *.sina.com.cn *.bootcss.com">

<meta name="Keywords" content="" />

<meta name="Description"
	content="精品课程，为您提供专业的IT实战开发课程，包含前端开发、后端开发、移动端开发、数据处理、图像处理等各方面IT技能，课程全面、制作精良、讲解通俗易懂。">

<link rel="stylesheet"
	href="static/moco/v1.0/dist/css/moco.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/common.css" type="text/css">

<!-- 网页标题栏图标 -->
<link rel="SHORTCUT ICON" href="favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/pagination.css" media="screen"  >

<style type="text/css">
.course-nav-item-on{
	display: inline-block;
	margin: 0 4px;
	background-color: #4C9ED9;
	color:black;
}

.sort-item-on{
	color:red;
}

li:hover {
	cursor: pointer;
}

</style>

</head>
<body>

	<!-- 引入页头页面 -->
	<%@include file="head_black.jsp"%>
		<div class="bindHintBox js-bindHintBox hide">
		<div class="pr">
			为了账号安全，请及时绑定邮箱和手机 <a href="javascript:void(0)" class="ml20 color-red"
				target="_blank">立即绑定</a>
			<button class="closeBindHint js-closeBindHint" type="button"></button>
			<div class="arrow"></div>
		</div>
	</div>

	<div id="main">

		<div class="wrap ">
			<div class="top">
				<div class="course-content">
					<div class="course-nav-box">
						<div class="course-nav-row clearfix">
							<span class="hd l">方向：</span>
							<span id="direction"></span>
							<div class="bd">
								<ul id="lv_show_directions">
								
									
								</ul>
							</div>
						</div>
						<div class="course-nav-row clearfix">
							<span class="hd l">分类：</span>
							<span id="fenlei"></span>
							<div class="bd">
								<ul  id="lv_show_subjects">
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="course-tool-bar clearfix">
				<div class="tool-left l">
					<a href="#" id="lv-sort-1" onclick="loadTime()">最新</a> 
					<a href="#" id="lv-sort-2" onclick="loadActive()">最热</a>
				</div>
				<div class="l">
					<span class="tool-item" style="display: none;"> <a
						class="follow-learn tool-chk" href="javascript:void(0);">跟我学</a>
					</span>
				</div>
				<div class="tool-right r">

					<span class="tool-item total-nu"> 共<b id="sum">22</b>个课程</span> 
					<span class="tool-item tool-pager"> 
						<span class="pager-num">
							<!-- <b class="pager-cur"  id="lv_currentPage">1</b>
							/<em class="pager-total" id="lv_pages">5</em>  -->
					        <input type="button" value="上页" onclick="up()">
                            <input type="button" id="lv_pages" value="">
					        <input type="button" value="下页" onclick="down()">
						</span> 
					</span>
				</div>
			</div>
			<div class="course-list">
				<div class="moco-course-list">
					<ul class="clearfix" id="ul1">
						
					</ul>
				</div>
				<!-- 分页实现 -->
				<div class="M-box2"></div>
				<!-- 分页实现 -->
			</div>
		</div>
	</div>

	<!-- 引入页脚页面 -->

	<%@include file="footer_black.jsp"%>

</body>
<script type="text/javascript">
				var id = getQueryString("id");
				var directionName = getQueryString("directionName");
				var subjectName = getQueryString("subjectName");
				$("#direction").html(directionName);
				$("#fenlei").html(subjectName);
				$(function(){
					/* localStorage.removeItem('pages'); */
					loadActiveAndTime(id);
					//加载?/?
					localStorage.page=1;
					$("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
					//默认最新
					$("#lv-sort-1").css('color', 'red');
					$("#lv-sort-2").css('color', 'black');
				});
				
				/** 最热*/
				function loadActive(){
					$("#lv-sort-1").css('color', 'black');
					$("#lv-sort-2").css('color', 'red');
					loadActiveAndTime(id,2);
					//初始化?/?
					localStorage.page=1;
					$("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
				}
				/** 最新*/
				function loadTime(){
					$("#lv-sort-1").css('color', 'red');
					$("#lv-sort-2").css('color', 'black');
					loadActiveAndTime(id,1);
					//初始化?/?
					localStorage.page=1;
					$("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
				}
				//下一页
				function down(){
					 localStorage.page++;
					 if(localStorage.page>localStorage.pages){
						 layer.msg("已经是最后一页了");
						 localStorage.page--;
						 $("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
					 }else{
						 $("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
						 loadActiveAndTime(id,localStorage.i,localStorage.pageNum);
					 }
					
				}
				//上一页
				function up(){
					 localStorage.page--;
					 if(localStorage.page<=0){
						 layer.msg("已经是第一页了");
						 localStorage.page=1;
						 $("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
					 }else{
						 $("#lv_pages").val(localStorage.page+"/"+localStorage.pages);
						 var pageNum = localStorage.pageNum-2;
							if(pageNum==0){
								pageNum+=1;
							}
							 loadActiveAndTime(id,localStorage.i,pageNum);
					 }
					
				}
				function getQueryString(name) {
					  var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
					  var r = window.location.search.substr(1).match(reg);
					  if (r != null) {
					    return decodeURI(r[2]);
					  }
					  return null;
					}
				
				function loadActiveAndTime(id,i,pageNum){
					$("#ul1").empty();
					$.ajax({
						url:"http://127.0.0.1:9524/ovls-course/course/active",
						type:"get",
						data:{"id":id,"pageNum":pageNum,"i":i},
						dataType:"json",
						async: false,
						success:function(course){
							//共多少课程
							$("#sum").html(course.sum);
							//共几页
							if(Math.ceil(course.sum/5)==0){
								localStorage.pages=1;
							}else{
								localStorage.pages=Math.ceil(course.sum/5);
							}
							//可以判断是否有第一页
							localStorage.panduan = course.sum;
							var courses = course.list;
							localStorage.pageNum = course.pageNum+1;
							//根据pageSize判断最后一页是否有数据的时候
						/* 	localStorage.pageSize = course.size;
							 if(localStorage.pageSize==0){
								 up();
							 } */
							localStorage.i = course.i;
							for(var i=0;i<courses.length;i++){
							    var id = courses[i].id;
								var str = '';
								str+="<li>";
								str+="<div class='index-card-container course-card-container container '>";
								str+="	<a target='_blank' class='course-card' href='course.html?id="+ id +"'>";
								str+="		<div class='course-card-top cart-color blue'>";
								str+="			<i class='imv2-war'></i> <span>"+name+"</span>";
								str+="		</div>";
								str+="		<div class='course-card-content'>";
								str+="			<h3 class='course-card-name'>"+courses[i].name+"</h3>";
								str+="			<p>"+courses[i].intro+"</p>";
								str+="			<div class='clearfix course-card-bottom'>";
								str+="				<div class='course-card-info'>";
								str+="					评分:"+courses[i].score+"<span>·</span>"+courses[i].learnCount+"人在学";
								str+="				</div>";
								str+="			</div>";
								str+="		</div>";
								str+="	</a> <img src='static/img/index/new/new.png' class='course-cart-new'>";
								str+="	<div class='course-card-bk'>";
								str+="		<img src='"+courses[i].image+"'/>";
								str+="	</div>";
								str+="</div>";
								str+="</li>";
								$("#ul1").append(str);
							}
						}
					})
					
				}


</script>
</html>