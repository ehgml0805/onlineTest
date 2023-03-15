<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 시험보기</title>
</head>
<body>
	<c:forEach var="one" items="${testOne}">
		<h3>시험: ${one.testTitle}<br>
		시험종료 일자: ${one.testEndDate}</h3>
	</c:forEach>
	
	<c:forEach var="Q" items="${list}">
		<div>
			<!-- 그냥 for문 돌리면 문제가 4번 반복됨 보기가 4개라서,, 그래서 1번 출력하기 위해 -->
			<c:if test="${Q.eIdx == 1}">
				${Q.qIdx}. ${Q.qTitle} 
			</c:if>
		</div>
			<input type="checkbox" name="answer" id="exampleIdx${Q.eIdx}" value="${Q.eIdx}">${Q.eIdx}. ${Q.eTitle}
		<%-- <c:if test="${Q.eIdx == 1}">
			<input type="checkbox" name="exampleIdx" id="exampleIdx${Q.eIdx}" value="${Q.eIdx}">${Q.eIdx}. ${Q.eTitle}
		</c:if>
		<c:if test="${Q.eIdx == 2}">
			<input type="checkbox" name="exampleIdx" id="exampleIdx${Q.eIdx}" value="${Q.eIdx}">${Q.eIdx}. ${Q.eTitle}
		</c:if>
		<c:if test="${Q.eIdx == 3}">
		<input type="checkbox" name="exampleIdx" id="exampleIdx${Q.eIdx}" value="${Q.eIdx}">${Q.eIdx}. ${Q.eTitle}
		</c:if>
		<c:if test="${Q.eIdx == 4}">
			<input type="checkbox" name="exampleIdx" id="exampleIdx${Q.eIdx}" value="${Q.eIdx}">${Q.eIdx}. ${Q.eTitle}
		</c:if> --%>
	</c:forEach>
	
	
	<script>
	
	
	</script>
</body>
</html>