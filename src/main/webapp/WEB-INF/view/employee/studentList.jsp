<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP 학생관리</title>
<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<div class="container" style="margin-top: 50px">
		<h1>Student List</h1>
		<a href="${pageContext.request.contextPath}/employee/student/addStudent">학생등록</a>
		<table class="table table-hover" style="text-align: center;">
			<tr class="table-dark">
				<th scope="col">studentId</th>
				<th scope="col">studentName</th>
				<th scope="col">삭제</th>
			</tr>
			<c:forEach var="s" items="${sList}">
				<tr class="table-light">
					<td>${s.studentId}</td>
					<td>${s.studentName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/student/removeStudent?studentNo=${s.studentNo}"><i class="bi bi-x-square" style="color: red;"></i></a>
					</td> 
				</tr>
			</c:forEach>
		</table>
		<div class="form-group">
			<!-- 검색 -->
			<form action="${pageContext.request.contextPath}/employee/student/studentList" method="get">
				<div class="input-group mb-4">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요!" aria-label="Recipient's username" aria-describedby="button-addon2" name="searchWord">
					<button class="btn btn-primary" type="submit" id="button-addon2">검색하기</button>
				</div>
			</form>
		</div>
		<br>
		
		
		<div class="pagination" style="margin: auto;">
			<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=1" class="page-link">처음으로</a>
		
			<c:if test="${currentPage>1}">
				<!-- 현재 페이지가 1보다 클 경우에만  -->
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage-1}&searchWord=${searchWord}" class="page-link">&laquo;</a>
			</c:if>
			
			<!-- 페이지 숫자 10개씩 보이게 -->
			
				<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${num == currentPage}">
					 	<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${num}&searchWord=${searchWord}" class="page-link">${num}</a>
					 </c:if>
					 
					<c:if test="${num != currentPage}">
					 	<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${num}&searchWord=${searchWord}" class="page-link">${num}</a>
					 </c:if>
				</c:forEach>
				
			<c:if test="${currentPage<lastPage}"> 
			<!--현재 페이지가 마지막 페이지보다 작을 때  -->
			<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage+1}&searchWord=${searchWord}" class="page-link">&raquo;</a>
			</c:if>
			
			<a href="${pageContext.request.contextPath}/employee/student/studentList?lastPage=${lastPage}&searchWord=${searchWord}" class="page-link">끝으로</a>
		</div>
	</div>
</body>
</html>