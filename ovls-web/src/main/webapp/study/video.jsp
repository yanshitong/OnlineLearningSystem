<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎学习</title>
<link rel="stylesheet" href="css/a.css">
<link rel="stylesheet" href="css/jquery.css">
<link rel="stylesheet" href="css/layer.css">
<link rel="stylesheet" href="css/share_style0_16.css">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/willesPlay.css" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/willesPlay.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"  src="layer/layer.js" charset="utf-8"></script>
<!-- 网页标题栏图标 -->
<link rel="SHORTCUT ICON" href="favicon.ico"/>
<!-- 笔记编辑框样式 -->
<style type="text/css">
.wys_context{
    width: 350px;
	height: 110px;
	border: 1px solid #8B9CAF;
}
    
/*评论成功提示的样式*/
#showResult {
	position: absolute;
	visibility: hidden;
	overflow: hidden;
	border: 1px solid #CCC;
	background-color: #F9F9F9;
	border: 1px solid #333;
	padding: 5px;
}
</style>
</head>
<body>
	
	 <%@include file="head_black.jsp" %>
	
	<div id="studyMain">
		<div id="bgarea" class="video-con">
			<div class="js-box-wrap" style="width: 100%; height: 611px;">
				<div id="J_Box" class="course-video-box">

					<!-- 视频播放器 -->
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div id="willesPlay">
									<div class="playHeader">
										<div class="videoName">Oracle</div>
									</div>
									<div class="playContent">
										<div class="turnoff">
											<ul>
												<li><a href="javascript:;" title="关灯"
													class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
												<li><a href="javascript:;" title="分享"
													class="glyphicon glyphicon-share"></a></li>
											</ul>
										</div>
										<video width="100%" height="100%" id="playVideo"> 
											<source src="" type="video/mp4"></source>
										 </video>
										<div class="playTip glyphicon glyphicon-play"></div>
									</div>
									<div class="playControll">
										<div class="playPause playIcon"></div>
										<div class="timebar">
											<span class="currentTime">0:00:00</span>
											<div class="progress">
												<div
													class="progress-bar progress-bar-danger progress-bar-striped"
													role="progressbar" aria-valuemin="0" aria-valuemax="100"
													style="width: 0%"></div>
											</div>
											<span class="duration">0:00:00</span>
										</div>
										<div class="otherControl">
											<span class="volume glyphicon glyphicon-volume-down"></span>
											<span class="fullScreen glyphicon glyphicon-fullscreen"></span>
											<div class="volumeBar">
												<div class="volumewrap">
													<div class="progress">
														<div class="progress-bar progress-bar-danger"
															role="progressbar" aria-valuemin="0" aria-valuemax="100"
															style="width: 8px; height: 40%;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="text-align: center; clear: both;"></div>

				</div>
			</div>




			<!--此处结构为练习题，视频，编程公用的侧栏-->
			<div class="section-list">

				<!-- 视频右侧笔记  提问 框 -->
				<div class="operator">
					
					<div class="op notes" id="wys_note">
						<em class="icon-note"></em>笔记
					</div>
					<%--<div class="op question" id="wys_question">--%>
						<%--<em class="icon-addques"></em>提问--%>
					<%--</div>--%>
					
				</div>


				<div class="nano has-scrollbar">
					
					<!-- 弹出笔记框 记笔记 -->
					<div class="nano-pane">
						<div class="nano-slider"
							style="height: 286px; transform: translate(0px, 0px);"></div>
					</div>
				</div>

			</div>
			<!--练习题，视频，编程公用的侧栏 结束 -->

		</div>
		

	</div>
	<!-- studentmain 结束 -->
	
			<!-- 评论/问答/笔记切换函数结束 -->

	<div class="course-subcontainer clearfix">
		<!-- 视频下 的   评论 问答 笔记  选项 -->
		<div class="course-left">
			<ul class="course-menu course-video-menu clearfix js-course-menu"
				data-ower="my" data-sort="last"
				style="position: absolute; left: 0px;">
				<li onclick="wys_pl()" class="course-menu-item" id="zxy_01"><a class=""
					 id="plMenu">评论</a></li>
				<%--<li onclick="wys_wd()" class="course-menu-item" id="gz_01"><a id="qaMenu" class="">问答</a></li>--%>
				<li onclick="wys_bj()" class="course-menu-item" id="wys_01">
					<a id="noteMenu" class="">笔记</a>
				</li>
			</ul>
			

			<div id="disArea" class="lists-container list-wrap">
				<!-- 评论部分 -->
				<div id="pl-content" class="list-tab-con" style="display: none;">
					<!-- 评论框 -->
				       <!-- 动态加载当前用户头像 -->
				       <div class="publish clearfix" id="discus-publish">
						<div class="publish-wrap publish-wrap-pl">
						<div class="pl-input-wrap clearfix">
							<a href="#" class="user-head l"> <img id="headImg" src="images/xiaoxin.jpg" alt="用户名">
							</a>

							<div>
					<textarea style="resize: none;float: right;margin: 0px 25px;width: 690px;height: 100px;border: 1px solid rgba(160, 160, 160, 0.8);border-radius: 3px;" id="textContext" class="js-placeholder" placeholder="扯淡、吐槽、表扬、鼓励……想说啥就说啥！" required></textarea>
					<br /> <br /> <input onclick="zxy_eva_Context()" id="subContext" class="r course-btn" type="button" value="提交评论" />
						</div>
						<div id="showResult"></div>
					</div>

                  </div>
              </div>
					<!-- 评论框 结束 -->

					<div id="plLoadListData">
						<!-- 评论展示 -->
						<div class="pl-container">
							<ul >
								<!-- 此DIV块 绑定了事件，可以通过点击“评论”局部刷新获取数据库中该视频的评价列表 -->
								<div id="pinglunDiv"></div>
							</ul>
						</div>
						<!-- 评论展示结束 -->
					</div>
				</div>
				<!-- 评论部分结束 -->

				<!-- 问答模块  -->
				<div id="qa-content" class="list-tab-con" style="display: none;">
					<div id="qaLoadListData">
						<div class="answertabcon">
							<p class="unquestion">此节暂无同学的问答</p>
						</div>
						<div class="page discuss-list-page">分页</div>
					</div>
				</div>
				<div id="qa-content" class="list-tab-con" style="display: block;">
					<div id="qaLoadListData">

						
						<div class="page discuss-list-page"></div>
					</div>  

				</div>
				
					
				<!-- 问答模块 结束 -->

				<!-- 笔记模块  -->
				<div id="note-content" class="list-tab-con" style="">
					<div id="noteLoadListData">
						<div class="course-tool-bar clearfix js-select-state">
							
                             <!-- 笔记滑动开关 -->							
								<div class="tool-right r" style="margin-top: -35px;">
								<!-- 查看笔记选择分类   -->
								<div class="switch-box" >                 
									 <input id="default" class="switch-box-input" type="checkbox" onclick="choose1(this)"/><!--顺序 userId  video_id -->
									 <label for="default" class="switch-box-slider" id="Label1" ></label>
									 <label for="default" class="switch-box-label " id="Label2"  >只看我的</label>
								</div>
							</div>
						</div>

						<div id="course_note" class="course_note">
							<div class="unnote">
								<p>此节暂无同学记录过笔记</p>
							</div>
						</div>
						<div id="course_note" class="course_note">
							<ul id="wys_Notes">
							     <!-- 我的笔记 -->

									</ul>
								</div>

						<div class="page note-list-page"></div>
					</div>
				</div>
				<!-- 笔记模块结束 -->

			</div>

		</div>
		<!-- 视频下 的   评论 问答 笔记  选项 结束  -->

		<div class="course-right clearfix">
			<!-- 大家都关注 + 推荐课程  的部分 -->
			<div class="js-recom-box">

				<!-- 推荐课程 的部分   个数自己定-->
				<div class="box mb40 recom-course-list-box">
					<h4>推荐课程</h4>
					<ul class="js-recom-course recom-course-list clearfix">
						<li class="clearfix"><a href="javascript:void(0)" class="clearfix"
							 >
								<div class="l course-img" style="background-image: url(#);">
									<div class="cart-color blue"></div>
								</div>
								<div class="l content-box">
									<p class="smalle-title">初识机器学习-理论篇</p>
									<p class="content-text" title="标题..  ">推荐理由</p>
									<div class="clearfix learn-detail">
										初级<span>·</span>52183人在学
									</div>
								</div>
						</a></li>
						
					</ul>
				</div>
				<!-- 推荐课程 的部分   结束-->
			</div>
			<!-- 笔记推荐 部分 -->
			<div class="articlelist js-right-article" style="display: block;">
				<div class="course-right-title">
					<h3>手记推荐</h3>
					<a href="javascript:void(0)"
						  class="more">更多</a>
				</div>
				<div class="course-right-content"></div>
				<ul>
					<li><a href="javascript:void(0)"  >python关键知识点之--__new__与__init__与super
					</a></li>
					<li><a href="javascript:void(0)"  >逻辑判断需要注意运算的法则</a></li>
					<li><a href="javascript:void(0)"  >学习python中 面向对象</a></li>
					<li><a href="javascript:void(0)"  >除了 Python ，这些语言也可以写机器学习项目</a></li>
				</ul>
			</div>
			<!-- 笔记推荐 部分结束 -->
		</div>
	</div>

	<!-- 底部内容  -->
	<div id="footer">
		<%@include file="footer_black.jsp" %>
	</div>
	<!-- 底部内容结束   -->

	<!--问答弹出框 通用-->	
	<div id="video_mark" class="video_mark" style="display: none;"></div>

	<div class="moco-usercard-dialog js-moco-usercard-modal"></div>

<!-- 提问 笔记 弹出层事件函数 -->


<script type="text/javascript">


//提交评论和直接显示
function zxy_eva_Context(){
	var context = $("#textContext").val();
	var userId = localStorage.userId;
	var nickName =localStorage.nickName;
	var image =localStorage.image;
	 $.ajax({
			url:"http://127.0.0.1:9524/ovls-evaluateandnote/post/evaluates",
			type:"post",
			data:{"context":context,"videoId":vid,"useId":userId},
			dataType:"json",
			success:function(result){
				 $("#textContext").val("");
				   //提示层
				   layer.msg('评论发表成功');
				   if(nickName==null){
					   nickName="匿名用户";
				   }
				   //拼一个章节列表元素
					var str = '';
					str+='<div class="wenda-listcon clearfix">';
					str+='<div class="headslider l">';
					str+='	<a href="#" class="wenda-head" title="'+nickName+'">';
					str+='		<img src="'+image+'" alt="'+nickName+'" width="40"> ';
					str+='		<i class="icon-ques-revert nofinish"></i>';
					str+='	</a>';
					str+='</div>';
					str+='<div class="wendaslider">';
					str+='	<h2 class="wendaquetitle">';
					str+='		<a href="#" title="'+nickName+'" class="wenda-nickname">'+nickName+'</a>';
					str+='		<div class="wendatitlecon">';
					str+='			<a href="#" class="wendatitle"> <b> '+context+'</b>';
					str+='			</a>';
					str+='		</div>';
					str+='	</h2>';
					str+='</div>';
					str+='</div>';
					//将元素添加到章节列表区
					$("#pinglunDiv").prepend(str);
				 
				}
	 })
}

</script>


<script type="text/javascript">
var vid =null;
$(function(){
	//用户照片
	var image = localStorage.image;
	$("#headImg").attr("src",image);
		//获取url中的id值
	vid = getQueryString("videoId");
	//根据视频id往数据库中查询视频的url进行更换
	loadVideo(vid);
	
}); 

function loadVideo(vid){
	var videoUrl= null;
	//加载数据库中视频url
	  $.ajax({
				url:"http://127.0.0.1:9524/ovls-video/video/loadVideoByVid",
				type:"get",
				data:{"vid":vid},
				dataType:"json",
				success:function(result){
					$(".videoName").html(result.name);
					//要改video元素的src属性，不是改source元素
					videoUrl = result.url;
					$("#playVideo").attr("src",videoUrl);
				}
	  });   
}




//获取url中的id值
function getQueryString(name) { 
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
    var r = window.location.search.substr(1).match(reg); 
    if (r != null) return unescape(r[2]); 
    return null; 
} 

//评论/问答/笔记切换函数开始 
$(function(){
    	wys_pl();
 })
  function wys_pl(){
    	$("#pl-content").show();
    	$("#qa-content").hide();
    	$("#note-content").hide();
    	
    	$("#plMenu").css("color", "red");
    	$("#qaMenu").css("color", "#4D555D");
    	$("#noteMenu").css("color", "#4D555D");
    	//加载数据库中的评论
    	  $.ajax({
    				url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/evaluatesByvid",
    				type:"get",
    				data:{"size":10,"vid":vid},
    				dataType:"json",
    				success:function(result){
    					$("#pinglunDiv").html("");
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
    		                        if(resultUserInfo.nickName == null){
    		                        	var nickName = "匿名用户";
    		                        }else{
    		                        	nickName =resultUserInfo.nickName;
    		                        }
                                    var image = resultUserInfo.image==null?"avatars/xiaoxin.jpg":resultUserInfo.image;
    								//拼一个章节列表元素
    								var str = '';
    								str+='<div class="wenda-listcon clearfix">';
    								str+='<div class="headslider l">';
    								str+='	<a href="#" class="wenda-head" title="'+ nickName +'">';
    								str+='		<img src="'+image+'" alt="'+ nickName +'" width="40"> ';
    								str+='		<i class="icon-ques-revert nofinish"></i>';
    								str+='	</a>';
    								str+='</div>';
    								str+='<div class="wendaslider">';
    								str+='	<h2 class="wendaquetitle">';
    								str+='		<a href="#" title="'+nickName+'" class="wenda-nickname">'+nickName+'</a>';
    								str+='		<div class="wendatitlecon">';
    								str+='			<a href="#" class="wendatitle"> <b> '+context+'</b>';
    								str+='			</a>';
    								str+='		</div>';
    								str+='	</h2>';
    								str+='</div>';
    								str+='</div>';
    								//将元素添加到章节列表区
    								$("#pinglunDiv").append(str);
    							}
    						});
    						
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
    
/*    function wys_wd(){
    	$("#pl-content").hide();
    	$("#qa-content").show();
    	$("#note-content").hide();
    	
    	$("#plMenu").css("color", "#4D555D");
    	$("#qaMenu").css("color", "red");
    	$("#noteMenu").css("color", "#4D555D");
    	
    };
    */
    function wys_bj(){
    	$("#pl-content").hide();
    	$("#qa-content").hide();
    	$("#note-content").show();
    	$("#plMenu").css("color", "#4D555D");
    	$("#qaMenu").css("color", "#4D555D");
    	$("#noteMenu").css("color","red");
    	//加载数据库中的笔记
  	  $.ajax({
  				url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/NotesByvid",
  				type:"get",
  				data:{"size":10,"vid":vid},
  				dataType:"json",
  				success:function(result){
  					/* $("#noteLoadListData").html(""); */
  					 $("#course_note").html(""); 
  					//循环章节集合
  					for(var i=0;i<result.length;i++){
  						 var noteId = result[i].id;
  						 var userId = result[i].userId;
  						 var pTime = result[i].publishTime;
  						 var publishTime = new Date(pTime).Format("yyyy-MM-dd hh:mm:ss");
  						 var videoId = result[i].videoId;
  						 var context = result[i].context;
  						 var likeCount = result[i].likeCount;
  						 var title = result[i].title; 
  						$.ajax({
  							url:"http://127.0.0.1:9524/ovls-user/user/get/getUserInfo",
  							type:"get",
  							data:{"userId":userId},
  							dataType:"json",
  							async: false,
  							success:function(resultUserInfo){
  								//result表示服务器返回的json结果
  						        var nickName = resultUserInfo.nickName;
  						        if(nickName==null){
  								     nickName="匿名用户";
  							     }
                                var image = resultUserInfo.image==null?"avatars/xiaoxin.jpg":resultUserInfo.image;
  								//拼一个章节列表元素
  								var str = '';
  								str+='<div class="wenda-listcon clearfix">';
  								str+='<div class="headslider l">';
  								str+='	<a href="#" class="wenda-head" title="'+nickName+'">';
  								str+='		<img src="'+image+'" alt="'+nickName+'" width="40"> ';
  								str+='		<i class="icon-ques-revert nofinish"></i>';
  								str+='	</a>';
  								str+='</div>';
  								str+='<div class="wendaslider">';
  								str+='	<h2 class="wendaquetitle">';
  								str+='		<a href="#" title="'+nickName+'" class="wenda-nickname">'+nickName+'</a>';
  								str+='		<div class="wendatitlecon">';
  								str+='			<a href="#" class="wendatitle"> <b> '+title+'</b>';
  								str+='			</a>';
  								str+='		</div>';
  								str+='	</h2>';
  								str+='</div>';
  								str+='</div>';
  								//将元素添加到章节列表区
  								$("#course_note").append(str);
  							}
  						});
  						
  					}
  						
  					}
  				});   
    	
    };

/*
 *提问弹出层函数
 */

 $(document).on('click', '#wys_question', function() {
	 layer.open({ 
         type : 2,
         border : [1 , 1 , 'gray', true],  
         //shade: 0, 
         shadeClose:true,
         title : ['<div style="text-align: center">提 问</div >',true],  
         content:'questions.jsp',
         area : ['500px' , '420px'],  
         offset : ['100px',''], 
         resize:false
     });  
	 
	 
	});
/*
 *笔记弹出层
 
 */

 $(document).on('click', '#wys_note', function() {
	 layer.open({ 
         type : 2,
         border : [1 , 1 , 'gray', true],  
         shadeClose:true,
         title : ['<div style="text-align: center">笔 记</div >',true],  
         content:'self_note.jsp?videoId='+vid,
         area : ['500px' , '320px'],  
         offset : ['100px',''], 
         resize:false
     }); 
	});


 /* 笔记中只看我的*/
 function choose1(checkbox){
   if (checkbox.checked == true){
 	  var userId = localStorage.userId;
 	  $.ajax({
 			url:"http://127.0.0.1:9524/ovls-evaluateandnote/get/evaluatesByvidAndUserId",
 			type:"get",
 			data:{"size":10,"videoId":vid,"userId":userId},
 			dataType:"json",
 			success:function(result){
 				/* $("#noteLoadListData").html(""); */
 				 $("#course_note").html(""); 
 				if(result==0){
 				   layer.msg('您暂未添加笔记');
 				}else{
 					
 				//循环章节集合
	 				for(var i=0;i<result.length;i++){
	 					 var noteId = result[i].id;
	 					 var userId = result[i].userId;
	 					 var pTime = result[i].publishTime;
	 					 var publishTime = new Date(pTime).Format("yyyy-MM-dd hh:mm:ss");
	 					 var videoId = result[i].videoId;
	 					 var context = result[i].context;
	 					 var likeCount = result[i].likeCount;
	 					 var title = result[i].title;
	 					$.ajax({
	 						url:"http://127.0.0.1:9524/ovls-user/user/get/getUserInfo",
	 						type:"get",
	 						data:{"userId":userId},
	 						dataType:"json",
	 						async: false,
	 						success:function(resultUserInfo){
	 							//result表示服务器返回的json结果
	 					        var nickName = resultUserInfo.nickName;
	 					        var image = resultUserInfo.image;
	 					        var name =resultUserInfo.name;
	 							//拼一个章节列表元素
	 							var str = '';
	 							str+='<div class="wenda-listcon clearfix">';
	 							str+='<div class="headslider l">';
	 							str+='	<a href="#" class="wenda-head" title="'+name+'">';
	 							str+='		<img src="'+image+'" alt="'+name+'" width="40"> ';
	 							str+='		<i class="icon-ques-revert nofinish"></i>';
	 							str+='	</a>';
	 							str+='</div>';
	 							str+='<div class="wendaslider">';
	 							str+='	<h2 class="wendaquetitle">';
	 							str+='		<a href="#" title="'+name+'" class="wenda-nickname">'+name+'</a>';
	 							str+='		<div class="wendatitlecon">';
	 							str+='			<a href="#" class="wendatitle"> <b> '+title+'</b>';
	 							str+='			</a>';
	 							str+='		</div>';
	 							str+='	</h2>';
	 							str+='</div>';
	 							str+='</div>';
	 							//将元素添加到章节列表区
	 							$("#course_note").append(str);
	 						}
	 					});
	 					
	 				  }
 			     	}	
 				}
 			});   
 	  
   }else{
 	  wys_bj();
   }
  
 }


</script>

</body>
</html>