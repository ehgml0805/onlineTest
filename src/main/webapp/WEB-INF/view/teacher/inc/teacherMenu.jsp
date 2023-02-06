<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호수정</a>
	<!--
		시험회차 CRUD?
		시험 회차 관련(test)관리 등록 수정 삭제가능하게 뭐 하고 싶은게 있으면 더 해도 됨
		개별 회차 클릭하면 그 회차의 시험을 볼 수 있으며 관리 등록 수정 삭제가 가능하게
	-->
	<a href="${pageContext.request.contextPath}/teacher/testList">시험 관리</a>
	<!-- 모두가 가능 -->
	<c:if test="${loginEmp != null || loginStudent != null || loginTeacher != null }">
		<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
	</c:if>
</div>
