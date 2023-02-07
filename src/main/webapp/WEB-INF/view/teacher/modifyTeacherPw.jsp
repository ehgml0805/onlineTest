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
	<h1>${loginTeacher.teacherName}님 비밀번호 수정</h1>
	<form action="${pageContext.request.contextPath}/teacher/modifyTeacherPw" method="post">
		<table>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" name="oldPw"> </td>
			</tr>
			<tr>
				<td>신규 비밀번호</td>
				<td><input type="password" name="newPw"> </td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
	</form>
	
	
</body>
</html>