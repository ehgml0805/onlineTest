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
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	<c:if test="${loginStudent==null}">
		<form method="post" action="${pageContext.request.contextPath}/loginStudent">
			<table border="1">
				<tr>
					<td>studentId</td>
					<td><input type="text" name="studentId"></td>
				</tr>
				<tr>
					<td>studentPw</td>
					<td><input type="text" name="studentPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	<!-- 로그인 됨 -->
	<c:if test="${loginStudent!=null}">
	${loginStudent.studentName} 님 반갑습니다.
	</c:if>
	
</body>
</html>