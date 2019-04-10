<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="regist.jsp" tabindex="8" >快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               <div class="login-box">
			<div class="login_form">
				<input type="hidden" name="did" value="0"/>
               <input type="hidden" name="to" value="log"/>
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    
                    <input type="text" id="username" name="username"  class="inputstyle" onblur="checkName()"/>
                    <span id="username_error" style="color: red"></span>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="password" name="password" class="inputstyle" onblur="checkPassword()"/>
                    <span id="password_error" style="color: red"></span>
                    <span id="login_error" style="color: red"></span>
                </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;"><input id="login_form" type="button" value="登 录" style="width:150px;" class="button_blue" onclick="login()"/></div>
                
           </div>
           
          </div>
               
            </div>
            <!--登录end-->
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>

<!-- 使用火狐的API获取当前用户的ip -->
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">  
var ip = returnCitySN["cip"];
</script>

<!-- 因火狐的API地址不准确 所以使用其他API获取当前用户的地址 -->
<script type="text/javascript" src="http://ip.ws.126.net/ipquery?ip="></script>
<script type="text/javascript">
    var city = localAddress["city"] + localAddress["city"];
</script>


<script type="text/javascript">
var ok = true;//表示表单是否通过检测
//表单验证
function checkName(){
	//清空提示信息
	$("#username_error").html("");
	//检测表单格式
	if(username==""){
		$("#username_error").html("用户名不能为空");
		ok = false;
	}

}//表单验证
function checkPassword(){
	//清空提示信息
	$("#password_error").html("");
	//获取请求参数
	var password = $("#password").val();
	//检测表单格式
	if(password==""){
		$("#password_error").html("密码不能为空");
		ok = false;
	}
}
</script>
<script type="text/javascript">
function login(){
	//获取请求参数
	var username = $("#username").val();
	var password = $("#password").val();
	//调用/user/login服务登录
	if(ok){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-user/user/login",
			type:"get",
			data:{"name":username,"password":password,"ip":ip,"city":city},
			dataType:"json",
			success:function(result){
				//result表示服务器返回的json结果
				if(result.code==1){
					$("#username_error").html(result.msg);
				}else if(result.code==2){
					$("#password_error").html(result.msg);
				}else if(result.code==3){
					$("#username_error").html("账号或密码错误 ！ ");
					$("#password_error").html("账号或密码错误 ！ ");
				}else{
					//成功
					alert("登录成功，欢迎访问");
					//将用户信息存储到浏览器中
					localStorage.userId = result.userId;
					localStorage.name = result.name;
					localStorage.image = result.image;
					localStorage.token = result.token;
					//颁发令牌
					localStorage.token = result.token;
					if(result.nickName ==""||result.nickName==null){
						localStorage.nickName = "未设置";
					}else{
						localStorage.nickName = result.nickName;
					}
					if(result.position ==""||result.position ==null){
						localStorage.position = "未设置";
					}else{
						localStorage.position = result.position;
					}
					if(result.location ==""||result.location ==null){
						localStorage.location = "未设置";
					}else{
						localStorage.location = result.location;
					}
					if(result.sex ==""||result.sex ==null){
						localStorage.sex = "未设置";
					}else{
						localStorage.sex = result.sex;
					}
					if(result.signature ==""||result.signature ==null){
						localStorage.signature = "未设置";
					}else{
						localStorage.signature = result.signature;
					}
					
				   /*  var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);//关闭弹窗
					window.location.href = "http://localhost:8888/study/index.html"  */
					 window.parent.location.reload();//刷新父窗口 
				}
			}
		});
	}
};
</script>

</body>
</html>