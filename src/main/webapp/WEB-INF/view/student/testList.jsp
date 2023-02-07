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
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	<h1>Student Test List</h1>
	<table>
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Date</th>
			<th>시험응시</th>
			<th>결과확인</th>
			
		</tr>
		<c:forEach var="t" items="${tList}">
			<tr>
				<td>${t.testNo}</td>
				<td>
					<a href="${pageContext.request.contextPath}/student/testOne?testNo=${t.testNo}">${t.testTitle}</a>
				</td>
				<td>${t.testDate}</td>
				<td>${t.testState}</td>
				<td>결과</td>
			</tr>
		</c:forEach>
	</table>
	<form action="${pageContext.request.contextPath}/student/testList" method="get">
		제목: <input type="text" name="searchWord"> <button type="submit">검색</button>
	</form>
	
	
	<div>
		<a href="${pageContext.request.contextPath}/student/testList?currentPage=1">처음으로</a>
		
		<c:if test="${currentPage>1}"><!-- 현재 페이지가 1보다 클 경우에만  -->
			<a href="${pageContext.request.contextPath}/student/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- 페이지 숫자 10개씩 보이게 -->
		<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
			 <a href="${pageContext.request.contextPath}/student/testList?currentPage=${num}">${num}</a>
		</c:forEach>
		
		<c:if test="${currentPage<lastPage}"> <!--현재 페이지가 마지막 페이지보다 작을 때  -->
			<a href="${pageContext.request.contextPath}/student/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/student/testList?lastPage=${lastPage}&searchWord=${searchWord}">끝으로</a>
	</div>
</body>
</html>