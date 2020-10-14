<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>SB Admin 2 - Dashboard</title>
	
	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	
	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/set/updatedatail.do">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<c:if test="${UserLogin.POWER eq '1' }">
			<div class="sidebar-brand-text mx-3">${UserLogin.USER_ID}(사원)</div>
		</c:if>
		<c:if test="${UserLogin.POWER eq '2' }">
			<div class="sidebar-brand-text mx-3">${UserLogin.USER_ID}(대리)</div>
		</c:if>
		<c:if test="${UserLogin.POWER eq '3' }">
			<div class="sidebar-brand-text mx-3">${UserLogin.USER_ID}(과장)</div>
		</c:if>
		<c:if test="${UserLogin.POWER eq '4' }">
			<div class="sidebar-brand-text mx-3">${UserLogin.USER_ID}(부장)</div>
		</c:if>
		</a>
	
		<!-- Divider -->
		<hr class="sidebar-divider my-0">
	
		<!-- Divider -->
		<hr class="sidebar-divider">
	
		<!-- Heading -->
		<div class="sidebar-heading">
			Admin
		</div>
	
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i>
			<span>공지 사항</span>
		</a>
		<div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">공지 사항:</h6>
			<a class="collapse-item" href="/set/notice.do">공지 사항 </a>
			</div>
		</div>
		</li>	

		<!-- Divider -->
		<hr class="sidebar-divider">
	
		<!-- Heading -->
		<div class="sidebar-heading">
			User
		</div>
	
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i>
			<span>결제</span>
		</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">휴가 관리:</h6>
			<a class="collapse-item" href="/set/vacation.do">휴가 신청 </a>
			<a class="collapse-item" href="/set/myvacation.do">휴가 현황 </a>
			<div class="collapse-divider"></div>
			<h6 class="collapse-header">결제 관리:</h6>
			<a class="collapse-item" href="/set/electronicpayment.do">전자 결제</a>
			</div>
		</div>
		</li>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-folder"></i>
			<span>게시판</span>
		</a>
		<div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">건의 사항:</h6>
			<a class="collapse-item" href="/set/suggestions.do">건의 사항 </a>
			<div class="collapse-divider"></div>
			<h6 class="collapse-header">자료실:</h6>
			<a class="collapse-item" href="/set/dataroom.do">자료실</a>
			</div>
		</div>
		</li>	
	
		<!-- Nav Item - Tables -->
		<li class="nav-item">
		<a class="nav-link" href="/set/userlist.do">
			<i class="fas fa-fw fa-table"></i>
			<span>비상 연락망</span></a>
		</li>
	
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
	
		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
	
	</ul>
	<!-- End of Sidebar -->
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
		<!-- Main Content -->
		<div id="content">
	
		<!-- Topbar -->
		<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<h1 class="h3 mb-0 text-gray-800">사용자 설정  >  회원 가입</h1>
			<!-- Topbar Navbar -->
			<ul class="navbar-nav ml-auto">
	
			<div class="topbar-divider d-none d-sm-block"></div>
	
				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow">
					<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="mr-2 d-none d-lg-inline text-gray-600 small">사용자 설정</span>
					</a>
					<!-- Dropdown - User Information -->
					<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/set/insertdatail.do">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
						회원 가입
					</a>
					<a class="dropdown-item" href="/set/updatedatail.do">
						<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
						정보 수정
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" onclick="fn_logout();">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						로그 아웃
					</a>
					</div>
				</li>
		
			</ul>
	
		</nav>
		<!-- Begin Page Content -->
        <div class="container-fluid">

			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">			
			</div>
			
			<!-- Begin Page Content -->
			<div class="limiter">
				<div class="container-login100" style="background-image: url('/resources/images/bg-01.jpg');">
					<div class="wrap-login100">
						<form class="login100-form validate-form">
							<span class="login100-form-title p-b-34 p-t-27">
								회원 가입
							</span>
		
							<div class="wrap-input100 validate-input" data-validate = "Enter userId" >
								<input class="input100" type="text" id="USERID" name="USERID" placeholder="아이디는 6~12자 입니다(특수문자 제외)">
							</div>
							<div class="container-login100-form-btn">
								<button class="login100-form-btn" type="button" id="checkbtn" onclick="fn_checkbtn();">
									중복 확인
								</button>
								<button class="login100-form-btn" type="button" id="rebtn" value="no" onclick="fn_rebtn();">
									수정
								</button>
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Enter username">
								<input class="input100" type="text" id="USERNM" name="USERNM" placeholder="이름 ( ex> 윤준,yoon jun )">
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Enter PASSWD">
								<input class="input100" type="password" id="PASSWD" name="PASSWD" placeholder="비밀번호 특수문자 / 문자 / 숫자가 포함된 8~15자">
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Enter Repeat_Password" >
								<input class="input100" type="password" id="Repeat_Password" name="Repeat_Password" placeholder="비밀번호 확인">
							</div>
							<div class="wrap-input100 validate-input" data-validate = "Enter MOBILE">
								<input class="input100" type="text"  id="MOBILE" name="MOBILE" placeholder="핸드폰 번호( ex>010-0000-0000 )">
							</div>
							<div class="wrap-input100 validate-input" data-validate="Enter EMAIL">
								<input class="input100" type="text" id="EMAIL" name="EMAIL" placeholder="이메일 양식( ex>y@naver.com )">
							</div>
							<div class="container-login100-form-btn">
								<button class="login100-form-btn" type="button" id="emailcheckbtn" onclick="fn_emailcheckbtn();">
									중복 확인
								</button>
								<button class="login100-form-btn" type="button" id="emailrebtn" value="no" onclick="fn_emailrebtn();">
									수정
								</button>
							</div>
							
							<div class="wrap-input100 validate-input">
								<select id="TEAM_CD"  name="TEAM_CD">
									<option value=0>부서 선택</option>
									<option value=1>개발</option>
									<option value=2>영업</option>
									<option value=3>인사</option>
								</select>
								
								<select id="POWER" name="POWER">
									<option value=0>직급 선택</option>
									<option value=1>사원</option>
									<option value=2>대리</option>
									<option value=3>과장</option>
									<option value=4>부장</option>
								</select>
							</div>
							<br>
							<div class="container-login100-form-btn">
								<button type="button" class="login100-form-btn" onclick="fn_insert();">
									등록
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
		</div>
			
			
		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
			</div>
		</div>
		</footer>
		<!-- End of Footer -->
	
	</div>
	<!-- End of Content Wrapper -->
	
	</div>
	<!-- End of Page Wrapper -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>
	
	<!-- Page level plugins -->
	<script src="/resources/vendor/chart.js/Chart.min.js"></script>
	
	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/chart-area-demo.js"></script>
	<script src="/resources/js/demo/chart-pie-demo.js"></script>

	
	<script>
	$(document).ready(function() {
		
		$("#rebtn").css("display", "none");
		$("#emailrebtn").css("display", "none");
	});
	
	
	function fn_emailcheckbtn(){

		var EMAIL = $("#EMAIL").val();
		var EMAILRULE =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!EMAILRULE.test(EMAIL)){
			alert("이메일 양식이 아닙니다");
			return;
		} 
		
		$.ajax({

			url: "/set/insertemailchk.do",
		    type: "post",
			dataType: "json",
			data: {"EMAIL" : EMAIL },
			success: function(data){

				if(data.insertemailchk == '0' | data.insertemailchk == 0){

					alert("사용가능한 이메일입니다");
					$("#emailrebtn").attr("value","ok");
					$("#emailrebtn").css("display", "block");
					$("#EMAIL").attr("disabled", "disabled");
					$("#emailcheckbtn").css("display", "none");
					
				}else{

					alert("중복된 이메일 입니다");
				}
				
			},error : function(data){
				console.log(data);
			}
		});	
	}
	
	function fn_emailrebtn(){

		alert("이메일을 다시 입력하세요");
		$("#EMAIL").removeAttr("disabled");
		$("#emailrebtn").css("display", "none");
		$("#emailrebtn").removeAttr("value");
		$("#emailcheckbtn").css("display", "block");
		
	}	
	
	function fn_checkbtn(){

		var USERID = $("#USERID").val();
		var IDRULE= /^[A-Za-z0-9]{6,12}$/;
		
		if(!IDRULE.test(USERID)){
			alert("아이디는 6~12자 입니다(특수문자 제외)");
			return;
		} 
		
		$.ajax({

			url: "/set/insertchk.do",
		    type: "post",
			dataType: "json",
			data: {"USERID" : USERID },
			success: function(data){

				if(data.insertidchk == '0' | data.insertidchk == 0){

					alert("사용가능한 아이디입니다");
					$("#rebtn").attr("value","ok");
					$("#rebtn").css("display", "block");
					$("#USERID").attr("disabled", "disabled");
					$("#checkbtn").css("display", "none");
				}else{

					alert("중복된 아이디입니다");
				}
				
			},error : function(data){
				console.log(data);
			}
		});	
	}

	function fn_rebtn(){

		alert("아이디를 다시 입력하세요");
		$("#USERID").removeAttr("disabled");
		$("#rebtn").css("display", "none");
		$("#rebtn").removeAttr("value");
		$("#checkbtn").css("display", "block");
		
	}

	function fn_insert(){
		

		var USERID = $("#USERID").val();
		var USERNM = $("#USERNM").val();
		var PASSWD = $("#PASSWD").val();
		var PASSWDCHK = $("#Repeat_Password").val();
		var TEL = $("#MOBILE").val();
		var EMAIL = $("#EMAIL").val();
		var TEAMCD = $("#TEAM_CD").val();
		var POWER = $("#POWER").val();
		var IDRULE= /^[A-Za-z0-9]{6,12}$/;
		var NAMERULE = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var PASSWDRULE= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var TELRULE = /^\d{3}-\d{3,4}-\d{4}$/;
		var EMAILRULE =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var IDCHECK = $("#rebtn").val();
		var EMAILCHECK = $("#emailrebtn").val();

		if(USERID == ""){
			alert("아이디를 입력해 주세요");
			return;
		}
		if(!IDRULE.test(USERID)){
			alert("아이디는 6~12자 입니다(특수문자 제외)");
			return;
		} 
		if(USERNM == ""){
			alert("사용자 이름을 입력해 주세요");
			return;
		}
		if(!NAMERULE.test(USERNM)){
			alert("이름은 한글(2~4글자), 영문 firstname(2~10글자) lastname(2~10)여야합니다( ex> yoon jun )");
			$("#USERNM").val("");
			return;
		}
		if(PASSWD == ""){
			alert("비밀번호를 입력해 주세요");
			return;
		}
		if(PASSWDCHK== ""){
			alert("비밀번호 확인 란을 입력해주세요");
			return;
		}
		if(PASSWD != PASSWDCHK){
			alert("비밀번호가 서로 다릅니다");
			$("#Repeat_Password").val("");	
			return;
		}
		if(!PASSWDRULE.test(PASSWD)){
			alert("비밀번호는 특수문자 / 문자 / 숫자가 포함된 8~15자 여야합니다");
			$("#PASSWD").val("");
			$("#PASSWD_check").val("");
			return;
		}
		if(TEL == ""){
			alert("핸드폰 번호를 입력 하세요");
			return;
		}
		if(!TELRULE.test(TEL)){
			alert("핸드폰 번호 양식이 아닙니다 ( ex>010-0000-0000 )");
			$("#MOBILE").val("");
			return;
		}
		if(EMAIL == ""){
			alert("이메일을 입력하세요");
			return;
		}
		if(!EMAILRULE.test(EMAIL)){
			alert("이메일 양식이 아닙니다");
			$("#EMAIL").val("");
			return;
		}
		if(TEAMCD == "0"){
			alert("부서를 선택해 주세요");
			return;
		}
		if(POWER == "0"){
			alert("직급을 선택해 주세요");
			return;
		}
		
		if(IDCHECK != "ok"){
			alert("아이디 중복확인을 해주세요");
			return;
		}
		if(EMAILCHECK != "ok"){
			alert("이메일 중복확인을 해주세요");
			return;
		}
		var USERINSERTCHK= {"USERID" : USERID };
		$.ajax({
			url: "/set/insertchk.do",
		    type: "post",
			dataType: "json",
			data: USERINSERTCHK,
			success: function(data){
				
				if(data.insertidchk == '0'| data.insertidchk == 0){	
					var insert = confirm("입력하신 정보로가입을 하시겠습니까?");
					if(insert){
					    fn_userinsert();
					}else{
					    alert("가입 정보를 확인해주세요");
					}
				}else{
					alert("중복된 아이디가 있습니다 중복 확인을 해주세요");
				}
			},error : function(data){
				console.log(data);
			}
		});
		
	}

	function fn_userinsert(){
		

		var USERID = $("#USERID").val();
		var USERNM = $("#USERNM").val();
		var PASSWD = $("#PASSWD").val();
		var TEL = $("#MOBILE").val();
		var EMAIL = $("#EMAIL").val();
		var TEAMCD = $("#TEAM_CD").val();
		var POWER = $("#POWER").val();

		var USERINSERT={"USERID" : USERID , "USERNM" : USERNM , "PASSWD" : PASSWD , "TEL" : TEL , "EMAIL" : EMAIL , "TEAMCD" : TEAMCD ,"POWER" : POWER };
		
		$.ajax({

			url: "/set/userinsert.do",
		    type: "post",
			dataType: "json",
			data: USERINSERT,
			success: function(data){
				if(data.userinsert == '1' | data.userinsert ==1 ){
					alert("정상적으로 가입 되었습니다.");
					window.location.href = "/set/userlist.do";
				}else{
					alert("오류가 발생하여 정상적으로 가입이 되지 않았습니다")
				}
				
			},
		});
	}


	function fn_logout(){

		var ID = "${UserLogin.USER_ID}";
		var LOGOUT = {"ID" : ID };
		
		$.ajax({
			url: "/set/logout.do",
		    type: "post",
			dataType: "json",
			data:LOGOUT ,
			success: function(data){
				if(data.logout == '1' | data.logout == 1){
					window.location.href = "/";
				}else{
					alert("오류로 인하여 로그아웃이 잘못되었습니다 홈페이지를 재접속 해주세요");
				}
			},
		});
	}
	</script>

</body>

</html>
