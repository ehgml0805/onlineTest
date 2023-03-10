<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				
			<div class="container-fluid">
				<a class="navbar-brand" href="#">${loginEmp.empName}</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-link active" aria-current="page" href="#">${loginEmp.empName}</a> 
						<!-- 로그인 안되어 있으면  -->
						<c:if test="${loginEmp == null}">
							<!-- 로그인 모달 버튼 -->
							<a class="nav-link" href="loginModal" data-bs-toggle="modal" data-bs-target="#EmpLoginModal" style="">관리자로그인</a>
							
							<!-- 로그인 모달 내부 -->
							<div class="modal fade" id="EmpLoginModal" tabindex="-1" aria-labelledby="empModalLabel" aria-hidden="true">
						
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="empLoginModalLabel">관리자 로그인</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="${pageContext.request.contextPath}/loginEmp" method="post" id="eloginForm">
						
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">관리자 ID</label>
													<input type="text" name="empId" id="empId" class="form-control" placeholder="아이디를 입력하세요.">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">관리자 PW</label>
													<input type="password" name="empPw" id="empPw" class="form-control" placeholder="비밀번호를 입력하세요.">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary" id="eloginBt">관리자 로그인</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 강사 로그인 -->
							<a class="nav-link" href="loginModal" data-bs-toggle="modal" data-bs-target="#TLoginModal">강사로그인</a>
							
							<!-- 로그인 모달 내부 -->
							<div class="modal fade" id="TLoginModal" tabindex="-1" aria-labelledby="TModalLabel" aria-hidden="true">
						
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="TLoginModalLabel">강사 로그인</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="${pageContext.request.contextPath}/loginTeacher" method="post" id="tloginForm">
						
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">강사 ID</label>
													<input type="text" name="teacherId" id="teacherId" class="form-control" placeholder="아이디를 입력하세요.">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">강사 PW</label>
													<input type="password" name="teacherPw" id="teacherPw" class="form-control" placeholder="비밀번호를 입력하세요.">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary" id="tloginBt">강사 로그인</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- 학생 로그인 -->
							<a class="nav-link" href="loginModal" data-bs-toggle="modal" data-bs-target="#SLoginModal">학생로그인</a>
							
							<!-- 로그인 모달 내부 -->
							<div class="modal fade" id="SLoginModal" tabindex="-1" aria-labelledby="SModalLabel" aria-hidden="true">
						
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="SLoginModalLabel">학생 로그인</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="${pageContext.request.contextPath}/loginStudent" method="post" id="sloginForm">
						
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">학생 ID</label>
													<input type="text" name="studentId" id="studentId" class="form-control" placeholder="아이디를 입력하세요.">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">학생 PW</label>
													<input type="password" name="studentPw" id="studentPw" class="form-control" placeholder="비밀번호를 입력하세요.">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary" id="sloginBt">학생 로그인</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						
						
						<!-- 관리자 로그인시 보여줄 화면 -->
						<c:if test="${loginEmp != null}">
							<!-- 사원관리 -->
							<a class="nav-link" href="${pageContext.request.contextPath}/employee/empList">사원관리</a>
							<!-- 강사 비번 수정-->
							<a class="nav-link" href="${pageContext.request.contextPath}/employee/teacher/teacherList">강사관리</a>
							<!-- 학생 관리  -->
							<a class="nav-link" href="${pageContext.request.contextPath}/employee/student/studentList">학생관리</a>
							<!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
							
							<!-- 비밀번호 수정 모달 버튼 -->
							<a class="nav-link" href="loginModal" data-bs-toggle="modal" data-bs-target="#pwModifyModal">비밀번호수정</a>
							
							<!-- 비밀버호 수정 모달 내부 -->
							<div class="modal fade" id="pwModifyModal" tabindex="-1" aria-labelledby="pwModifyLabel" aria-hidden="true">
						
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="pwModifyModalLabel">${loginEmp.empName}님 비밀번호 수정</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form action="${pageContext.request.contextPath}/employee/modifyEmpPw" method="post" id="modifyForm">
						
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">기존 비밀번호</label>
													<input type="password" name="oldPw" id="oldPw" class="form-control" placeholder="기존 비밀번호를 입력하세요.">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">신규 비밀번호</label>
													<input type="password" name="newPwCk" id="newPwCk" class="form-control" placeholder="신규 비밀번호를 입력하세요.">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">신규 비밀번호 확인</label>
													<input type="password"  name="newPw" id="newPw" class="form-control" placeholder="신규 비밀번호를 다시 입력하세요.">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary" id="modifyBt">비밀번호 수정</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							
						</c:if>
						
						<!-- 모두가 가능 -->
						<c:if test="${loginEmp != null || loginStudent != null || loginTeacher != null }">
							<a class="nav-link" href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
						</c:if>
					</div>
				</div>
			</div>
			
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-secondary" type="submit">Search</button>
			</form>
		</nav>
	</div>
	
<script>
	//관리자 로그인
	$('#eloginBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('관리자 로그인 클릭');
		if($('#empId').val()==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if($('#empPw').val()==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
		$('#eloginForm').submit();
	});
	//강사 로그인
	$('#tloginBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('강사 로그인 클릭');
		if($('#teacherId').val()==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if($('#teacherPw').val()==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
		$('#tloginForm').submit();
	});
	//학생 로그인
	$('#sloginBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('학생 로그인 클릭');
		if($('#studentId').val()==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if($('#studentPw').val()==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
		$('#sloginForm').submit();
	});
	
	//비밀번호 수정
	$('#modifyBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('PW 수정 클릭');
		if($('#oldPw').val()==""){
			alert('기존 비밀번호를 입력해주세요!');
			return false;
		}
		if($('#newPw').val()==""){
			alert('신규 비밀번호를 입력해주세요!');
			return false;
		}
		if($('#newPwCk').val()!=$('#newPw').val()){
			alert('신규 비밀번호를 확인해주세요!');
			return false;
		}	
		$('#modifyForm').submit();
	});
	
     // 관리자 로그인
     const empLoginmodal = document.querySelector('#EmpLoginModal')
     const empIdInput = document.querySelector('#empId')
  
     empLoginmodal.addEventListener('shown.bs.modal', function () {
    	 empIdInput.focus()
     })
     //강사 로그인
     const TLoginmodal = document.querySelector('#TLoginModal')
     const teacherIdInput = document.querySelector('#teacherId')
  
     TLoginmodal.addEventListener('shown.bs.modal', function () {
    	 teacherIdInput.focus()
     })
     //학생 로그인
     const SLoginModal = document.querySelector('SLoginModal')
     const studentIdInput = document.querySelector('#studentId')
  
     SLoginModal.addEventListener('shown.bs.modal', function () {
    	 studentIdInput.focus()
     })
     
     // 비밀번호 수정 
     const pwModifymodal = document.querySelector('#pwModifyModal')
     const oldPwInput = document.querySelector('#oldPw')
  
     pwModifymodal.addEventListener('shown.bs.modal', function () {
    	 oldPwInput.focus()
     })
     
</script>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
</script>
</body>
</html>