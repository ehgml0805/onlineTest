<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제ㆍ보기 수정</title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/teacher/modifyQuestion">
		<input type="hidden" name="testNo" value="${qOne.get(0).get("testNo")}">
		<input type="hidden" name="questionNo" value="${qOne.get(0).get("qNo")}">
		<div>
			문제 번호 <input type="text" name="questionIdx" value="${qOne.get(0).get("qIdx")}" >
		</div>
		<div>
			문제 <input type="text" name="questionTitle" value="${qOne.get(0).get("qTitle")}">
		</div>
		<c:forEach var="qo" items="${qOne}" >
			<div>
				보기
				<input type="hidden" name="exampleNo" value="${qo.eNo}">
				<input type="text" name="exampleIdx" value="${qo.eIdx}">
				<input type="text" name="exampleTitle" value="${qo.eTitle}">
				<input type="hidden" name="answerOx" value="${qo.eOx}">
				
				<input <c:if test="${qo.eOx == '정답'}">checked</c:if>  
					type="checkbox" value="${qo.eOx}" > 정답
			</div>
		</c:forEach>
			<div>
				<button type="submit">수정하기</button>
			</div>
		
		</form>
</body>
</html>