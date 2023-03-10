<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP 사원추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<div class="container" style="margin-top: 50px; ">
		<div class="card" style="width: 50rem; margin: auto;" >
			<h3 class="card-header">사원 등록</h3>
			<div class="card-body">
				<div>
					${errorMsg}
				</div>
				<div class="form-group row">
					<div class="input-group mb-4">
						<input type="text" id="id" placeholder="아이디를 입력하세요!" class="form-control" aria-describedby="button-addon2">
						<button type="button" id="ckBt" class="btn btn-primary">아이디 중복확인</button>
					</div>
				</div>
				
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addEmp" id="addForm">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">empId</label>
							<div class="col-sm-10">
								<input type="text" name="empId" id="empId" readonly="readonly" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">empPw</label>
							<div class="col-sm-10">
								<input type="text" name="empPw" id="empPw" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">empName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" id="empName" class="form-control">
							</div>
						</div>
						<hr>
						<div style="text-align: center;">
							<button type="button" id="addBt" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<script>
$('#ckBt').click(function(){
	console.log('클릭');
	$.ajax({
		url:'idck'
		, type:'get'
		, data : {empId:$('#id').val()}
		, success:function(model){ // model : 'YES' / 'NO'
			if(model=='YES') {
				// 사용가능한 아이디
				$('#empId').val($('#id').val());
			} else {
				// 사용중인 아이디
				alert($('#id').val()+'는 사용중인 아이디입니다');
			}
		}
	});
});

$('#addBt').click(function() {
	// 폼 유효성 검사
	// 폼 액션 전송
	console.log('회원가입 클릭');
	if($('#empId').val()==""){
		alert('아이디를 입력해주세요!');
		return false;
	}
	if($('#empId').val()!=$('#id').val()){
		alert('아이디를 확인해주세요!');
		return false;
	}
	if($('#empPw').val()==""){
		alert('비밀번호를 입력해주세요!');
		return false;
	}
	if($('#empName').val()==""){
		alert('이름을 2자 이상 입력해주세요!');
		return false;
	}
	
	$('#addForm').submit();
});

</script>
</body>
</html>