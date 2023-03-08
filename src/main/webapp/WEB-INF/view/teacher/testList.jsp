<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<h1>Test List</h1>
	<c:forEach var="testOne" items="testOne">
	</c:forEach>
	
	
	<!-- 시험 추가 모달 버튼 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#testModal" id="addTest">시험추가</button>
	<!-- 시험 추가 모달 내부 -->
	<div class="modal fade" id="testModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">시험 추가하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/teacher/addTest" method="post">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Title</label>
							<input type="text" name="testTitle" class="form-control" id="testTitle">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">TeacherNo</label>
							<input type="text" name="TeacherNo" class="form-control" id="teacherNo" value="${teacherNo}" readonly="readonly">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">추가</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 시험 목록 출력 -->
	<table>
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Teacher</th>
			<th>Date</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${tList}">
			<tr>
				<td>${t.testNo}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
				</td>
				<td>${t.teacherId}</td>
				<td>${t.testDate}</td>
				<td>
					<a data-bs-toggle="modal" data-bs-target="#testModefyModal" 
					href="${pageContext.request.contextPath}/teacher/modifyTest?testNo=${t.testNo}&teacherNo=${t.teacherNo}">수정</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 시험 수정 모달 내부 -->
	<div class="modal fade" id="testModefyModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">시험 수정하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/teacher/modefyTest" method="post">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">시험 번호</label>
							<input type="text" class="form-control" id="testNo" value="" name="testNo"/>
						</div>

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Title</label>
							<input type="text" name="testTitle" class="form-control" id="testTitle" name="testTitle">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">TeacherNo</label>
							<input type="text" name="TeacherNo" class="form-control" id="teacherNo" value="${teacherNo}" name="teacherNo" readonly="readonly">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/teacher/testList"
		method="get">
		제목: <input type="text" name="searchWord">
		<button type="submit">검색</button>
	</form>

	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=1">처음으로</a>

		<c:if test="${currentPage>1}">
			<!-- 현재 페이지가 1보다 클 경우에만  -->
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 페이지 숫자 10개씩 보이게 -->
		<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${num == currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${num}&searchWord=${searchWord}">${num}</a>
			</c:if>
			
			<c:if test="${num != currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${num}&searchWord=${searchWord}">${num}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${currentPage<lastPage}">
			<!--현재 페이지가 마지막 페이지보다 작을 때  -->
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/testList?lastPage=${lastPage}&searchWord=${searchWord}">끝으로</a>
	</div>
	
	<!-- 모달 자바스크립트 코드 -->
	<script>
		// 시험추가
		const modalEl = document.querySelector('#testModal')
		const testInputEl = document.querySelector('#testTitle')
	
		modalEl.addEventListener('shown.bs.modal', function () {
			testInputEl.focus()
		})
		//시험 수정
		const modalTl = document.querySelector('#testModefyModal')
		const testNoInputEl = document.querySelector('#inputValue')
		
	
		/* modalTl.addEventListener('shown.bs.modal', function () {
		 let testNo=document.getElementById("testNo").value
		var list = new Array(); 
		list.push("${tList}"); 
		 console.log(list+"<==list")
		 
		 console.log(testNo+"<==testNo")
		 
			$('input[name=inputValue]').attr('value',testNo);
		}) */
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>