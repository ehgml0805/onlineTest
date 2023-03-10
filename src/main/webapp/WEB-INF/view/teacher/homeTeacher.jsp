<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 홈</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<!-- 강사 -->
	<!-- 로그인 됨 -->
	<c:if test="${loginTeacher!=null}">
		${loginTeacher.teacherName} 님 반갑습니다.
	</c:if>
	<img src="resources/img/t-home.jpg">


</body>
</html>