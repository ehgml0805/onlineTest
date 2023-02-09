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
		<c:forEach var="tq" items="${tQList}">
			<%-- 시험 번호: ${tq.testNo},
			시험 제목: ${tq.testTitle},
			시험 날짜: ${tq.testDate} --%>
			<div>
				문제 ${tq.qIdx}. ${tq.qTitle}
			</div>
			<br>
			<c:forEach var="e" items="${eList}">
	
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${e.eIdx}.
				&nbsp;${e.eTitle}
				&nbsp;${e.eOx}
			</c:forEach>
		</c:forEach>
		
		
		
		<!-- 시험문제 추가 20개까지 제이쿼리로 해봐? -->
		<form method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
			<table>
				<tr>
					<th>시험 번호</th>
					<td><input type="text" name="testNo" value="${testNo}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>문제 번호</th>
					<td><input type="text" name="questionIdx"></td>
				</tr>
				<tr>
					<th>문제 제목</th>
					<td><input type="text" name="questionTitle"></td>
				</tr>
			</table>
			<button type="submit">문제추가</button>
		</form>
	
</body>
</html>