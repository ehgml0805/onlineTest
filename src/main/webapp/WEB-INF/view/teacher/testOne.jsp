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
	</c:forEach>
	<div>
	<table border="1">
		<tr>
			<td>문제 번호</td>
			<td>문제 제목</td>
			<td>보기 번호</td>
			<td>보기 내용</td>
			<td>정답</td>
		</tr>
		<tr>
			<c:forEach var="q" items="${qList}" begin="" step="1">
			<c:if test="${status.index%5==0}"> <!-- td가 계속 반복해서 떠서 5개의 인덱스가 생기면 줄바꿈 -->
				</tr><tr>
			</c:if>
				<td>${q.qIdx}</td>
				<td>${q.qTitle}</td>
				<td>${q.eIdx}</td>
				<td>${q.eTitle}</td>
				<td>${q.eOX}</td>
			</c:forEach>
		</tr>
	</table>
	</div>
	
</body>
</html>