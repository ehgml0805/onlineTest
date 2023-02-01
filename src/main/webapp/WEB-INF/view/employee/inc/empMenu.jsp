<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!-- 사원등록시 아이디 체크(emp+student+teacher) -->
	<a href="${pageContext.request.contextPath}/employee/empList">사원관리</a>
	<a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호수정</a>
	
	<!-- 강사 CRUD 로그인, 시험 관련, 비번 수정-->
	<a href="${pageContext.request.contextPath}/teacher/teacherList">강사관리</a>
	<!-- 학생 CRUD 시험치는거  -->
	<a href="${pageContext.request.contextPath}/student/studentList">학생관리</a>
	
	<!-- 모두가 가능 -->
	<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
</div>
