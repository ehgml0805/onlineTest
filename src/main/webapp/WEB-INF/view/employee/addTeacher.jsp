<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP 강사등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<div class="container" style="margin-top: 50px; ">
		<div class="card" style="width: 50rem; margin: auto;" >
			<h3 class="card-header">강사 등록</h3>
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
					<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher" id="addForm">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">teacherId</label>
							<div class="col-sm-10">
								<input type="text" name="teacherId" id="teacherId" readonly="readonly" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">teacherPw</label>
							<div class="col-sm-10">
								<input type="text" name="teacherPw" id="teacherPw" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-2 col-form-label">teacherName</label>
							<div class="col-sm-10">
								<input type="text" name="teacherName" id="teacherName" class="form-control">
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
		, data : {teacherId:$('#id').val()}
		, success:function(model){ // model : 'YES' / 'NO'
			if(model=='YES') {
				// 사용가능한 아이디
				$('#teacherId').val($('#id').val());
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
	if($('#teacherId').val()==""){
		alert('아이디를 입력해주세요!');
		return false;
	}
	if($('#teacherId').val()!=$('#id').val()){
		alert('아이디를 확인해주세요!');
		return false;
	}
	if($('#teacherPw').val()==""){
		alert('비밀번호를 입력해주세요!');
		return false;
	}
	if($('#teacherName').val()==""){
		alert('이름을 2자 이상 입력해주세요!');
		return false;
	}
	
	$('#addForm').submit();
});

</script>
</body>
</html>