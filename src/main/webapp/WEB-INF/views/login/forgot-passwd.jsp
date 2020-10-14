<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>Passwd-Forgot</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/js/main.js"></script>

<script>

$(document).ready(function() {
	$("#EMAIL").keydown(function(key) {  
		if (key.keyCode == 13) {                
			fn_passwdfindchk();
		}
	});
	
});


function fn_passwdfindchk(){
	
	var USERID = $("#USERID").val();
	var EMAIL = $("#EMAIL").val();
	
	if(USERID == ""){
		alert("아이디를 입력해 주세요");
		return;
	}
	if(EMAIL == ""){
		alert("이메일을 입력해 주세요");
		return;
	}
	
	var PASSWDFINDCHK = { "USERID" : USERID , "EMAIL" : EMAIL }
	console.log(PASSWDFINDCHK);
	$.ajax({
		url: "/set/passwdfindchk",
	    type: "post",
		dataType: "json",
		data: PASSWDFINDCHK ,
		success: function(data){
			if(data.passwdfindchk == '1' || data.passwdfindchk == 1){
				alert("사원님의 비밀번호는 "+ data.passwdfind.PASSWD + " 입니다. 로그인 페이지로 이동합니다.");
				window.location.href = "/";
			}else{
				alert("가입된 정보가 없습니다");
			}
		},
	});
}

</script>



</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/resources/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Forgot - Passwd
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter UserId">
						<input class="input100" type="text" id="USERID" name="USERID" placeholder="UserId">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter EMAIL">
						<input class="input100" type="text" id="EMAIL" name="EMAIL" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="fn_passwdfindchk()">
							forgot - passwd
						</button>
					</div>
					
					<div class="text-center p-t-90">
						<a class="txt1" href="/">
							Login Page?
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

</body>
</html>