<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<h1>강사 추가</h1>
	<div>
		${errorMsg}
	</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addTeacher">
		<table>
			<tr>
				<td>teacherId</td>
				<td><input type="text" name="teacherId"></td>
			</tr>
			<tr>
				<td>teacherPw</td>
				<td><input type="password" name="teacherPw"></td>
			</tr>
			<tr>
				<td>teacherName</td>
				<td><input type="text" name="teacherName"></td>
			</tr>	
		</table>
		<button type="submit">강사추가</button>
	</form>
</body>
</html>