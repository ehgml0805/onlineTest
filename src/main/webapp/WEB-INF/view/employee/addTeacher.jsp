<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<h1>강사 추가</h1>
	<div>
		<input type="text" id="id"> 
		<button type="button" id="ckBt">아이디 중복확인</button>
	</div>
	<div>
		${errorMsg}
	</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher" id="addForm">
		<table>
			<tr>
				<td>teacherId</td>
				<td><input type="text" name="teacherId" id="teacherId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>teacherPw</td>
				<td><input type="password" name="teacherPw" id="teacherPw"></td>
			</tr>
			<tr>
				<td>teacherName</td>
				<td><input type="text" name="teacherName" id="teacherName"></td>
			</tr>	
		</table>
		<button type="submit" id="addBt">강사추가</button>
	</form>
</body>
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
</html>