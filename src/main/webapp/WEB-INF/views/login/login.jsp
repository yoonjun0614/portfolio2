<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/resources/images/bg-01.jpg');">
			<div class="wrap-login100">
				<span class="login100-form-logo">
					<i class="zmdi zmdi-landscape"></i>
				</span>
				<span class="login100-form-title p-b-34 p-t-27">
					Log in
				</span>
				<div class="wrap-input100 validate-input" data-validate = "Enter username">
					<input class="input100" type="text" id="USERID" name="USERID" placeholder="UserId">
					<span class="focus-input100" data-placeholder="&#xf207;"></span>
				</div>
				<div class="wrap-input100 validate-input" data-validate="Enter password">
					<input class="input100" type="password" id="PASSWD" name="PASSWD" placeholder="Password">
					<span class="focus-input100" data-placeholder="&#xf191;"></span>
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn" onclick="fn_login()">
						Login
					</button>
				</div>
				<div class="text-center p-t-90">
					<a class="txt1" href="/set/idfind.do">
						Forgot id?
					</a>
					<br>
					<a class="txt1" href="/set/passwdfind.do">
						Forgot Password?
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="/resources/vendor/countdowntime/countdowntime.js"></script>
	<script src="/resources/js/main.js"></script>

	<script>
	$(document).ready(function() {
		$("#PASSWD").keydown(function(key) {  
			if (key.keyCode == 13) {                
				fn_login();
			}
		});
	});
	
	function fn_login() {
		
		var ID = $("#USERID").val();
		var PASSWD = $("#PASSWD").val();
		var LOGIN = { "ID" : ID , "PASSWD" : PASSWD }
		
		
		if(ID==""){
			alert("아이디를 입력해 주세요");
		}else if(PASSWD==""){
				alert("비밀번호를 입력해 주세요");		
		}else{
			$.ajax({
				url: "/set/login.do",
			    type: "post",
				dataType: "JSON",
				data:LOGIN ,
				success: function(data){
					
					if(data.idchk == 2 | data.idchk == '2'){
						
						window.location.href = "/set/notice.do";
					}else if(data.idchk == '1' | data.idchk == 1){
						alert("비밀번호를 확인해주세요");
					}else{
						alert("아이디를 확인해주세요");
 					}
				},error : function(data){
					console.log("error  :  ");
					console.log(data);
				}
			});	
		}
	}
	
	</script>
</body>

</html>