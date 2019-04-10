<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索_程序猿-梦工厂</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Access-Control-Allow-Origin" content="*" />
<meta http-equiv="Cache-Control" content="no-transform " />
<meta http-equiv="Content-Security-Policy"
	content="script-src 'self' 'unsafe-inline' 'unsafe-eval' *.imooc.com *.mukewang.com *.baidu.com *.sina.com.cn *.bootcss.com">
<link rel="stylesheet" href="css/moco.min.css" type="text/css" />
<link rel="stylesheet" href="css/lv-common-less.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/pagination.css" media="screen"  >


<style type="text/css">
.search-form-ipt {
	background-color: white;
}

.search-related {
	position: relative;
	top: 17px;
}
</style>
</head>

<body>

<!-- 页头开始 -->
<%@ include file="head_black.jsp" %>
	<div class="bindHintBox js-bindHintBox hide">
		<div class="pr">
			为了账号安全，请及时绑定邮箱和手机 <a href="javascript:;" class="ml20 color-red"
				target="_blank">立即绑定</a>
			<button class="closeBindHint js-closeBindHint" type="button"></button>
			<div class="arrow"></div>
		</div>
	</div>

	<div id="main">

		<div class='search-main'>
			<div class='search-header'>
				<div class='search-form clearfix'>
					<i class='icon-search'></i> 
					<input id='search2_id' type='text' class='search-form-ipt js-search-ipt' placeholder='请输入想搜索的内容' /> 
					<span class='search-form-btn js-search-btn' onclick="find()">搜索</span>
					<ul class='search-area-prge js-search-area-prge'></ul>
				</div>

				<%-- <ul class='hot'>
					<li>热门搜索：</li>
					<li><a href='${pageContext.request.contextPath}/search?key=Oracle' target="_blank">Oracle</a>
					</li>
					<li><a href='${pageContext.request.contextPath}/search?key=mysql' target="_blank">mysql</a></li>
					<li><a href='${pageContext.request.contextPath}/search?key=java' target="_blank">java</a></li>
				</ul> --%>
			</div>

			<div class='search-body'>

				<!-- 遍历展示   结束 -->

			</div>

			<!-- ***** -->
		</div>
		
		<div class="M-box2"></div>

	</div>
	
<!-- 页脚开始 -->
<%@ include file="footer_black.jsp" %>
<script type="text/javascript">
$(function(){
	//搜索的信息
	if(localStorage.searchInfo == null||localStorage.searchInfo == ""){
		layer.msg("请输入查询内容");
		localStorage.removeItem('searchInfo');
	}else{
	   $("#search2_id").val(localStorage.searchInfo);
	   var name = localStorage.searchInfo;
	   $.ajax({
		  url:"http://127.0.0.1:9524/ovls-course/course/findCourseByName",
		  type:"get",
		  data:{"size":5,"name":name},
		  dataType:"json",
		  success:function(result){
			  localStorage.removeItem('searchInfo');
			if(result.code==4){
				layer.msg("查无结果");
			}else{
				 var str1 = '';
	             str1+=' <div class="search-related">共找到'+ result.length +'个相关内容  &nbsp;&nbsp;'; 
				 str1+='</div>';
				 str1+='<h2 class="search-title">课程</h2>';
				 $(".search-body").append(str1)
			//循环集合信息
				 for(var i=0;i<result.length;i++){
					//result表示服务器返回的json结果
						var id = result[i].id;
						var name = result[i].name;
						var intro = result[i].intro;
						var learnCount = result[i].learnCount;
						var score = result[i].score;
						var image = result[i].image;
						var price = result[i].price;
							//拼一个课程元素
						     var str = '';
						     str+='	<div class="course-item clearfix">';
						     str+='		<div class="course-item-left">';
						     str+='			<a href="#" target="_blank"> ';
						     str+='			<img src="'+ image+'" width="210" height="120" />';
						     str+='			</a>';
						     str+='		</div>';
						     str+='		<div class="course-item-right">';
						     str+='			<div class="course-item-title">';  
						     str+='				<span class="type">[课程]</span> <a href="course.html?id='+ id +'" target="_blank">'+name+'</a>';
						     str+='			</div>';
						     str+='			<div class="tag">';
						     str+='				<span>Java</span> <strong class="strongMargin"></strong> <strong>'+learnCount+'</strong>';
						     str+='			</div>';
						     str+='			<p class="content">';
						     str+='				<span>课程简介：</span> '+intro;
						     str+='			</p>';
						     str+='		</div>';
						     str+='	</div>';
						     $(".search-body").append(str);
				     }
					//将课程元素添加到显示区
					
					}
		}
	});
	}
});

function find(){
	$(".search-body").html("");
	var name = $("#search2_id").val();
	if(name == null||name==""){
		layer.msg("请输入查询内容");
	}else{
	/* event.stopPropagation(); */
	$.ajax({
		url:"http://127.0.0.1:9524/ovls-course/course/findCourseByName",
		type:"get",
		data:{"size":5,"name":name},
		dataType:"json",
		success:function(result){
			localStorage.removeItem('searchInfo');
			if(result.code==4){
				layer.msg("查无结果");
			}else{
				 var str1 = '';
	             str1+=' <div class="search-related">共找到'+ result.length +'个相关内容  &nbsp;&nbsp;'; 
				 str1+='</div>';
				 str1+='<h2 class="search-title">课程</h2>';
				 $(".search-body").append(str1)
			//循环集合信息
				 for(var i=0;i<result.length;i++){
					//result表示服务器返回的json结果
						var id = result[i].id;
						var name = result[i].name;
						var intro = result[i].intro;
						var learnCount = result[i].learnCount;
						var score = result[i].score;
						var image = result[i].image;
						var price = result[i].price;
							//拼一个课程元素
						     var str = '';
						     str+='	<div class="course-item clearfix">';
						     str+='		<div class="course-item-left">';
						     str+='			<a href="#" target="_blank"> ';
						     str+='			<img src="'+ image+'" width="210" height="120" />';
						     str+='			</a>';
						     str+='		</div>';
						     str+='		<div class="course-item-right">';
						     str+='			<div class="course-item-title">';  
						     str+='				<span class="type">[课程]</span> <a href="course.html?id='+ id +'" target="_blank">'+name+'</a>';
						     str+='			</div>';
						     str+='			<div class="tag">';
						     str+='				<span>Java</span> <strong class="strongMargin"></strong> <strong>'+learnCount+'</strong>';
						     str+='			</div>';
						     str+='			<p class="content">';
						     str+='				<span>课程简介：</span> '+intro;
						     str+='			</p>';
						     str+='		</div>';
						     str+='	</div>';
						     $(".search-body").append(str);
				     }
					//将课程元素添加到显示区
					
					}
		}
	});
  }
};

</script>
</body>

</html>