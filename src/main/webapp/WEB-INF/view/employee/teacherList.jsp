<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<h1>Employee List</h1>
	<a href="${pageContext.request.contextPath}/employee/addTeacher">강사등록</a>
	<table>
		<tr>
			<th>teacherId</th>
			<th>teacherName</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${tList}">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/removeTeacher?studentNo=${t.teacherNo}">
						삭제
					</a>
				</td> 
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}">이전</a>
		<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}">다음</a>
	</div>
</body>
</html>