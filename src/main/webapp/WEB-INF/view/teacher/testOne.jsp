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
			<c:if test="${status.index%5==0}"> <!-- 5개의 인덱스가 생기면 줄바꿈 -->
				</div><div>
			</c:if>
			<%-- 시험 번호: ${tq.testNo},
			시험 제목: ${tq.testTitle},
			시험 날짜: ${tq.testDate} --%>
			<div>
				문제 ${tq.qIdx}. ${tq.qTitle}
				<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${tq.qIdx}">삭제</a>
				<a href="${pageContext.request.contextPath}/teacher/modifyQuestion?questionNo=${tq.qIdx}&testNo=${tq.testNo}">수정</a>
			</div>
			<br>
			<c:forEach var="e" items="${eList}">
				<c:if test="${tq.qIdx == e.qIdx}">
					<c:if test="${status.index%3==0}"> <!-- 3개의 인덱스가 생기면 줄바꿈 -->
							</div><div>
					</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${e.eIdx}.
					&nbsp;${e.eTitle}
					&nbsp;${e.eOx}
				</c:if>
			</c:forEach>
		</c:forEach>
		
		<br>
		<!-- 시험문제 추가 20개까지 -->
		<form method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
			시험 번호 <input type="text" name="testNo" value="${testNo}" readonly="readonly">
			<div>
				문제 번호 <input type="text" name="questionIdx">
				제목 <input type="text" name="questionTitle">
			</div>
			<div>
				<button type="submit">문제추가</button>
			</div>
		</form>
	
</body>
</html>