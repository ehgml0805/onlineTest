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
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Employee List</h1>
	<a href="${pageContext.request.contextPath}/test/addTest">사원등록</a>
	<table>
		<tr>
			<th>empId</th>
			<th>empName</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
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
	
	
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath}/employee/empList" method="get">
		이름: <input type="text" name="searchWord"> <button type="submit">검색</button>
	</form>
	
	
	<div>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음으로</a>
		
		<c:if test="${currentPage>1}"><!-- 현재 페이지가 1보다 클 경우에만  -->
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- 페이지 숫자 10개씩 보이게 -->
		<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
			 <a href="${pageContext.request.contextPath}/employee/empList?currentPage=${num}">${num}</a>
		</c:forEach>
		
		<c:if test="${currentPage<lastPage}"> <!--현재 페이지가 마지막 페이지보다 작을 때  -->
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/empList?lastPage=${lastPage}&searchWord=${searchWord}">끝으로</a>
	</div>
</body>
</html>