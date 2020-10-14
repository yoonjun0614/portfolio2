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
	
	<title>휴가 신청</title>
	
	<!-- Custom fonts for this template -->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	
	<!-- Custom styles for this template -->
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- Custom styles for this page -->
	<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
			<h6 class="collapse-header">결제 관리</h6>
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
		<li class="nav-item active">
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
	
		<h1 class="h3 mb-2 text-gray-800"> 결제  >  휴가 신청  >  등록하기</h1>
	
			<!-- Sidebar Toggle (Topbar) -->
			<form class="form-inline">
			<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>
			</form>
	
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
		<!-- End of Topbar -->
	
		<!-- Begin Page Content -->
		<div class="container-fluid" style="position:relative; width:1200px; height:300px; border:1 ">
			<br>
			<br>
			글&nbsp;번&nbsp;호 : <input type="text" id="VACATION_SEQ" disabled="disabled" style="width:200px;" value="${vacationdatailOne.VACATION_SEQ}">
			<br>
			<br>
			작&nbsp;성&nbsp;자 : <input type="text" id="VACATION_USER_ID" style="width:200px;" value="${UserLogin.USER_ID}" disabled="disabled">
			<br>
			<br>

			<c:if test = "${vacationdatailOne.VACATION_USER_ID eq UserLogin.USER_ID}">
				<c:if test = "${UserLogin.POWER eq '1' or  UserLogin.POWER eq '2'}">
					<c:if test = "${vacationdatailOne.VACATION_STATE eq  '1' or vacationdatailOne.VACATION_STATE eq '5'}">
						휴가 종류:
						<select id="VACATION_SORT" onchange="fn_vacationsort();">
							<option value = "0">휴가 종류를 선택해 주세요</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '1'}">selected="selected"</c:if> value = "1">오전 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '2'}">selected="selected"</c:if>value = "2">오후 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '3'}">selected="selected"</c:if>value = "3">연차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '4'}">selected="selected"</c:if>value = "4">휴가</option>
						</select>
						<br>
						<br>
						<span>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </span>
						<input type="text" id="StartDatepicker" value="${vacationdatailOne.VACATION_STARTDATE}"> <input type="text" id="EndDatepicker" value="${vacationdatailOne.VACATION_ENDDATE}">
						<br>
						<br>
					</c:if>
					<c:if test = "${vacationdatailOne.VACATION_STATE eq  '2' or vacationdatailOne.VACATION_STATE eq '3' or vacationdatailOne.VACATION_STATE eq '4'}">
						휴가 종류:
						<select id="VACATION_SORT" onchange="fn_vacationsort();" disabled="disabled">
							<option value = "0">휴가 종류를 선택해 주세요</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '1'}">selected="selected"</c:if> value = "1">오전 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '2'}">selected="selected"</c:if>value = "2">오후 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '3'}">selected="selected"</c:if>value = "3">연차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '4'}">selected="selected"</c:if>value = "4">휴가</option>
						</select>
						<br>
						<br>
						<span>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </span>
						<input type="text" id="StartDatepicker" value="${vacationdatailOne.VACATION_STARTDATE}" disabled="disabled"> <input type="text" id="EndDatepicker" value="${vacationdatailOne.VACATION_ENDDATE}" disabled="disabled">
						<br>
						<br>
					</c:if>
				</c:if>
				<c:if test ="${UserLogin.POWER eq '3' }">
					<c:if test = "${vacationdatailOne.VACATION_STATE eq  '2' or vacationdatailOne.VACATION_STATE eq '5'}">
						휴가 종류:
						<select id="VACATION_SORT" onchange="fn_vacationsort();">
							<option value = "0">휴가 종류를 선택해 주세요</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '1'}">selected="selected"</c:if> value = "1">오전 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '2'}">selected="selected"</c:if>value = "2">오후 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '3'}">selected="selected"</c:if>value = "3">연차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '4'}">selected="selected"</c:if>value = "4">휴가</option>
						</select>
						<br>
						<br>
						<span>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </span>
						<input type="text" id="StartDatepicker" value="${vacationdatailOne.VACATION_STARTDATE}"> <input type="text" id="EndDatepicker" value="${vacationdatailOne.VACATION_ENDDATE}">
						<br>
						<br>
					</c:if>
					<c:if test = "${vacationdatailOne.VACATION_STATE ne '2' and vacationdatailOne.VACATION_STATE ne '5' }">
						휴가 종류:
						<select id="VACATION_SORT" onchange="fn_vacationsort();" disabled="disabled">
							<option value = "0">휴가 종류를 선택해 주세요</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '1'}">selected="selected"</c:if> value = "1">오전 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '2'}">selected="selected"</c:if>value = "2">오후 반차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '3'}">selected="selected"</c:if>value = "3">연차</option>
							<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '4'}">selected="selected"</c:if>value = "4">휴가</option>
						</select>
						<br>
						<br>
						<span>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </span>
						<input type="text" id="StartDatepicker" value="${vacationdatailOne.VACATION_STARTDATE}" disabled="disabled"> <input type="text" id="EndDatepicker" value="${vacationdatailOne.VACATION_ENDDATE}" disabled="disabled">
						<br>
						<br>
					</c:if>
				</c:if>
			</c:if>
			<c:if test = "${vacationdatailOne.VACATION_USER_ID ne UserLogin.USER_ID}">
				휴가 종류:
				<select id="VACATION_SORT" onchange="fn_vacationsort();" disabled="disabled">
					<option value = "0">휴가 종류를 선택해 주세요</option>
					<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '1'}">selected="selected"</c:if> value = "1">오전 반차</option>
					<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '2'}">selected="selected"</c:if>value = "2">오후 반차</option>
					<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '3'}">selected="selected"</c:if>value = "3">연차</option>
					<option <c:if test = "${vacationdatailOne.VACATION_SORT eq '4'}">selected="selected"</c:if>value = "4">휴가</option>
				</select>
				<br>
				<br>
				<span>날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자 : </span>
				<input type="text" id="StartDatepicker" value="${vacationdatailOne.VACATION_STARTDATE}" disabled="disabled"> <input type="text" id="EndDatepicker" value="${vacationdatailOne.VACATION_ENDDATE}" disabled="disabled">
				<br>
				<br>
			</c:if>
			
			
			<c:if test = "${vacationdatailOne.VACATION_USER_ID eq UserLogin.USER_ID}">
				<c:if test ="${UserLogin.POWER eq 1 or UserLogin.POWER eq 2}">
					<c:if test = "${vacationdatailOne.VACATION_STATE eq  '1' or vacationdatailOne.VACATION_STATE eq  '5'}">
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationupdate();">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">수정</span>
			            </a>
			            <a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationdelete();" style="position: relative; left: 80px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">삭제</span>
			            </a>
			            <a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 160px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">목록</span>
			            </a>
		            </c:if>
					<c:if test = "${vacationdatailOne.VACATION_STATE ne '1' and vacationdatailOne.VACATION_STATE ne '5'}">
			            <a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 380px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">목록</span>
			            </a>
		            </c:if>
	            </c:if>	  
				<c:if test ="${UserLogin.POWER eq 3}">
					<c:if test = "${vacationdatailOne.VACATION_STATE eq  '2' or vacationdatailOne.VACATION_STATE eq  '5'}">
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationupdate();">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">수정</span>
			            </a>
			            <a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationdelete();" style="position: relative; left: 80px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">삭제</span>
			            </a>
			            <a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 160px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">목록</span>
			            </a>
		            </c:if>
					<c:if test = "${vacationdatailOne.VACATION_STATE ne '2' and vacationdatailOne.VACATION_STATE ne '5'}">
			            <a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 380px">
					        <span class="icon text-white-50 ">
					        	<i class="fas fa-check"></i>
					        </span>
					        <span class="text">목록</span>
			            </a>
		            </c:if>
	            </c:if>
            </c:if>
            <c:if test = "${vacationdatailOne.VACATION_USER_ID ne UserLogin.USER_ID}">
            	<c:if test="${UserLogin.POWER eq '1' or UserLogin.POWER eq '2'}">
					<a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 380px">
						<span class="icon text-white-50 ">
							<i class="fas fa-check"></i>
						</span>
						<span class="text">목록</span>
					</a>
				</c:if>
				<c:if test="${UserLogin.POWER eq '3' }">
					<c:if test="${vacationdatailOne.VACATION_STATE eq '1'}">
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationpayment();">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">결제</span>
						</a>
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationback();" style="position: relative; left: 80px">
							<span class="icon text-white-50 ">
							<i class="fas fa-check"></i>
							</span>
							<span class="text">반려</span>
						</a>
						<a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 160px">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">목록</span>
						</a>
					</c:if>
					<c:if test="${vacationdatailOne.VACATION_STATE ne '1' }">
						<a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 380px">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">목록</span>
						</a>
					</c:if>
				</c:if>
				<c:if test = "${UserLogin.POWER eq '4' }">
					<c:if test="${vacationdatailOne.VACATION_STATE eq '2' or vacationdatailOne.VACATION_STATE eq '3'}">
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationpayment();">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">결제</span>
						</a>
						<a href="#" class="border-bottom-secondary btn-icon-split" onclick="fn_vacationback();" style="position: relative; left: 80px">
							<span class="icon text-white-50 ">
							<i class="fas fa-check"></i>
							</span>
							<span class="text">반려</span>
						</a>
						<a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 160px">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">목록</span>
						</a>					
					</c:if>
					<c:if test="${vacationdatailOne.VACATION_STATE eq '1' or vacationdatailOne.VACATION_STATE eq '4' or vacationdatailOne.VACATION_STATE eq '5'}">
						<a href="/set/vacation.do" class="border-bottom-secondary btn-icon-split" style="position: relative; left: 380px">
							<span class="icon text-white-50 ">
								<i class="fas fa-check"></i>
							</span>
							<span class="text">목록</span>
						</a>
					</c:if>
				</c:if>
			</c:if>			
		</div>
		<!-- /.container-fluid -->
	
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
	<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
$(document).ready(function() {
	
	var SORT= ${vacationdatailOne.VACATION_SORT};
	
	if(SORT != "4"){
		$("#EndDatepicker").attr("type", "hidden");
	}
			

	
});

$(function() {
    //input을 datepicker로 선언
    $("#StartDatepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "+D"
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });              
});

$(function() {
    //input을 datepicker로 선언
    $("#EndDatepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
});


function fn_vacationupdate(){
	
	
	var VACATION_SEQ =$("#VACATION_SEQ").val();
	var VACATION_SORT = $("#VACATION_SORT").val();
	var VACATION_STARTDATE =$("#StartDatepicker").val();
	var VACATION_ENDDATE =$("#EndDatepicker").val();	
	var POWER = "${UserLogin.POWER}"; 
	
	if(POWER == "1" ||  POWER == "2"){
		var VACATION_STATE = "1";
	}
	if(POWER == "3" ){
		var VACATION_STATE = "2";
	}	
	
	if(VACATION_SORT == "0"){
		alert("휴가 종류를 선택해주세요.");
		return
	}
	if(VACATION_STARTDATE == ""){
		alert("시작 날을 입력해주세요");
		return;
	}
	if(VACATION_SORT == "4"){
		if(VACATION_ENDDATE == ""){
			alert("종료 날을 입력해주세요");
			return;
		}	
	}
	
	var VACATIONIUPDATE = {"VACATION_SEQ" : VACATION_SEQ  , "VACATION_SORT" : VACATION_SORT , "VACATION_STARTDATE" : VACATION_STARTDATE , "VACATION_ENDDATE" : VACATION_ENDDATE ,"VACATION_STATE" : VACATION_STATE };
	
	$.ajax({
		url: "/set/vacationupdate.do",
	    type: "post",
		dataType: "json",
		data: VACATIONIUPDATE ,
		success: function(data){
			if(data.vacationupdate == '1' | data.vacationupdate == 1){
				alert("수정 성공");
				window.location.href = "/set/vacation.do";
			}else{
				alert("수정 실패");
			}
		},
	});
	
	
}

function fn_vacationsort(){
	
	var VACATION_SORT = $("#VACATION_SORT").val();
	if(VACATION_SORT == '4'){
		$("#EndDatepicker").attr("type", "text");
	}else{
		$("#EndDatepicker").attr("type", "hidden");
	}
	
	
}

function fn_vacationdelete(){
	
	var VACATION_SEQ =$("#VACATION_SEQ").val();
	var VACATIONDELETE = { "VACATION_SEQ" : VACATION_SEQ }
	
	$.ajax({
		url: "/set/vacationdelete.do",
	    type: "post",
		dataType: "json",
		data: VACATIONDELETE ,
		success: function(data){
			if(data.vacationdelete == '1' | data.vacationdelete == 1){
				alert("삭제 성공");
				window.location.href = "/set/vacation.do";
			}else{
				alert("삭제 실패");
			}
		},
	});
}

function fn_vacationpayment(){
	
	var VACATION_SEQ = $("#VACATION_SEQ").val();
	var POWER ="${UserLogin.POWER}";
	var VACATION_PAYMENT_USER_ID = "${UserLogin.USER_ID}";
	if(POWER == "3"){
		var VACATION_STATE = "3";
	}
	if(POWER == "4" ){
		var VACATION_STATE = "4";
	}	
	
	
	
	var VACATIONPAYMENT = {"VACATION_STATE" : VACATION_STATE , "VACATION_SEQ" : VACATION_SEQ ,"VACATION_PAYMENT_USER_ID" : VACATION_PAYMENT_USER_ID}
	
	$.ajax({
		url: "/set/vacationpayment.do",
	    type: "post",
		dataType: "json",
		data: VACATIONPAYMENT ,
		success: function(data){
			if(data.vacationpayment == '1' | data.vacationpayment == 1){
				alert("결제 성공");
				window.location.href = "/set/vacation.do";
			}else{
				alert("결제 실패");
			}
		},
	});	
	
}

function fn_vacationback(){
	
	var VACATION_SEQ = $("#VACATION_SEQ").val();
	var VACATION_PAYMENT_USER_ID = "${UserLogin.USER_ID}";
	var VACATION_STATE = "5";

	
	
	var VACATIONPAYMENT = {"VACATION_STATE" : VACATION_STATE , "VACATION_SEQ" : VACATION_SEQ ,"VACATION_PAYMENT_USER_ID" : VACATION_PAYMENT_USER_ID}
	
	$.ajax({
		url: "/set/vacationback.do",
	    type: "post",
		dataType: "json",
		data: VACATIONPAYMENT ,
		success: function(data){
			if(data.vacationback == '1' | data.vacationback == 1){
				alert("반려 성공");
				window.location.href = "/set/vacation.do";
			}else{
				alert("반려 실패");
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
