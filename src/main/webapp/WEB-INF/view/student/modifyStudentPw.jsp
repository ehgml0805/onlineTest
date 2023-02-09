<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<h1>${loginStudent.studentName}님 비밀번호 수정</h1>
	<form action="${pageContext.request.contextPath}/student/modifyStudentPw" method="post" id="modifyForm">
		<table>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" name="oldPw" id="oldPw"> </td>
			</tr>
			<tr>
				<td>신규 비밀번호</td>
				<td><input type="password" name="newPwCk" id="newPwCk"> </td>
			</tr>
			<tr>
				<td>신규 비밀번호 확인</td>
				<td><input type="password" name="newPw" id="newPw"> </td>
			</tr>
		</table>
		<button type="button" id="modifyBt">수정하기</button>
	</form>
	
</body>
<script>
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
		if($('#newPwCk').val()!=$('#id').val()){
			alert('신규 비밀번호를 확인해주세요!');
			return false;
		}	
		$('#modifyForm').submit();
	});

</script>
</html>