<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- 강사 -->
	<c:if test="${loginTeacher==null}">
		<form method="post" action="${pageContext.request.contextPath}/loginTeacher">
			<table border="1">
				<tr>
					<td>teacherId</td>
					<td><input type="text" name="teacherId"></td>
				</tr>
				<tr>
					<td>teacherPw</td>
					<td><input type="text" name="teacherPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	<!-- 로그인 됨 -->
	<c:if test="${loginTeacher!=null}">
		${loginTeacher.teacherName} 님 반갑습니다.
	</c:if>

</body>
</html>