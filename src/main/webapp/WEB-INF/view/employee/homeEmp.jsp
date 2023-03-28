<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP 홈</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>

	<!-- 로그인 됨 
	<c:if test="${loginEmp!=null}">
	${loginEmp.empName} 님 반갑습니다.
	</c:if> -->
	<img src="${pageContext.request.contextPath}/img/3.jpg" style="width: 1300px; height: 770px;">
</body>
</html>