<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>사원추가</h1>
	<div>
		<input type="text" id="id"> 
		<button type="button" id="ckBt">아이디 중복확인</button>
	</div>
	<div>
		${errorMsg}
	</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addEmp" id="addForm">
		<table border="1">
			<tr>
				<td>empId</td>
				<td><input type="text" name="empId" id="empId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>empPw</td>
				<td><input type="text" name="empPw" id="empPw"></td>
			</tr>
			<tr>
				<td>empName</td>
				<td><input type="text" name="empName" id="empName"></td>
			</tr>	
		</table>
		<button type="button" id="addBt">사원추가</button>
	</form>
</body>
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
</html>