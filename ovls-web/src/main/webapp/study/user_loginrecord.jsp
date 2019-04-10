<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息页面</title>
<link rel="stylesheet" href="css/common-less.css" type="text/css">
<link rel="stylesheet" href="css/profile-less.css" type="text/css">
<link rel="stylesheet" href="css/oplog-less.css" type="text/css">
<link rel="stylesheet" href="css/base.css" type="text/css">

<!-- 网页标题栏图标 -->
	<link rel="SHORTCUT ICON" href="favicon.ico"/>
<script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript">
	$(function(){
		//加载登录信息
		loadLonginInfo();
	});

	//加载登录信息
	function loadLonginInfo(){
		var userId = localStorage.userId;
		var token = localStorage.token;
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-user/user/get/getLonginInfo",
			type:"get",
			data:{"userId":userId,"token":token},
            headers:{
                "id":userId,
                "token":token
            },
			dataType:"json",
			success:function(result){
				//登录的历史记录
				for(var i=0;i<result.length;i++){
					var id = result[i].id;
					var loginTime = result[i].loginTime;
					var curTime = new Date(loginTime).Format("yyyy-MM-dd hh:mm:ss");
					var city = result[i].city;
					var ip = result[i].ip;
					var str = '';
				    str+='<tr>';
				    str+='<td>账号登录</td>';
				    str+='<td>'+curTime+'</td>';
				    str+='<td>'+city+'</td>';
				    str+='<td>'+ip+'</td>';
				    str+='<td>web</td>';
				    str+=' </tr>';
					//将课程元素添加到显示区
					$("#tr").append(str);
				}
			}
		});
	};
	
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
<!-- 这是显示隐藏 -->
<style type="text/css">
.M-box2 {
	bottom: 22px;
}
.img_sousuo {
		position: relative;
		left: -25px;
	    top:12px;
	}
/* #layui-layer100001{
	z-index: 19991015;
	width: 330px;
	height: 330px;
	top: 62px;
	left: 1270px;
}  */
.icon-right2{

	position: absolute;
	top: 18px;

}
#yyy_name,#yyy_oldpass,#yyy_newpass,#yyy_submitpass{
  width:400px;
}
#yyy_img{
  width:40px;
}
#yyy_submit{

	margin: 0 0 0 300px;

}
.lv_icon_right{
	position: relative;
	top: 16px;
}

</style>
<link rel="stylesheet" href="style/pagination.css" type="text/css" media="screen">
 

<!-- 头像上传脚本 -->
<link rel="stylesheet" type="text/css" href="css/font-awesome.4.6.0.css">
<link rel="stylesheet" href="css/amazeui.min.css">
<link rel="stylesheet" href="css/amazeui.cropper.css">
<link rel="stylesheet" href="css/custom_up_img.css">
</head>
<body>

    <%@include file="head_black.jsp" %>
    <!-- 页头结束 -->

<div id="main">

<div class="settings-cont clearfix">
  <div class="setting-left l" >
    <div class="avator-wapper">
      <div class="avator-mode" >
        <img id="up-img-touch" onmouseover="mOver()" class="avator-img" alt="图片去哪里啦?" src="img/Java.png"  width="92" height="92">
      </div>
      
            <!-- 头像上传插件代码开始 -->
      <div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog up-frame-parent up-frame-radius">
	<div class="am-modal-hd up-frame-header">
	   <label>修改头像</label>
	  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	</div>
	<div class="am-modal-bd  up-frame-body">
	  <div class="am-g am-fl">
		<div class="am-form-group am-form-file">
		  <div class="am-fl">
			<button type="button" class="am-btn am-btn-default am-btn-sm">
			  <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
		  </div>
		  <input type="file" id="inputImage">
		</div>
	  </div>
	  <div class="am-g am-fl" >
		<div class="up-pre-before up-frame-radius">
			<img alt="" src="" id="image" >
		</div>
		<div class="up-pre-after up-frame-radius">
		</div>
	  </div>
	  <div class="am-g am-fl">
		<div class="up-control-btns">
			<span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
			<span class="am-icon-rotate-right" onclick="rotateimgright()"></span>
			<span class="am-icon-check" id="up-btn-ok" url="#"></span>
		</div>
	  </div>
	  
	</div>
  </div>
</div>

<!--加载框-->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  <div class="am-modal-dialog">
	<div class="am-modal-hd">正在上传...</div>
	<div class="am-modal-bd">
	  <span class="am-icon-spinner am-icon-spin"></span>
	</div>
  </div>
</div>

<!--警告框-->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
	<div class="am-modal-hd">信息</div>
	<div class="am-modal-bd"  id="alert_content">
			  成功了
	</div>
	<div class="am-modal-footer">
	  <span class="am-modal-btn">确定</span>
	</div>
  </div>
</div>
      <!-- 头像上传插件代码结束 -->
      <div class="des-mode">
          <p id="name95"></p>
        <dl class="js-auth-list clearfix auth-list">
        </dl>
      </div>
    </div>

     <div class="list-wapper">
      <h2>账户管理</h2>
      <div class="line"></div>
      <ul class="menu">
        <li><a href="user_changepwd.jsp">密码修改<span class="arr">
        <img alt=""  src="images/lv_icon5.jpg" class="lv_icon_right">
        </span></a>
        </li>
        <li><a href="user_center.jsp">个人信息<span class="arr">
        <img alt=""  src="images/lv_icon5.jpg" class="lv_icon_right">
        </span></a></li>
        <li><a href="user_loginrecord.jsp">登录记录<span class="arr">
        <img alt=""  src="images/lv_icon5.jpg" class="lv_icon_right">
        </span></a></li>
        </ul>
    </div>
  </div>
  
<!-- 主体右部开始 -->

<!-- 主体右部登录记录开始 -->
<div id="record" class="setting-right">
    <div class="setting-right-wrap wrap-boxes settings">
        
<div class="page-settings">
    <div class="common-title">
        &nbsp;&nbsp;&nbsp;&nbsp;操作记录<span class="title-tips">通过查看操作类型、登录时间、登录地点和设备可以判断账号是否正常</span>
    </div>
    <div class="line"></div>
    <div class="setting ">
        <div class="contentBox">
            <table class="oplog-list" id="tr">
                <tbody><tr>
                    <th>类型</th>
                    <th>登录时间</th>
                    <th>城市</th>
                    <th>IP</th>
                    <th>登录设备</th>
                </tr>
          		
           		</tbody></table>
        </div>
     </div>
</div>

</div>
 
  </div>

<!-- 主体右部操作记录结束 -->
<!-- 主体右部结束 -->
</div>
<!-- 主体结束 -->
</div>
<!-- 页脚开始 -->
<%@include file="footer_black.jsp" %>
<!-- 页脚结束 -->


      
</body>
</html>