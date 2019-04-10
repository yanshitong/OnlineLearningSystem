<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.elegant-aero {
	margin-left: auto;
	margin-right: auto;
	max-width: 500px;
	background: #D2E9FF;
	padding: 20px 20px 20px 20px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #666;
}

.elegant-aero h1 {
	font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
	padding: 10px 10px 10px 20px;
	display: block;
	background: #C0E1FF;
	border-bottom: 1px solid #B8DDFF;
	margin: -20px -20px 15px;
	text-align: center;
}

.elegant-aero h1>span {
	display: block;
	font-size: 11px;
}

.elegant-aero label>span {
	float: left;
	margin-top: 10px;
	color: #5E5E5E;
}

.elegant-aero label {
	display: block;
	margin: 0px 0px 5px;
}

.elegant-aero label>span {
	float: left;
	width: 20%;
	text-align: right;
	padding-right: 15px;
	margin-top: 10px;
	font-weight: bold;
}

.elegant-aero input[type="text"], .elegant-aero input[type="email"],
	.elegant-aero textarea, .elegant-aero select {
	color: #888;
	width: 70%;
	padding: 0px 0px 0px 5px;
	border: 1px solid #C5E2FF;
	background: #FBFBFB;
	outline: 0;
	-webkit-box-shadow: inset 0px 1px 6px #ECF3F5;
	box-shadow: inset 0px 1px 6px #ECF3F5;
	font: 200 12px/25px Arial, Helvetica, sans-serif;
	height: 30px;
	line-height: 15px;
	margin: 2px 6px 16px 0px;
}

.elegant-aero textarea {
	height: 100px;
	padding: 5px 0px 0px 5px;
	width: 100%;
}

.elegant-aero .button {
	padding: 10px 30px 10px 30px;
	background: #66C1E4;
	border: none;
	color: #FFF;
	box-shadow: 1px 1px 1px #4C6E91;
	-webkit-box-shadow: 1px 1px 1px #4C6E91;
	-moz-box-shadow: 1px 1px 1px #4C6E91;
	text-shadow: 1px 1px 1px #5079A3;
}

.elegant-aero .button:hover {
	background: #3EB1DD;
}
</style>

</head>
<body >
       
	<form action=""  class="elegant-aero">
		<h2>写点什么吧</h2>
		<label>
		  <input id="titleName" type="text" name="name" placeholder="请输入笔记标题"  />
		</label>
		<label> <textarea id="message" name="message"
				placeholder="请您输入笔记内容"></textarea>
		</label> <label style="margin-left: 100px;"> <span>&nbsp;</span> 
		<input onclick="subNote()" type="button" class="button" value="提 交"/>
		</label>
	</form>


</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript">
//获取url中的id值
function getQueryString(name) { 
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
    var r = window.location.search.substr(1).match(reg); 
    if (r != null) return unescape(r[2]); 
    return null; 
} 

//提交笔记
function subNote(){
	vid = getQueryString("videoId");
	var title = $("#titleName").val();
	var context = $("#message").val();
	var userId = localStorage.userId;
	 $.ajax({
			url:"http://127.0.0.1:9524/ovls-evaluateandnote/post/notes",
			type:"post",
			data:{"context":context,"videoId":vid,"userId":userId,"title":title},
			dataType:"json",
			success:function(result){
			    	$("#titleName").val("");
				    $("#message").val("");
				   //提示层
				   layer.alert('笔记添加成功', { icon: 1},function(){
		                parent.location.reload()});				  
				 
				}
	 })
}

</script>
</html>