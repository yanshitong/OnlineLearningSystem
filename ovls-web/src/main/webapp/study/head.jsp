<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/muke.css">
<script type="text/javascript" src="js/jquery.js"></script>

<!-- 主页调用顶部部分 -->
<style>
	/*头部背景样式*/
	 .img_backg1 {
	    position: relative;
		background-color: #F3F5F7;
		height: 70px;
	} 
	/*首页样式*/
	.all_course {
		position: absolute;
		top: 29px;
		left: 200px;
		height: 30px;
		width: 74px;
		border-radius: 3px;
	}
	
	.all_course a {
		color: #000;
		font-size: 16px;
		font-weight: 700;
		text-decoration: none;
		position: relative;
		top: -26px;
		right: -3px;
	}

	/*个人中心样式*/
	
	.persional_center {
		position: absolute;
		top: 29px;
		left: 500px;
		height: 30px;
		width: 74px;
		border-radius: 3px;
	}
	
	.persional_center a {
		color: #02A1E9;
		font-size: 16px;
		font-weight: 700;
		text-decoration: none;
		position: relative;
		top: -26px;
		right: -3px;
	}
		/*安全退出样式*/
	.index {
		position: absolute;
		top: 29px;
		left: 350px;
		height: 30px;
		width: 74px;
		border-radius: 3px;
	}
	.index a {
		color: #02A1E9;
		font-size: 16px;
		font-weight: 700;
		text-decoration: none;
		position: relative;
		top: -26px;
		right: -3px;
	}
	/* 搜索框位置调整 */
	#searchDiv{
	    position: absolute;
		right: 150px;
	}
	/*登录按钮样式*/
	
	#log_reg {
		position: relative;
		top: -3px;
		right: 3px;
		float: right;
	}
	
	#example1,
	#example2 {
		float: right;
		position: relative;
		color: #333333;
		background: #A9AAAE;
		text-decoration: none;
		padding: 0px 12px;
		margin: 27px 10px 0px 15px;
		border-radius: 3px;
		opacity: 0.6;
		filter: alpha(opacity=60);
		line-height: 31px;
	}
	
	/*  登录后头像   */
	#lv-img{
	width:50px;
	height:50px; 
	border-radius:50%;
	position: relative;
	/* right:30px; */
	}
	
	
	
</style>
<!-- 顶部 -->
<div class="width100 float_l height490 img_backg1">
    <div class="width100 float_l height80 line_hei80">
        <!-- 顶部左边 -->
        <div class="float_l">
            <div class="float_l margin_l20">
                <img src="img/logo.png">
            </div>
            <div class="float_r">
                <div class="all_course">
                    <a href="index.jsp">首页</a>
                </div>

                <div class="persional_center">
                    <a id="sgy_usercenter" >个人中心</a>
                </div>
                <div class="index">
                    <a onclick="return outUser()" id="sgy_delete" href="#">安全退出</a>
                </div>


            </div>
        </div>

		<!-- 顶部右边 -->
		<div class="float_r">
			<div class="float_l top_input" id="searchDiv">
				<input class="posi_relative" type="text" name="" id="search_id" placeholder="请输入..."> 
				<img class="img_sousuo bianshou" src="img/uiz4.png" onclick="search()">
			</div>
			
		
			  <div id="log_reg">
				<a href="#" id="example1">注册</a>
				<a href="#" id="example2">登录</a>
			  </div>
				
				<div class="img_backg1" id="imgdiv" >
				    <img src= "img/eva.jpg" id="lv-img"/>
				</div> 
		</div>

	</div>
</div>

<!-- 这里导入弹出层插件 -->
<script type="text/javascript" src="layer/layer.js"></script>
<%--<script type="text/javascript">

    $(function () {
        if (localStorage.userId == null) {
            /* 显示登录注册 */
            $("#log_reg").show();
            /* 隐藏头像 */
            $("#imgdiv").hide();
        } else {
            /* 隐藏登录注册 */
            $("#log_reg").hide();
            /* 显示头像 */
            $("#imgdiv").show();
        }
    });
</script>--%>
<script type="text/javascript">
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
		 $("#log_reg").show();
		 /* 隐藏头像 */
		 $("#imgdiv").hide();
	 }else{
		 /* 隐藏登录注册 */
		 $("#log_reg").hide();
		 /* 显示头像 */
		 $("#imgdiv").show();
	 }
 }); 

</script>
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
$(document).on('click', '#example1', function() {
	 layer.open({ 
        type : 2,
        border : [1 , 1 , 'gray', true],  
        shade : [0.5 , '#000' , true],  
        shadeClose:true,
        title : false, 
        content:'regist.jsp',
        area : ['450px' , '450px'],  
        offset : ['100px',''],  
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

/*
个人中心是否登录
 */
$(document).on('click', '#sgy_usercenter', function() {
    if(localStorage.userId == null){ //如没有  弹出登录窗口
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
    }else{
        window.location="user_center.jsp";
    }

});

</script>
