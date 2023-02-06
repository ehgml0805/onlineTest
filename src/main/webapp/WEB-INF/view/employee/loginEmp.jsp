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
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<h1>로그인</h1>
	<c:if test="${loginEmp==null}">
		<form method="post" action="${pageContext.request.contextPath}/loginEmp">
			<table border="1">
				<tr>
					<td>empId</td>
					<td><input type="text" name="empId"></td>
				</tr>
				<tr>
					<td>empPw</td>
					<td><input type="text" name="empPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	<!-- 로그인 됨 -->
	<c:if test="${loginEmp!=null}">
	${loginEmp.empName} 님 반갑습니다.
	<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
	</c:if>

</body>
</html>