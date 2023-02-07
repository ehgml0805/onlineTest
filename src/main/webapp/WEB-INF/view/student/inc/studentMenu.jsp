<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호수정</a>
	<!--
		시험 보기 들어오면 봐야할 시험이랑 봤었던 시험 볼 예정인 시험 나누고 점수까지
		각 리스트 별 점수랑 시험 응시 버튼 누르면 시험봐야대(question JOIN example ) 그러고 답안지 확인 후 제출 까지(paper) 
		문자랑 보기 그룹콘캣+INNER JOIN 
	-->
	<a href="${pageContext.request.contextPath}/student/testList">시험보기</a>
	<!-- 모두가 가능 -->
	<c:if test="${loginEmp != null || loginStudent != null || loginTeacher != null }">
		<a href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
	</c:if>
</div>
