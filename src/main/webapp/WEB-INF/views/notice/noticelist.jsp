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
	
	<title>공지 사항</title>
	
	<!-- Custom fonts for this template -->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
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
	
		<h1 class="h3 mb-2 text-gray-800"> 공지 사항 </h1>
	
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
		<div class="container-fluid">
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">공지 사항</h6>
				</div>
				
				<div class="card-body">
					<div class="table-responsive">
					
					<table class="table table-bordered" id="dataTable5" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody id="noticeTable">
						</tbody>
					</table>
					</div>
					<c:if test="${UserLogin.TEAM_CD eq 3}">
						<c:if test="${UserLogin.POWER > 2}">
							<a href="/set/noticeenrollment.do" class="border-bottom-secondary btn-icon-split">
			                    <span class="icon text-white-50 ">
			                      <i class="fas fa-check"></i>
			                    </span>
			                    <span class="text">등록 하기</span>
		                  	</a>
	                  	</c:if>
                  	</c:if>
				</div>
				
			</div>
	
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
	
	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/datatables-demo.js"></script>
<script>
$(document).ready(function() {
	
    fn_noticelist();

});

function fn_noticelist(){
	

	$.ajax({
	
		url: "/set/noticelist.do",
	    type: "post",
		dataType: "json",
		success: function(data){
	
				for(var i=0 ; i<data.noticelist.length ; i++){
				console.log(data.noticelist);
	
				var tr = document.createElement("tr");
				var td1 = document.createElement("td");
				var td2 = document.createElement("td");
				var td3 = document.createElement("td");
				var td4 = document.createElement("td");
				var td5 = document.createElement("td");
				
				
				tr.setAttribute("onclick","fn_noticedatail('"+data.noticelist[i].NOTICE_SEQ+"');");				
				
				td1.innerHTML = data.noticelist[i].NOTICE_SEQ;
				td2.innerHTML = data.noticelist[i].NOTICE_TITLE;
				td3.innerHTML = data.noticelist[i].NOTICE_USER_ID;
				td4.innerHTML = data.noticelist[i].NOTICE_CREATEDATE;
				td5.innerHTML = data.noticelist[i].NOTICE_UPDATEDATE;
				
				
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
				tr.appendChild(td5);
				document.getElementById("noticeTable").appendChild(tr);
			}
			    $("#dataTable5").DataTable({
			        "pageLength": 10,
			        "pageing" : true,
			        "bInfo" : false,
			        "aaSorting": []
			    });
	    },
	});

}

function fn_noticedatail(seq){
	
	var noticeseq= {"NOTICE_SEQ" : seq};
	console.log(noticeseq); 
	
	
	$.ajax({
		url: "/set/noticedetail.do",
	    type: "post",
		dataType: "json",
		data:noticeseq ,
		success: function(data){

 			window.location.href = "/set/noticeupdatedetail.do?NOTICE_SEQ="+data.noticedetail.NOTICE_SEQ+"";
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
