<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<h1></h1>
	<c:forEach var="to" items="${tOList}">
		${to.testNo}
		${to.testTitle}
		${to.testDate}
		${to.testState}
	</c:forEach>
	<div>
	<table border="1">
		<tr>
			<c:forEach var="q" items="${qList}" step="1">
				<td>${q.qIdx}</td>
				<td>${q.qTitle}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="e" items="${exList}" >
				<td>${e.eIdx }</td>
				<td>${e.eTitle }</td>
				<td>${e.eOx }</td>
			</c:forEach>
		</tr>
	</table>
	</div>
	
</body>
</html>