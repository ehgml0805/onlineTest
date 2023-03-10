<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP 사원관리</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<div class="container" style="margin-top: 50px">
		<h1>Employee List</h1>
		<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
		<table class="table table-hover" style="text-align: center;">
			<tr class="table-dark">
				<th scope="col">empId</th>
				<th scope="col">empName</th>
				<th scope="col">삭제</th>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr class="table-light">
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="form-group">
			<!-- 검색 -->
			<form action="${pageContext.request.contextPath}/employee/empList" method="get">
				<div class="input-group mb-4">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요!" aria-label="Recipient's username" aria-describedby="button-addon2" name="searchWord">
					<button class="btn btn-primary" type="submit" id="button-addon2">Button</button>
				</div>
			</form>
		</div>
		<br>
		
		<div class="pagination" style="margin: auto;">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1" class="page-link">처음으로</a>
			
			<c:if test="${currentPage>1}"><!-- 현재 페이지가 1보다 클 경우에만  -->
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}" class="page-link">&laquo;</a>
			</c:if>
			
			<!-- 페이지 숫자 10개씩 보이게 -->
			<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${num == currentPage}">
					 <a href="${pageContext.request.contextPath}/employee/empList?currentPage=${num}&searchWord=${searchWord}" class="page-link">${num}</a>
				</c:if>
				
				<c:if test="${num != currentPage}">
					 <a href="${pageContext.request.contextPath}/employee/empList?currentPage=${num}&searchWord=${searchWord}" class="page-link">${num}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${currentPage<lastPage}"> 
			<!--현재 페이지가 마지막 페이지보다 작을 때  -->
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}" class="page-link">&raquo;</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/employee/empList?lastPage=${lastPage}&searchWord=${searchWord}" class="page-link">끝으로</a>
		</div>
	</div>
</body>
</html>