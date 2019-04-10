<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/common-less.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/profile-less.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/oplog-less.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/base.css" type="text/css">
<!-- 网页标题栏图标 -->
	<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/study/favicon.ico"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/study/js/jquery.js"></script>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/style/pagination.css" type="text/css" media="screen">
 

<!-- 头像上传脚本 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/study/css/font-awesome.4.6.0.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/amazeui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/amazeui.cropper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/study/css/custom_up_img.css">
</head>
<body>

    <%@include file="head_black.jsp" %>
    <!-- 页头结束 -->

<div id="main">

<div class="settings-cont clearfix">
  <div class="setting-left l" >
    <div class="avator-wapper">
      <div class="avator-mode" >
        <img id="up-img-touch" class="avator-img" alt="图片去哪里啦?" src="${pageContext.request.contextPath}/study/img/Java.png"  width="92" height="92">
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
			<span class="am-icon-rotate-left"></span>
			<span class="am-icon-rotate-right"></span>
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
        <img alt=""  src="${pageContext.request.contextPath}/study/images/lv_icon5.jpg" class="lv_icon_right">
        </span></a>
        </li>
        <li><a href="user_center.jsp">个人信息<span class="arr">
        <img alt=""  src="${pageContext.request.contextPath}/study/images/lv_icon5.jpg" class="lv_icon_right">
        </span></a></li>
        <li><a href="user_loginrecord.jsp">登录记录<span class="arr">
        <img alt=""  src="${pageContext.request.contextPath}/study/images/lv_icon5.jpg" class="lv_icon_right">
        </span></a></li>
        </ul>
    </div>
  </div>
  
<!-- 主体右部开始 -->
<!-- 主体右部密码修改开始 -->
<div id="sgy_pass" class="setting-right">
    <div class="setting-right-wrap wrap-boxes settings">
        
 <div class="formBox">
    <div id="setting-profile" class="setting-wrap setting-profile">
        
        <div class="common-title">
            &nbsp;&nbsp;&nbsp;&nbsp;密码修改
        </div>
        <div class="line"></div> 
      <div class="info-wapper">
             <div class="info-box clearfix">
                <label class="pull-left">用户名</label><div class="pull-left">
                <input id="yyy_name" type="text" placeholder="这里输入姓名" name="nick_name" onblur="checkName()"/></div>
            </div>
            <div class="info-box clearfix">
                <label class="pull-left">密码</label><div class="pull-left">
                <input id="yyy_oldpass" type="password" placeholder="请输入旧密码" name="password"/><img id="yyy_img" src=""/></div>
            </div>
            <div class="info-box clearfix"><label class="pull-left">新密码</label><div class="pull-left">
            <input id="yyy_newpass" type="text"  name="newpassword" placeholder="请输入新密码" onblur="checkPassword()"/></div>
            </div>
            <div class="info-box clearfix"><label class="pull-left">确认</label><div class="pull-left">
            <input id="yyy_submitpass"  type="text" placeholder="请确认密码" onblur="checkPassword2()"/><span id="sgy_result"></span></div>
            </div>
            <div id="yyy_submit" class="info-box clearfix">
            
            <label id="submit_sgy" onclick="sendPassword()" class="pull-left">提交</label>
            </div>
        </div> 
    </div>
</div>    
</div>

  </div>

<!-- 主体右部结束 -->
</div>
<!-- 主体结束 -->
</div>
<!-- 页脚开始 -->
<%@include file="footer_black.jsp" %>
<!-- 页脚结束 -->


<script type="text/javascript">  
/* 检查用户名是否输入正确 */
var ok = true;//表示表单是否通过检测
function checkName(){
	var name = $("#yyy_name").val();
	if(name != localStorage.name || name == ""){
		layer.msg('用户名输入错误');
		ok=false;
	}else{
		ok = true;
	}
}

/* 检查密码 */
 
function checkPassword(){
	var newPassword = $("#yyy_newpass").val();
	if(newPassword==""){
		layer.msg('密码不能为空');
		ok = false;
	}
}
function checkPassword2(){
	var newPassword = $("#yyy_newpass").val();
	var newPassword2 = $("#yyy_submitpass").val();
	if(newPassword2 ==""){
		layer.msg('密码不能为空');
		ok = false;
	}else if(newPassword2!=newPassword){
		layer.msg('两次密码不一致');
		ok = false;
	}
}
/*通过AJAX发送用户名和新旧密码  */
function sendPassword(){
	//获取请求参数
	var name = $("#yyy_name").val();
    $("#yyy_name").val("");
	var newPassword = $("#yyy_newpass").val();
    $("#yyy_newpass").val("");
	var oldPassword = $("#yyy_oldpass").val();
    $("#yyy_oldpass").val("");
    $("#yyy_submitpass").val("");

	var id = localStorage.userId;
    var token = localStorage.token;
	//调用/user/login服务登录
	if(ok){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-user/user/update/changePassword?id="+id+"&token="+token,
			type:"put",
			data:{"id": id, "name":name,"newPassword":newPassword,"oldPassword":oldPassword,"token":token},
            headers:{
                "id":id,
                "token":token
            },
			dataType:"json",
			success:function(result){
				//result表示服务器返回的json结果
				if(result.code==2){
					alert(result.msg);
				}else{
					//成功
					alert("密码修改成功，请重新登录");
					//将用户信息存储到浏览器中
					localStorage.clear();
					//用layer调用login.jsp登录
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
				}
			}
		});
	}
};

</script>
    
</body>
</html>