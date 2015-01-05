<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<title>乐物网新用户注册</title>

<#-- 弹出对话框的引用 -->
<script src="/lewooresource/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="/manageshops/js/shops/jquery.bgiframe-2.1.2.js"></script>
<script src="/manageshops/js/shops/jquery-ui.js"></script>
<script type="text/javascript" src="/manageshops/js/shops/jquery.mulitselector.js"></script>
<link rel="stylesheet" href="/multiflex/css/global/jquery-ui.css" />

<#-- 区域级联菜单数据 -->
<script type="text/javascript" src="/lewooresource/js/data/geo_data.js"></script>
<script src="/lewooresource/js/commongeneral/Utils.js" type="text/javascript"></script>

<#--页面效果控制-->
<link type="text/css" rel="stylesheet" href="/manageshops/js/shops/registerShops.css"/>
<link type="text/css" rel="stylesheet" href="/manageshops/js/shops/layer.css"/>

<#--表单验证-->
<script type="text/javascript" src="/lewooresource/js/jquery.json-2.3.min.js"></script>
<link href="/multiflex/css/global/validate.css" rel="stylesheet" type="text/css" />
<script src="/lewooresource/js/commongeneral/Utils.js" type="text/javascript"></script>
<link href="/multiflex/css/global/lewooindex-base.css" rel="stylesheet" type="text/css" />

<#--时间控件-->
<link rel="stylesheet" type="text/css" href="/images/jquery/ui/development-bundle/themes/base/jquery.ui.all.css"/>  
<script type="text/javascript" src="/images/jquery/ui/development-bundle/ui/jquery.ui.core.js"></script>  
<script type="text/javascript" src="/images/jquery/ui/development-bundle/ui/jquery.ui.datepicker.js"></script>
<#--百度地图-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script> 

<script type="text/javascript">
	
	$(function() {
	        $( document ).tooltip({
	            track: true
	        });
	});

<#--改变验证码-->
function changeCode(){
	var random=UtilMisc.getRandom(1000);
	$('#verify_image').attr('src','getCaptcha?random='+random);
}
<#--省市区县及小区的级联-->
$(document).ready(function() {
	new util().initProvinceSelect($("select[name='province']"),$("select[name='city']"),$("select[name='county']"),$("select[name='housingId']"));
	var registerCapital = '';
	registerCapital=registerCapital/10000;
	$("input[name=registerCapital]").val(registerCapital);
});

/* 注册页面ajax验证的6个标示位，用于form表单是否能提交。
【userNameFlag:用户名标示位, shopsNameFlag:商铺名称标示位, shortNameFlag:商铺简称标示位,
  phoneFlag:商户电话标示位, mobileFlag:商户手机标示位, mailFlag:商铺邮箱标示位】*/
var userNameFlag = false;
var mobileFlag = false;
var mailFlag = false;

// 校验用户名
function checkUserName(){
	var userName = $("#userLoginId").val();
	var userNameRight = $("#userrightid");
	var userNameWrong = $("#userwrongid");
	var chkName=/^[0-9a-zA-Z_]+$/;
	
    if(userName == ''){
    	userNameWrong.html("用户名不能为空！");
    	userNameWrong.show();
    	userNameRight.hide();
        userNameFlag = false;
    }else if(userName.length < 4){
    	userNameWrong.html("用户名称由 4 到 16 个字符组成！");
    	userNameWrong.show();
    	userNameRight.hide();
        userNameFlag = false;
    }else if(!chkName.test(userName)){
    	userNameWrong.html("只能输入字符、数字和下划线，不支持中文名称和特殊字符！");
    	userNameWrong.show();
    	userNameRight.hide();
        userNameFlag = false;
    }else{
	    $.ajax({
		    	url: 'checkUserExistByUserLoginId',
		    	type: 'POST',
		    	data:{userLoginId:userName},
		    	success: function(data){
			    	if(null != data && data.isExist == false){
			    		userNameWrong.hide();
	    				userNameRight.show();
			    		userNameFlag = true;
			    	}else{
			    		userNameRight.hide();
			    		userNameWrong.html("该用户名已经存在！");
			    		userNameWrong.show();
			    		userNameFlag = false;
			    	}
		    	}
	    });
	 }
}
	
/* 密码校验 */
function checkPassword(){
	var password = $("#currentPassword").val();
	var passwordright = $("#passwordright");
	var passwordwrong = $("#passwordwrong");
	
	if(password == ''){
		passwordright.hide();
		passwordwrong.html("请您输入密码！");
		passwordwrong.show();
		return false;
	}else if(password.length < 6){
		passwordright.hide();
		passwordwrong.html("密码长度必须大于6位！");
		passwordwrong.show();
		return false;
	}else{
		passwordwrong.hide();
		passwordright.show();
		return true;
	}
}

/* 确认密码校验 */
function checkRePassword(){
	var password = $("#currentPassword").val();
	var repassword = $("#currentPasswordVerify").val();
	
	var repasswordright = $("#repasswordright");
	var repasswordwrong = $("#repasswordwrong");
	
	if(repassword == ''){
		repasswordright.hide();
		repasswordwrong.html("请您在次输入新密码！");
		repasswordwrong.show();
		return false;
	}else if(password != repassword){
		repasswordright.hide();
		repasswordwrong.html("两次密码输入不一致！");
		repasswordwrong.show();
		return false;
	}else{
		repasswordwrong.hide();
		repasswordright.show();
		return true;
	}
}

/* 真实姓名校验 */
function checkRealName(){
	var realName = $("#userName").val();
	var realnameright = $("#realnameright");
	var realnamewrong = $("#realnamewrong");
	
	if(realName == ''){
		realnameright.hide();
		realnamewrong.html("真实姓名不能为空！");
		realnamewrong.show();
		return false;
	}else if(realName.length < 2){
		realnameright.hide();
		realnamewrong.html("真实姓名 最少2位长度！");
		realnamewrong.show();
		return false;
	}else{
		realnamewrong.hide();
		realnameright.show();
		return true;
	}
}


/* 手机校验 */
function checkMobile(){
	var mobile = $("#reg_phone").val();
	var mobileright = $("#mobileright");
	var mobilewrong = $("#mobilewrong");
	var mobilereg = /^(((13[0-9]{1})|(15[0-9]{1})|(147)|(18[6-9]{1}))+\d{8})$/;
	
	if(mobile == ''){
		mobileright.hide();
    	mobilewrong.html("手机不能为空！");
    	mobilewrong.show();
        mobileFlag = false;
	}else if(!mobilereg.test(mobile)){
    	mobileright.hide();
    	mobilewrong.html("手机格式错误！");
    	mobilewrong.show();
        mobileFlag = false;
    }else{
	    $.ajax({
		    	url: 'checkUserExistByTell',
		    	type: 'POST',
		    	data:{tell:mobile},
		    	success: function(data){
			    	if(null != data && data.isExist == false){
			    		mobilewrong.hide();
	    				mobileright.show();
			    		mobileFlag =  true;
			    	}else{
			    		mobileright.hide();
			    		mobilewrong.html("该手机已经存在！");
			    		mobilewrong.show();
			    		mobileFlag =  false;
			    	}
		    	}
	    });
	}
}

/* 邮箱校验 */
function checkMail(){
	var mail = $("#email").val();
	var mailright = $("#mailright");
	var mailwrong = $("#mailwrong");
	var mailreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	
	if(mail == ''){
		mailright.hide();
    	mailwrong.html("邮箱不能为空！");
    	mailwrong.show();
        mailFlag = false;	
	}else if(!mailreg.test(mail)){
    	mailright.hide();
    	mailwrong.html("邮箱格式错误！");
    	mailwrong.show();
        mailFlag = false;
    }else {
	    $.ajax({
		    	url: 'checkUserExistByEmail',
		    	type: 'POST',
		    	data:{email:mail},
		    	success: function(data){
			    	if(null != data && data.isExist == false){
			    		mailwrong.hide();
	    				mailright.show();
			    		mailFlag = true;
			    	}else{
			    		mailright.hide();
			    		mailwrong.html("该邮箱已经存在！");
			    		mailwrong.show();
			    		mailFlag = false;
			    	}
		    	}
	    });
	}
}


/* 表单提交 */
function formSubmit(){
	if(userNameFlag && checkPassword() && checkRePassword() && checkRealName() && mobileFlag && mailFlag && $("#agreeCheck").is(":checked") ){
		
		// 表单提交
		$("#registerForm").submit();
	}else{
		
		/*构建对话框*/
		$("#submitdiv").dialog({
			width: 300,
			height: 200,
			autoOpen: true,
			show: "highlight",
			hide: "explode",
			buttons: {
				Ok: function() {
					$(this).dialog("close");
				}
			}
		});
	}
}

</script>

</head>


<body screen_capture_injected="true">

	<!--页眉开始-->
	<#include "global/header.ftl">

    <!--提示信息开始-->
	<div id="messages-container" title="提示">
		<#include "component://commonext/webapp/ftl/messages.ftl" />
	</div>
	<!--提示信息结束-->


	<div class="reg_bg reg_basewidth">
		<div class="reg_form">
			<div class="login_tip"><span class="fr">已注册？<a href="/checkLogin" title="登录">登录</a></span></div>
			<div class="form_top reg_sprite"></div>
			<form id="registerForm" action="doRegister" method="post">
				   <div class="pane" id="shops_reg_div0">

		<div class="module"> 
			<span class="txt-impt">*</span>
			<label>用户名:</label>
			<div class="fm">
				<input type="text" class="nohover iw248 fl  required" title="用户名称由 4 到 16 个字符组成，允许字母（不区分大小写）、数字、减号和下划线，不允许全角或半角空格。"  minlength="4" maxlength="16" name="userLoginId" id="userLoginId" onblur="checkUserName();" />
				<span id="userrightid" class="input_right" style="display:none;"></span>
				<span id="userwrongid" class="input_wrong" style="display:none;"></span>
				<p class="info">用户名称由 4 到 16 个字符组成，允许字母（不区分大小写）、数字、减号和下划线，不允许全角或半角空格。</p>
			</div>
		</div>
		<div class="module">
			<span class="txt-impt">*</span>
			<label>密码:</label>
			<div class="fm">
				<input id="currentPassword" name="currentPassword" type="password" onblur="checkPassword();" class="nohover iw248 fl  required" minlength="6" maxlength="16" name="currentPass" title="密码名称由 6 到 16 个字符组成，允许字母（不区分大小写）、   数字、减号和下划线，不允许全角或半角空格。"/>
				<span id="passwordright" class="input_right" style="display:none;"></span>
				<span id="passwordwrong" class="input_wrong" style="display:none;"></span>
				<p class="info">密码名称由 6 到 16 个字符组成，允许字母（不区分大小写）、   数字、减号和下划线，不允许全角或半角空格。</p>
			</div>
		</div>
		<div class="module"> 
			<span class="txt-impt">*</span>
			<label>确认密码:</label>
			<div class="fm">
				<input type="password" class="nohover iw248 fl  required" onblur="checkRePassword();" name="currentPasswordVerify" id="currentPasswordVerify" title="密码名称由 6 到 16 个字符组成，允许字母（不区分大小写）、   数字、减号和下划线，不允许全角或半角空格。"/>
				
				<span id="repasswordright" class="input_right" style="display:none;"></span>
				<span id="repasswordwrong" class="input_wrong" style="display:none;"></span>
				<p class="info">密码名称由 6 到 16 个字符组成，允许字母（不区分大小写）、   数字、减号和下划线，不允许全角或半角空格。</p>
			</div>
		</div>
        <div class="module"> 
			<span class="txt-impt">*</span>
			<label>手机:</label>
			<div class="fm">
				<input type="text" class="nohover iw248 fl  required" onblur="checkMobile();" maxlength="11" name="reg_phone" id="reg_phone" title="请输入长度为11位数字的手机号"/>
				<span id="mobileright" class="input_right" style="display:none;"></span>
				<span id="mobilewrong" class="input_wrong" style="display:none;"></span>
				<p class="info">请输入长度为11位数字的手机号</p>
			</div>
		</div>
        <div class="module"> 
			<span class="txt-impt">*</span>
			<label>邮箱:</label>
			<div class="fm">
				<input type="text" class="nohover iw248 fl  required" onblur="checkMail();" maxlength="50" name="email" id="email" title="请输入邮箱"/>
				<span id="mailright" class="input_right" style="display:none;"></span>
				<span id="mailwrong" class="input_wrong" style="display:none;"></span>
				<p class="info">请输入邮箱</p>
			</div>
		</div>
        <div class="module">
         <span class="txt-impt">*</span>
				<label>家庭地址:</label>
				<div class="fm">
					<div class="mons">
						<select name="province" class="nohover iw248 fl  required" id="province" style="width:80px" class="mons">
							<option value="" selected="selected">请选择...</option>
						</select>
					</div>
					<span class="ssp">省</span>
					
					<div id="divcity">
						<select name="city" id="city" style="width:80px" class="mons">
							<option value="" selected="selected">请选择...</option>
						</select> 
					</div>
					<span class="ssp">市</span>
					
					<div id="divcounty">
						<select name="county" id="county" style="width:80px" class="mons" onblur="checkCounty();">
							<option value="" selected="selected">请选择...</option>
						</select>
					</div>
					<span class="ssp">区/县</span>
					<span id="countyright" class="input_right" style="display:none;"></span>
					<span id="countywrong" class="input_wrong" style="display:none;"></span>
					<span  class="contentr">
						<select style="width:80px" class="mons"  maxlength="5" name="housingId"  title="小区、楼号、单元号不能为空">
						<option value="">-选择小区-</option>
						</select>小区 
						<input type="text" name="floorNo" maxlength="5" style="width:80px" class="mons" title="小区、楼号、单元号不能为空"/>楼号  
						<input type="text" name="unitNumber" maxlength="5" style="width:80px" class="mons"  title="小区、楼号、单元号不能为空"/>单元
					</span>
					<span  class="contentr room ">
						<input type="text" name="roomNumber" maxlength="5" style="width:80px" class="mons" title="室不能为空"/>室
					</span>
				</div>
			</div>
		<div class="module"> 
			<span class="txt-impt">*</span>
			<label>真实姓名:</label>
			<div class="fm">
				<input type="text" class="nohover iw248 fl  required" onblur="checkRealName();" maxlength="10" name="userName" id="userName" title="真实姓名 最少2位长度"/>
				<span id="realnameright" class="input_right" style="display:none;"></span>
				<span id="realnamewrong" class="input_wrong" style="display:none;"></span>
				<p class="info">真实姓名 最少2位长度</p>
			</div>
		</div>
        
        <div class="module"> 
			<span class="txt-impt">*</span>
			<label>性别:</label>
			<div class="fm">
				<input type="radio" name="sex" id="userSex1" style="width:80px"  tabindex="5" value="0" checked="checked" />男
			    <input type="radio" name="sex" id="userSex1" style="width:80px"  tabindex="5" value="1"/>女
				<p class="info">请选择性别</p>
			</div>
		</div>
        
        <div class="module"> 
			<span class="txt-impt">*</span>
			<label>验证码:</label>
			<div class="fm">
				<input type="text" class="nohover iw138 fl required"  maxlength="4" tabindex="6" id="reg_code"  title="请输入右侧图片中的验证码"  name="captcha" />
     			<img id="verify_image" style="height:30px;width:100px;cursor: pointer; display: inline-block;" title="点击换一张" src="getCaptcha" onclick="changeCode();">
				<p class="info">请输入验证码</p>
			</div>
		</div>

        <input class="go-next-btn" type="button" onclick="formSubmit();" value="提交" />
        
        <div class="module"> 
			<div class="fm">
			 <input type="checkbox" name="agreeCheck" id="agreeCheck" style="width:80px" class="mons"  checked="checked" />
             <span class="terms_text_bottom">我已阅读并接受<a href="http://172.168.3.87:8080/discuz/portal.php?mod=view&aid=71" target="_blank">乐物网网站用户注册协议</a>。</span>
		    </div>
		</div>
               <div id="submitdiv" style="display:none;" title="友情提示">您提交的内容有错误，请您仔细检查。</div>
			</form>
			<div class="form_bottom reg_sprite_bottom"></div>
		</div>
        <#include "../ftl/global/newSmallFooter.ftl">
	</div>
	
</body>
</html>