<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息编辑页面</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/location.js"></script>
<script src="js/select2.js"></script>
<script src="js/select2_locale_zh-CN.js"></script>
<link href="css/common.css" rel="stylesheet" />
<link href="css/select2.css" rel="stylesheet" />
<link rel="stylesheet" href="css/g_edit.css" />

<style type="text/css">
.lab {
	font-size: 16px;
	float: left;
	margin-left: 20px;
}
/*确定按钮*/
#g_submit{
	background-color: #0088cc;
color: #ffffff;
font-size: 16px;
padding: 5px;
	
}
#g_cancel{
	    font-size: 16px;
    padding: 5px;
    background-color: #fff;
    color: #83878c;

}
</style>
</head>
<body>
	<div class="main">
			<form action="" method="post">
				<div class="formargin">
					<label class="lab">昵称</label>
					<input id="nickName" type="text" name="nick_name" placeholder="这里输入昵称" class="nickName" />
				</div>
				<div class="formargin">
					<label  class="lab">职位</label>
					<select id="job" name="position" style="width: 200px; height: 30px; margin-left: 0px;">
						<option value="请选择职位">请选择职位</option>
						<option value="学生">学生</option>
						<option value="Python工程师">Python工程师</option>
						<option value="页面重构设计">页面重构设计</option>
						<option value="Web前端工程师">Web前端工程师</option>
						<option value="JS工程师">JS工程师</option>
						<option value="PHP开发工程师">PHP开发工程师</option>
						<option value="JAVA开发工程师">JAVA开发工程师</option>
						<option value="移动开发工程师">移动开发工程师</option>
						<option value="软件测试工程师">软件测试工程师</option>
						<option value="Linux系统工程师">Linux系统工程师</option>
						<option value="交互设计师">交互设计师</option>
						<option value="产品经理">产品经理</option>
						<option value="数据库工程师">数据库工程师</option>
						<option value="UI设计师">UI设计师</option>
						<option value="CG影视动画师">CG影视动画师</option>
						<option value="全栈工程师">全栈工程师</option>
						<option value="数据科学家">数据科学家</option>
					</select>
				</div>
				<div class="formargin">
					<label class="lab">所在地区</label>
					<select id="loc_province" style="width: 120px;"></select> 
					<select id="loc_city" style="width: 120px; margin-left: 10px"></select> 
					<select id="loc_town" style="width: 120px; margin-left: 10px"></select>
				</div>
				
				<div class="formargin">
					<label class="lab">性别</label>
					<label class="lab_gender"> 
					    <input chidefocus="true" value="保密" name="sex" type="radio" />保密
					</label> 
					<label class="lab_gender"> 
					    <input hidefocus="true" value="男" name="sex" type="radio" />男
					</label> 
					<label class="lab_gender"> 
					    <input hidefocus="true" value="女" name="sex" type="radio" />女
					</label>
				</div>

				<div class="formargin">
					<label class="lab">个性签名</label>
					<textarea name="signature" id="aboutme" rows="5" style="width: 300px;"></textarea>
				</div>
				<input id="hidenname" name="location" type="hidden" value=2 />
				
				<div class="formargin">
					<input type="button" value="确 定" onclick="onSubmit()" id="g_submit"/>&nbsp; 
					<input type="button" value="取 消" onclick="fresh()" id="g_cancel"/>
				</div>
			</form>
	</div>
</body>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript">
//将编辑后的信息传入数据库
	function onSubmit(){
	    var id = localStorage.userId;
		var nickName = $("#nickName").val();
		var job = $("#job").val();
		var province = $("#loc_province").find("option:selected").html();
		var city = $("#loc_city").find("option:selected").html();
		var town = $("#loc_town").find("option:selected").html();
		var loc= province+"-"+city+"-"+town;
		//获取个性签名
		var signature = $("#aboutme").val();
		//获取单选框的值
		var sex = $("input[name='sex']:checked").val();
        var token = localStorage.token;
		if(nickName ==""||nickName==null){
			nickName = "未设置";
		}
		if(job =="请选择职位"||job ==null){
			job ="未设置";
		}
		if(sex==""||sex==null){
			sex = "未设置";
		}
		if(signature ==""||signature ==""){
			signature = "未设置";
		}
		if(town =="市、县、区"){
			loc= province+"-"+city;
		}
		if(city =="地级市"){
			loc= province;
		}
		if(province =="省份"){
			loc= "未设置";
		}

		$.ajax({
			url:"http://127.0.0.1:9524/ovls-user/user/put/update/PersonalInfo",
			type:"put",

			data:{
			    "id":id,
                "position":job,
				"nickName":nickName,
				"location":loc,
				"sex":sex,
				"signature":signature
			},
            headers:{
                "id":id,
			    "token":token
			},
            dataType:"json",
            async: false,
			success:function(result){
				if(result.code==4){
					layer.alert(result.msg, { icon: 2});
				}else{
					localStorage.nickName = nickName;
					localStorage.position = job;
					localStorage.location = loc;
					localStorage.sex = sex;
					localStorage.signature = signature;
					layer.alert('修改成功', { icon: 1},function(){
		                parent.location.reload()});
					
				}
			}
		});
	};
	 //取消时调用
	function fresh(){
		window.parent.location.reload();//刷新父窗口
	}	
</script>


</html>