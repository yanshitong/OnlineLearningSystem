<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>程序猿——梦工厂</title>
<link rel="stylesheet"
	href="static/moco/v1.0/dist/css/moco.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="css/common.css"
	type="text/css">
<link rel="stylesheet"
	href="css/pagination.css"
	type="text/css">
<!-- 网页标题栏图标 -->
<link rel="SHORTCUT ICON" href="favicon.ico" />

<!--问答评论区切换的实现-->
<link rel="stylesheet"
	href="static.mukewang.com/static/css/lv_course_1.css"
	type="text/css"/>
<link rel="stylesheet"
	href="static.mukewang.com/static/css/lv_course_2.css"
	type="text/css"/>
<link rel="stylesheet"
	href="static.mukewang.com/static/css/lv_course_3.css"
	type="text/css"/>
<link rel="stylesheet"
	href="static.mukewang.com/static/css/lv_course_4.css"
	type="text/css"/>
<link rel="stylesheet"
	href="static.mukewang.com/static/css/lv_course_5.css"
	type="text/css"/>

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/layui.css"  media="all">
<style type="text/css">
div.panel-body {
	background-color: #F3F5F7;
	margin: 5px;
}

.autowrap {
	border: none;
}
#img{
	width: 45%;
	height: 60%;
	float: right;
}
#lv_icon1{
	position: absolute;
	left: -5px;
	top: 20px;
}
#lv_icon3{
/* 	position: relative;
	left: 550px;
	top: 5px; */ 
	position: absolute;
	right: 0px;
	top: 25px;
}
#favorite:hover {
	cursor: pointer;
}
</style>
</head>

<body>

	<%@include file="head_black.jsp"%>


	<div id="main">

		<div class="course-infos">
			<div class="w pr">
			<%--	<div class="path">
					<a href="javascript:void(0)">课程</a>
					<i class="path-split">\</i>
					<a href="javascript:void(0)">Java</a>
					<i class="path-split">\</i>
					<a href="#">Java</a>

				</div>--%>
				<div class="hd clearfix">
					<h2 id="courseName" class="l">Java</h2>
				</div>

				<div class="statics clearfix"><h1>
					<div class="moco-btn l learn-btn green-btn red-btn">
						  <a href="video.jsp" class="J-learn-course" onclick="xuexi()">开始学习</a> <em></em>
					</div>
					<div class="static-item l">
						<span class="meta">学习人数</span> 
						<span id="courseLearnCount" class="meta-value js-learn-num">1032</span>
					</div>
					<div class="static-item l">
						<span class="meta">难度级别</span> 
						<span id="courseDifficulty" class="meta-value">3</span>
						<em></em>
					</div>
					<div class="static-item l">
						<span class="meta">课程时长</span> 
						<span id="courseLearnTime" class="meta-value">1小时35分</span> <em></em>
					</div>
					<div class="static-item l score-btn">
						<span class="meta">综合评分</span> 
						<span id="courseScore" class="meta-value">5</span>
						<em></em>
					</div>
					<div class="static-item l">
						<span class="meta">收藏</span> 
						<span id="favorite" class="meta-value">xx</span>
						<em></em>
					</div>
				</div>
				<div class="extra">
					<!-- credit -->
					<!-- share -->
					
				</div>
			</div>
			<div class="info-bg" id="js-info-bg">
				<div class="cover-img-wrap">
					<img data-src="img/55af49b300018ffc06000338.jpg" alt=""
						style="display: none" id="js-cover-img">
				</div>
				<div class="cover-mask"></div>
			</div>

		</div>

		<div class="course-info-main clearfix w">
			<div class="content-wrap">
				<div class="content">
					<!-- 课程简介 -->
					<div class="course-brief">
						<p class="auto-wrap" id="courseIntro">
							简介：JAVAJAVAJAVAJAVAJAVAJAVA</p>
					</div>
					<!-- 课程简介 end -->
					<div class="mod-tab-menu ">
						<ul class="course-menu clearfix">
							<li><a class="ui-tabs-active active" id="learnOn" onclick="zhangjie()">
							<span id="zxy_zhangjie">章节</span>
							</a></li>
							<li><a id="commentOn" class="">
							<span id="zxy_pinglun">评论</span></a></li>
							<li><a id="noteOn" class="">
							<span id="zxy_biji">笔记</span></a></li>
						</ul>
					</div>

					<!-- 课程章节 -->
					<div id="chapters" class="mod-chapters">

						<!-- 动态加载章节列表 -->

                    </div>
					<!-- 课程章节 end -->

					<!-- 评论开始 -->
					<!--发布评论   -->
					<div id="course_note">
						<ul class="mod-post" id="comment-list">
							<!-- 引入动态展示评论模块 -->

				
						</ul>
						<!-- 分页内容 -->

						<!-- <div class="M-box2"></div> -->

					</div>


					<!-- 评论结束 -->

					<!-- 笔记开始 -->
                    <div id="biji">
			 		<ul id="js-note-container" class="mod-post">
	
					
					</ul>

					<!-- 笔记结束 -->

				</div>

				<!--content-wrap end-->
				<div class="aside r ">
					<div class="bd ">
						<div class="js-recom-box ">
						
							<div class="box mb40 recom-course-list-box ">
								<h4>推荐课程</h4>
								<ul id="tuijian" class="js-recom-course recom-course-list clearfix ">
							
								
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="clear "></div>

		</div>
		<!-- 视频介绍 -->
		<div id="js-video-wrap " class="video pop-video "
			style="display: none">
			<div class="video_box " id="js-video "></div>
			<a href="javascript:; " class="pop-close icon-close "></a>
		</div>

	</div>

	<!-- 插入底部代码 -->

	<%@include file="footer_black.jsp"%>

</body>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
var id =null;
$(function(){
	$("#course_note").hide();
	$("#biji").hide();
	//获取url中的id值
	id = getQueryString("id");
	//加载课程基本详情
	loadCourseDetail(id);
	//加载章节列表
	loadCourseChapters(id);
	//加载推荐课程
	loadCourseTuijian(id);

});
//加载推荐课程
function loadCourseTuijian(id){
	$("#tuijian").html("");
	if(id != null){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/select/tuijian",
			type:"get",
			data:{"cId":id,"size":5},
			dataType:"json",
			success:function(result){
				//返回的课程信息
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var name = result[i].name;
					var intro = result[i].intro;
					var learnCount = result[i].learnCount;
					var difficulty = result[i].difficulty;
					var score = result[i].score;
					var learnCount = result[i].learnCount;
					var image = result[i].image;
					var str = '';
					str+='<li class="clearfix "><a href="course.html?id='+id+'" class="clearfix " >';
					str+='		<div class="l course-img " style="background-image: url('+ image+'';
                    str+=');"> ';
					str+='			<div class="cart-color purple "></div>';
					str+='		</div>';
					str+='		<div class="l content-box ">';
					str+='			<p class="smalle-title ">'+name+'</p>';
					str+='			<p class="content-text " title="asfsafsafsafsadfsafsad ">'+intro+'</p>';
					str+='			<div class="clearfix learn-detail ">';
					str+='				'+difficulty+'<span>·</span>'+learnCount+'人在学</div>';
					str+='		</div>';
					str+='</a></li>';
					$("#tuijian").append(str);
				}
			}
		});
	}
};





//加载章节列表
function loadCourseChapters(id){
    var videoFirst =null; //记录第一个视频id
	if(id != null){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-video/course/chapters",
			type:"get",
			data:{"cid":id},
			dataType:"json",
			success:function(result){
				//循环章节集合
				for(var i=0;i<result.length;i++){
					var chapterId = result[i].id;
					var chapterName = result[i].name;
					var videos = result[i].videos;
                    videoFirst =(result[0].videos[0]==null)?(result[1].videos[0].id):result[0].videos[0].id;
					//拼一个章节列表元素
					var str = '';
					str+='<div class="panel chapter">';
					str+='	<div class="panel-heading">';
					str+='		<h4 class="panel-title">';
					str+='			<a data-toggle="collapse" data-parent="javascript:void(0)" href="#">';
					str+='				<h3>';
					str+='					<img alt="" src="course/icon/lv_icon1.jpg"  id="lv_icon1">';
					str+='					<strong>';
					str+='						&nbsp;&nbsp;&nbsp;&nbsp;'+ chapterName ;
					str+='						<img alt="" src="course/icon/lv_icon2.jpg"  id="lv_icon2">';
					str+='					</strong>';
					str+='						<img alt="" src="course/icon/lv_icon3.jpg"  id="lv_icon3">';
					str+='				</h3>';
					str+='			</a>';
					str+='		</h4>';
					str+='	</div>';
					str+='	<div  class="panel-collapse">';
					for(var j=0;j<videos.length;j++){
						var videoId = videos[j].id;
						var videoName = videos[j].name;
						var videoUrl = videos[j].url;
						str+='		<div class="panel-body">';
						str+='			<a href="video.jsp?videoId='+ videoId +'">'+videoName;
						str+='				<button class="r moco-btn moco-btn-blue preview-btn" onclick="xuexi()">开始学习</button></a>';
						str+='		</div>';
					}		
					str+='	</div>';
					str+='</div>';
					//将元素添加到章节列表区
					$("#chapters").append(str);
					//开始学习 默认第一个视频
                    $(".J-learn-course").attr("href","video.jsp?videoId="+ videoFirst);
					
					
				}
				//为章节列表添加手风琴特效
				$("#chapters").slide({
					titCell:".panel-heading", 
					targetCell:".panel-collapse",
					defaultIndex:0,
					effect:"slideDown",
					delayTime:300,
					returnDefault:false});
			}
		});
	};
};


//获取url中的id值
function getQueryString(name) { 
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
    var r = window.location.search.substr(1).match(reg); 
    if (r != null) return unescape(r[2]); 
    return null; 
} 

function loadCourseDetail(id){
	if(id != null){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-course/course/"+id,
			type:"get",
			dataType:"json",
			success:function(result){
				//返回的课程信息
				if(result.code==1){
					alert(result.msg);
					window.history.back(-1);//返回上一页
				}else{
					var id = result.id;
					var name = result.name;
					var intro = result.intro;
					var learnCount = result.learnCount;
					var difficulty = result.difficulty;
					var score = result.score;
					var learnTime = result.learnTime;
					//设置显示
					$("#courseName").html(name);
					$("#courseIntro").html(intro);
					$("#courseLearnCount").html(learnCount);
					$("#courseDifficulty").html(difficulty);
					$("#courseScore").html(score);
					$("#courseLearnTime").html(learnTime);
				}
			}
		});
	}
};


 /* 章节、评论、笔记切换 */
 /* 点击章节时，章节标红 评论和笔记取消活跃且隐藏*/
 function zhangjie(){
	 $("#commentOn").attr("class","");
	 $("#noteOn").attr("class","");
	 $("#learnOn").attr("class","ui-tabs-active active");
	 $("#chapters").show();
	 $("#course_note").hide();
	 $("#biji").hide();
 }
 /* 点击评论时，评论标红 章节和笔记取消活跃且隐藏*/
 $("#commentOn").on('click',function(){
	 $("#commentOn").attr("class","ui-tabs-active active");
	 $("#noteOn").attr("class","");
	 $("#learnOn").attr("class","");
	 $("#course_note").show();
	 $("#chapters").hide();
	 $("#biji").hide(); 
  
  $.ajax({
			url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/evaluates",
			type:"get",
			data:{"cid":id,"size":10},
			dataType:"json",
			success:function(result){

				$("#comment-list").html("");
				//循环章节集合
				for(var i=0;i<result.length;i++){
					 var evaluateId = result[i].id;
					 var userId = result[i].useId;
					 var pTime = result[i].publishTime;
					 var publishTime = new Date(pTime).Format("yyyy-MM-dd hh:mm:ss")
					 var videoId = result[i].videoId;
					 var context = result[i].context;
					 var likeCount = result[i].likeCount;
					$.ajax({
						url:"http://127.0.0.1:9524/ovls-user/user/get/getUserInfo",
						type:"get",
						data:{"userId":userId},
						dataType:"json",
						async: false,
						success:function(resultUserInfo){
							//result表示服务器返回的json结果
					        var nickName = resultUserInfo.nickName;
							if(nickName==null||nickName==""){
								nickName ="匿名用户";
							}
                            var image = resultUserInfo.image==null?"avatars/xiaoxin.jpg":resultUserInfo.image;
					        //调用点赞 活跃的函数
					        loadZan(evaluateId);
							var str = '';
							str+='	<li class="post-row" id="63036">';
							str+='	<div class="media">';
							str+='		<a href="#" target="_blank"> ';
							str+='		<img src="'+ image +'"';
							str+='			width="40" height="40">';
							str+='		</a>';
							str+='	</div>';
							str+='	<div class="bd">';
							str+='		<div class="tit">';
							str+='			<a href="#" target="_blank">'+ nickName +'</a>';
							str+='		</div>';
							str+='		<p class="cnt">'+ context+'</p>';
							str+='		<div class="footer clearfix">';
							str+='			<span title="创建时间" class="l timeago">时间：'+publishTime;
							str+='			</span> <a onclick="zan(this.id)" id="'+ evaluateId +'" title="赞" class="js-pl-praise list-praise r" ';
							str+='				data-id="452768"> <img src="images/zan.png" ';
							str+='				id="lick_count_a'+ evaluateId +'"> <span id="zxy_like_count' + evaluateId + '">'+likeCount+'</span></a>';
							str+='		</div>';
							str+='	</div>';
							str+='	</li>';
							//将元素添加到章节列表区
							$("#comment-list").append(str);
							 
						}
					});
					
				}
					
				}
			});   
	 
 })

 
/* 点赞 将点赞信息传入数据库(删除或增加) 再修改点赞数*/
 function zan(evaluateId){
	    var eId =evaluateId;
	    var userId=localStorage.userId;
		var praise_img = $("#lick_count_a"+ eId +"");
		var praise_txt = $("#zxy_like_count"+eId +"");
		var num = parseInt(praise_txt.text());
		if(praise_img.attr("src") == ("images/yizan.png")){
			//取消点赞时 将evaluation_like表中的记录删除
		  $.ajax({
				url:"http://127.0.0.1:9524/ovls-evaluateandnote/delete/zan?evaluationId="+eId+"&userId="+userId,
				type:"DELETE",
				dataType:"json",
				async: false ,
				success:function(){
				  praise_img.attr("src","images/zan.png");
			      praise_txt.removeClass("hover");
				  num -=1;
				  praise_txt.text(num);
				}
		  })
		 }else{
			//点赞时 往evaluation_like表中增加记录
			  $.ajax({
					url:"http://127.0.0.1:9524/ovls-evaluateandnote/add/zan",
					type:"post",
					data:{"evaluationId":eId,"userId":userId},
					dataType:"json",
					async: false ,
					success:function(){
						praise_img.attr("src","images/yizan.png");
						praise_txt.addClass("hover");
						num +=1;
						praise_txt.text(num);
					}
			  })
		}	
		//最后将点赞数发送到后台 修改evaluate表中的like_count
		 $.ajax({
				url:"http://127.0.0.1:9524/ovls-evaluateandnote/update/evaluate",
				type:"put",
				data:{"id":eId,"likeCount":num},
				dataType:"json",
				async: false 
		  })
 }
 
 /* 当页面加载时 将evaluateId和userId传入后台，根据serid和evaluation_id在表evaluation_like中是否有记录，如果有，就激活赞 */
 function loadZan(evaluateId){
	 var userId = localStorage.userId;
	  $.ajax({
			url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/evaluatesByUserIdAndEvaluateId",
			type:"get",
			data:{"userId":userId,"evaluateId":evaluateId},
			dataType:"json",
			success:function(result){
				if(result !=0){
					var id=result.id;
					var eId=result.evaluationId;
					var likeTime=result.likeTime;
					var praise_img = $("#lick_count_a"+ eId +"");
					var praise_txt = $("#zxy_like_count"+eId +"");
					praise_img.attr("src","images/yizan.png");
					praise_txt.addClass("hover");
					$(".add-animation").addClass("hover");
				}
			}
	  })
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
 //点击笔记
 $("#noteOn").on('click',function(){
	 $("#commentOn").attr("class","");
	 $("#noteOn").attr("class","ui-tabs-active active");
	 $("#learnOn").attr("class","");
	 $("#course_note").hide();
	 $("#chapters").hide();
	 $("#biji").show();
	 $.ajax({
			url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/notes",
			type:"get",
			data:{"cid":id,"size":10},
			dataType:"json",
			success:function(result){
				$("#js-note-container").html("");
				//循环章节集合
				for(var i=0;i<result.length;i++){
					 var noteId = result[i].id;
					 var userId = result[i].userId;
					 var pTime = result[i].publishTime;
					 var publishTime = new Date(pTime).Format("yyyy-MM-dd hh:mm:ss");
					 var videoId = result[i].videoId;
					 var title = result[i].title;
					 var likeCount = result[i].likeCount;
					 if(likeCount==null){
					     likeCount=0;
                     }
					 var context = result[i].context;
                    //调用点赞 活跃的函数
                    loadNoteZan(noteId);
					$.ajax({
						url:"http://127.0.0.1:9524/ovls-user/user/get/getUserInfo",
						type:"get",
						data:{"userId":userId},
						dataType:"json",
						async: false,
						success:function(resultUserInfo){
						    if(resultUserInfo!=0){
							//result表示服务器返回的json结果
					        var nickName = resultUserInfo.nickName;
					        var image = resultUserInfo.image==null?"avatars/xiaoxin.jpg":resultUserInfo.image;
					        if(nickName==null){
								     nickName="匿名用户";
							     }
							//拼一个章节列表元素
							var str = '';
							/* str+='	<li class="post-row" id="63036">'; */
							str+='	<div class="media">';
							str+='<li id="1785838" class="post-row js-find-txt" courseid="36" noteId="1785838" authorid="5521765">';
							str+='	<div class="media">';
							str+='		<a href="/u/5521765/courses" target="_blank">';
							str+='		<img src="'+image+'" width="40" height="40"></a>';
							str+='	</div>';
							str+='	<div class="bd">';
							str+='		<div class="tit">';
							str+='			<a href="/u/5521765/courses" target="_blank">'+nickName+'</a>';
							str+='		</div>';
							str+='		<div class="js-notelist-content notelist-content mynote">';
							str+='			<pre class="autowrap"> '+ title +'</pre>';
							str+='			<div id="notelist" class="notelist-content">';
							str+='				<a  onclick="chakan(this.id)" id="ck'+ noteId  +'" class="js-toggle-content1">[ 查看全文 ]</a>';

                            str+='                  <div id="quanwenck'+ noteId +'" class="quanwen" style="padding:0px; background-color: #F2F2F2;">';
                            str+='                      <div class="layui-row layui-col-space15">';
                            str+='                          <div class="layui-col-md12">';
                            str+='                              <div class="layui-card">';
                            str+='                                  <div class="layui-card-header">'+ title +'</div>';
                            str+='                                      <div class="layui-card-body">'+ context +'';
                            str+='                                      </div>';
                            str+='                                  </div>';
                            str+='                             </div>';
                            str+='                      </div>';
                            str+='                  </div> ';
							str+='			</div>';
							str+='		</div>';
							str+='		<div class="clearfix">';
							str+='			<input class="moco-btn moco-btn-green sava_btn" type="button" value="保存">';
							str+='		</div>';
							str+='		<div class="footer clearfix">';
							str+='			<span title="" class="l timeago">时间：'+publishTime+'</span>';
							str+='			<a href="/code/412" class="from l"></a>';
							str+='			<div class="actions r">';
							str+='				<textarea style="display: none;"> '+ context+'</textarea>';
							str+='				<a onclick="shoucang(this.id)" id="'+ noteId +'" title="收藏" ';
							str+='					class="Jcollect post-action " data-mid="412|5521765"> <i>收藏&nbsp;&nbsp;</i>';
							str+='			</a> &nbsp;&nbsp;<a onclick="Notezan(this.id)" id="'+ noteId  +'" title="赞" class="js-pl-praise list-praise r" ';          str+='				data-id="452768"> <img src="images/zan.png" ';
                            str+='				id="note_lick_count_a'+ noteId  +'"> <span id="note_like_count' + noteId  + '">'+likeCount+'</span></a>';
							str+='			</div>';
							str+='		</div>';
							str+='	</div>';
							str+='</li>';
							//将元素添加到章节列表区
							$("#js-note-container").append(str);
							$(".quanwen").hide();
							
						}
                        }
					});
					
				}
					
				}
     });
	
 })

//收藏笔记
function shoucang(noteId){
    var userId=localStorage.userId;
    $.ajax({
        url:"http://127.0.0.1:9524/ovls-evaluateandnote/add/collectNote",
        type:"post",
        data:{"noteId":noteId,"userId":userId},
        dataType:"json",
        async: false ,
        success:function(result){
            if(result!=0){
                if (result== -1){
                    layer.tips('收藏夹中已存在', '#'+noteId);
                }else{
                    layer.tips('收藏成功', '#'+noteId);
                }

            }

        }
    })

}

    //显示与隐藏笔记全文
function chakan(Id){
     if($("#"+Id+"").text()==="[ 查看全文 ]"){
         $("#"+Id+"").text("[ 隐藏全文 ]");
         $("#quanwen"+Id+"").show();
     }else {
         $("#"+Id+"").text("[ 查看全文 ]");
         $("#quanwen"+Id+"").hide();
     }
}

/* 点赞 将点赞信息传入数据库(删除或增加) 再修改点赞数----笔记*/
function Notezan(noteId){
    var noteId =noteId;
    var userId=localStorage.userId;
    var praise_img = $("#note_lick_count_a"+ noteId +"");
    var praise_txt = $("#note_like_count"+noteId +"");
    var num = parseInt(praise_txt.text());
    if(praise_img.attr("src") == ("images/yizan.png")){
        //取消点赞时 将note_like表中的记录删除
        $.ajax({
            url:"http://127.0.0.1:9524/ovls-evaluateandnote/delete/noteZan?noteId="+noteId+"&userId="+userId,
            type:"DELETE",
            dataType:"json",
            async: false ,
            success:function(){
                praise_img.attr("src","images/zan.png");
                praise_txt.removeClass("hover");
                num -=1;
                praise_txt.text(num);
            }
        })
    }else{
        //点赞时 往note_like表中增加记录
        $.ajax({
            url:"http://127.0.0.1:9524/ovls-evaluateandnote/add/noteZan",
            type:"post",
            data:{"noteId":noteId,"userId":userId},
            dataType:"json",
            async: false ,
            success:function(){
                praise_img.attr("src","images/yizan.png");
                praise_txt.addClass("hover");
                num +=1;
                praise_txt.text(num);
            }
        })
    }
    //最后将点赞数发送到后台 修改note表中的like_count
    $.ajax({
        url:"http://127.0.0.1:9524/ovls-evaluateandnote/update/note",
        type:"put",
        data:{"id":noteId,"likeCount":num},
        dataType:"json",
        async: false
    })
}


/* 当页面加载时 将noteId和userId传入后台，根据userid和note_id在表note_like中是否有记录，如果有，就激活赞 */
function loadNoteZan(noteId){
    var userId = localStorage.userId;
    $.ajax({
        url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/notesByUserIdAndNoteId",
        type:"get",
        data:{"userId":userId,"noteId":noteId},
        dataType:"json",
        success:function(result){
            if(result !=0){
                var id=result.id;
                var noteId=result.noteId;
                var likeTime=result.likeTime;
                var praise_img = $("#note_lick_count_a"+ noteId +"");
                var praise_txt = $("#note_like_count"+noteId +"");
                praise_img.attr("src","images/yizan.png");
                praise_txt.addClass("hover");
                //$(".add-animation").addClass("hover");
            }
        }
    })
}


/* 点击时 将此课程存入到数据库  学习记录 */
function xuexi(){
    //获取连接中的 id
    var courseId = getQueryString("id");
    var userId = localStorage.userId;
    $.ajax({
        url:"http://127.0.0.1:9524/ovls-course/add/collectCourse",
        type:"post",
        data:{"userId":userId,"courseId":courseId},
        dataType:"json"
    })
}
</script>



</html>