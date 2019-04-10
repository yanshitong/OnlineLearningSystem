<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/course_list-v2-less.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/muke.css" />
<link rel="stylesheet" type="text/css" href="css/moco.min.css" />
<style>
	/*登录注册按钮样式*/
	
	#example1,
	#example2 {
		float: right;
		position: relative;
		color: #333333;
		background: #A9AAAE;
		text-decoration: none;
		padding: 0px 12px;
		margin: 25px 10px 0px 15px;
		border-radius: 3px;
		opacity: 0.6;
		filter: alpha(opacity=60);
		line-height: 31px;
		height: 31px;
	}
	
	#login-area,
	.header-app {
		position: relative;
		top: -12px;
	}
	/*搜索区域样式*/
	
	.search-area {
		float: right;
		position: relative;
		height: 40px;
		width: 210px;
		margin: 10px 0;
		padding-right: 30px;
		border: 1px solid #000;
		border-bottom-color: rgba(120, 125, 130, .8);
		zoom: 1;
		-webkit-transition: width .3s;
		-moz-transition: width .3s;
		transition: width .3s;
	}
	/*搜索框样式*/
	#search_top_input {
		float: right;
		position: absolute;
		top: 12px;
		right: 150px;
	}

	.img_sousuo {
		position: relative;
		right: -5px;
		top: 12px;
	}
	
	/*  登录后头像   */
	#lv-img{
	width:50px;
	height:50px; 
	border-radius:50%;
	position: absolute;
	top: 7px;
	right: 10px;
	}

    .nav-item li a {
        color: #02A1E9;
    }
    .nav-item li a:active {
        color: #FFFFFF;
    }



</style>
</head>
<body  style="height: 100%">
<!-- 头部区域 -->
	<div id="header">
		<div class="page-container" id="nav">
			<!-- logo部分 -->
			<div id="logo" class="logo">
				<a style="background: url(img/logo.png) center center no-repeat"
					href="index.jsp" target="_self" class="hide-text" title="首页">梦工厂</a>
			</div>

			<button type="button"
				class="navbar-toggle visible-xs-block js-show-menu">
				<i class="icon-menu"></i>
			</button>
			<ul class="nav-item">
				<li><a href="index.jsp" id="sgy_index" target="_self">首页</a>
				</li>
				<li>
			</li>
			<li>
				<a id="sgy_usercenter"  href="user_center.jsp" >个人中心</a>
			</li>
			<li>
				<a id="sgy_coursecenter"  href="course_center.jsp" >课程中心</a>
			</li>
			<li>
				<a onclick="return outUser()" id="sgy_delete" href="#">安全退出</a>
			</li>
			</ul>

			
			<div id="login-area">
				<ul class="header-unlogin clearfix">
					<li class="header-signin"><a href="#" id="example2">登录</a></li>
					<li class="header-signup"><a href="#" id="example1">注册</a></li>
				</ul>
			</div>
	            <!-- 头像显示 -->
	            <div id="imgdiv" >
				    <img src= "img/eva.jpg" id="lv-img"/>
				</div> 
			 
			<div id="search_top_input" class="float_l top_input">
				<input class="posi_relative" type="text" name="" id="search_id" placeholder="请输入..."> 
				<img clas s="img_sousuo bianshou" src="img/uiz4.png" onclick="search()">
			</div>

		</div>

	</div>

<!-- 这里导入弹出层插件 -->
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

    //根据地址确实 是否为当前页面 如果是则添加active 否则取消
    $(function () {
        $(".nav-item").find("li").each(function () {
            var a = $(this).find("a:first")[0];
            if ("/study/"+$(a).attr("href") === location.pathname) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    })

$(function(){
	//修改用户照片
	var image = localStorage.image;
	$("#lv-img").attr("src",image);
}); 


/* 携带着当前输入的信息去search.jsp*/
function search(){
	localStorage.searchInfo = $("#search_id").val();
	window.location="search.jsp";
}


/** 根据是否登录显示不同页面*/
 $(function(){
	 if(localStorage.userId == null){
		 /* 显示登录注册 */
		 $("#login-area").show();
		 /* 隐藏头像 */
		 $("#imgdiv").hide();

	 }else{
		 /* 隐藏登录注册 */
		 $("#login-area").hide();
		 /* 显示头像 */
		 $("#imgdiv").show();

         //修改个人信息头像
         $("#up-img-touch").attr("src",localStorage.image);
         //修改头像下name
         $("#name95").html(localStorage.name);
	 }

 }); 

</script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
/*安全退出*/
 function outUser(){
	//询问框
	 layer.confirm('亲，再看一会儿吧？', {
	   btn: ['残忍拒绝','再看看'] //按钮
	 }, function(){
	   localStorage.clear();
	   window.parent.location.reload();//刷新父窗口
	 });
}
</script>
<script type="text/javascript">
/*
 *注册弹出层事件函数 
 
 */
$(document).on('click', '#example1', function () {
    layer.open({
        type: 2,
        border: [1, 1, 'gray', true],
        shade: [0.5, '#000', true],
        shadeClose: true,
        title: false,
        content: 'regist.jsp',
        area: ['450px', '450px'],
        offset: ['100px', ''],
    });
});
/*
 *登录弹出层事件函数 
 
 */

	
$(document).on('click', '#example2', function() {
	 layer.open({ 
       type : 2,
       border : [1 , 1 , 'gray', true],  
       shade : [0.5 , '#000' , true],  
       shadeClose:true,
       title : false,  
       content:'login.jsp',
       area : ['450px' , '450px'],  
       offset : ['100px',''],  
   }); 
	 
	 
	});

</script>
<script type="text/javascript">

</script>
</body>

</html>