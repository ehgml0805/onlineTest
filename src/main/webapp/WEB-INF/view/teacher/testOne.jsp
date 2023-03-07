<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<h1></h1>
		<c:forEach var="one" items="${testOne}">
		${one.testNo},${one.testTitle},${one.testDate},${one.teacherNo}
		</c:forEach>
		<div>
		<c:forEach var="Q" items="${QList}">
			<c:if test="${status.index%2==0}"> <!-- 5개의 인덱스가 생기면 줄바꿈 -->
				</div><div>
			</c:if>
		문제 ${Q.qIdx}. ${Q.qTitle}
			<c:forEach var="Q" items="${QList}">
			
			</c:forEach>
			</div>
		</c:forEach>
		<%-- <c:forEach var="tq" items="${tQList}">
			<c:if test="${status.index%5==0}"> <!-- 5개의 인덱스가 생기면 줄바꿈 -->
				</div><div>
			</c:if>
			시험 번호: ${tq.testNo},
			시험 제목: ${tq.testTitle},
			시험 날짜: ${tq.testDate}
			<div>
			
				문제 ${tq.qIdx}. ${tq.qTitle}
				<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${tq.questionNo}&testNo=${tq.testNo}">삭제</a>
				<a href="${pageContext.request.contextPath}/teacher/modifyQuestion?questionNo=${tq.questionNo}&testNo=${tq.testNo}">수정</a>
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
				<c:if test="${tq.qIdx != e.qIdx}">
				 보기추가
				</c:if>
			</c:forEach>
		</c:forEach> --%>
		
		<br>
		<!-- 시험 문제 추가 모달 버튼 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#QModal">문제추가</button>
		<!-- 시험 추가 모달 내부 -->
		<div class="modal fade" id="QModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">문제 추가하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="${pageContext.request.contextPath}/teacher/addQuestion" method="post">
		        
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">시험 번호</label>
		            <input type="text" name="testNo" class="form-control" id="testNo" value="" readonly="readonly" >
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">시험 제목</label>
		            <input type="text" name="testTitle" class="form-control" id="testTitle" value="" readonly="readonly" >
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">문제 번호</label>
		            <input type="text" name="questionIdx" class="form-control" id="questionIdx" >
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">문제</label>
		            <input type="text" name="questionTitle" class="form-control" id="questionTitle">
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
		<!-- 모달 자바스크립트 코드 -->
		<script>
			const qInputEl = document.querySelector('#questionIdx')
			const qmodalEl = document.querySelector('#QModal')
		
			qmodalEl.addEventListener('shown.bs.modal', function () {
				qInputEl.focus()
			})
			
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>