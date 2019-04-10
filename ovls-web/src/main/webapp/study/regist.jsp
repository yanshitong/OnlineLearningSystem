<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
<title>登录页面</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn" id="switch_qlogin" href="login.jsp" tabindex="7">快速登录</a>
			<a class="switch_btn_focus" id="switch_login" href="javascript:void(0);" tabindex="8" >快速注册</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; right: 0px;"></div>
        </div>
    </div>    

  <!--注册-->
    <div class="qlogin" id="qlogin">
    <div class="web_login" >
	      <input type="hidden" name="to" value="reg"/> 
		      		       <input type="hidden" name="did" value="0"/> 
        <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">
        		快速注册请注意格式	
        		</div> 
                <li>
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="username"  name="username"  maxlength="16" class="inputstyle2"/>
                    	 <span id="username_error" style="color: red"></span>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="password"  name="password"  maxlength="16" class="inputstyle2"/>
                        <span id="password_error" style="color: red"></span>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="password2" name="password2" maxlength="16" class="inputstyle2" />
                        <span id="password2_error" style="color: red"></span>
                        <span id="register_error" style="color: red"></span>
                        <span id="register_ok" style="color: green"></span>
                    </div>
                    
                </li>
                
               <!--  <li>
                 <label for="qq" class="input-tips2">QQ：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2"/>
                    </div>
                   
                </li> -->
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;width:150px;" 
                        	class="button_blue" value="马上注册" onclick="register()" /> 
                    </div>
                    
                </li><div class="cl"></div>
            </ul> 
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
function register(){
	//清空提示信息
	$("#username_error").html("");
	$("#password_error").html("");
	$("#password2_error").html("");
	$("#register_error").html("");
	$("#register_ok").html("");
	//获取请求参数
	var username = $("#username").val();
	var password = $("#password").val();
	var password2 = $("#password2").val();
	//检测表单格式
	var ok = true;//表示表单是否通过检测
	if(username==""){
		$("#username_error").html("用户名不能为空");
		ok = false;
	}
	if(password==""){
		$("#password_error").html("密码不能为空");
		ok = false;
	}
	if(password2==""){
		$("#password2_error").html("确认密码不能为空");
		ok = false;
	}else if(password2!=password){
		$("#password2_error").html("两次密码不一致");
		ok = false;
	}
	//调用/user/regist服务注册
	if(ok){
		$.ajax({
			url:"http://127.0.0.1:9524/ovls-user/user/regist",
			type:"post",
			data:{"name":username,"password":password},
			dataType:"json",
			success:function(result){
				//result表示服务器返回的json结果
				if(result.code==1){
					$("#register_error").html(result.msg);
				}else{
					$("#register_ok").html("注册成功");
					//TODO 切换到登录界面
				}
			}
		});
	}
};
</script>
</body>
</html>