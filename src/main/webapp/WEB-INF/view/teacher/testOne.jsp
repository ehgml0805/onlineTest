<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
		<c:forEach var="one" items="${testOne}">
		<h3>시험: ${one.testTitle}<br>
		시험등록 일자: ${one.testDate}</h3>
		</c:forEach>
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
		        
		        <c:forEach var="one" items="${testOne}">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">시험 번호</label>
			            <input type="text" name="testNo" class="form-control" id="testNo" value="${one.testNo}" readonly="readonly" >
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">시험 제목</label>
			            <input type="text" name="testTitle" class="form-control" id="testTitle" value="${one.testTitle}" readonly="readonly" >
			          </div>
		          </c:forEach>
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
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#EModal">보기추가</button>
		<!-- 보기 추가 모달 내부 -->
		<div class="modal fade" id="EModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">보기 추가하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="${pageContext.request.contextPath}/teacher/addExample" method="post">
		        
		          <c:forEach var="one" items="${testOne}">
		         	 <input type="hidden" name="testNo" class="form-control" id="testNo" value="${one.testNo}">
		          </c:forEach>

		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">문제 번호</label>
		            <input type="text" name="testNo" class="form-control" id="testNo" value="${qIdx}" readonly="readonly" >
		          </div>
		          <div class="mb-3">
		          <input type="hidden" name="questionNo" class="form-control" id="questionNo" value="3">
		            <label for="recipient-name" class="col-form-label">문제</label>
		            <input type="text" name="testTitle" class="form-control" id="testTitle" value="${qTitle}" readonly="readonly" >
		          </div>
		          
		          <c:forEach var="num" begin="1" end="4">
			          <div class="mb-3">
			          <input type="hidden" name="questionNo" class="form-control" id="questionNo" value="3">
			            <label for="recipient-name" class="col-form-label">${num}. 보기</label> &nbsp;&nbsp;&nbsp;
			            <input type="hidden" name="exampleIdx" class="form-control" id="exampleIdx" value="${num }">
			            <input type="text" name="exampleTitle" class="form-control" id="exampleTitle" placeholder="보기를 입력하세요.">
			            <input type="text" name="answerOx" class="form-control" id="answerOx" placeholder="정답/ 오답을 적으세요.">
			          </div>
		          </c:forEach>
		         
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary">추가</button>
			      </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<c:forEach var="Q" items="${QList}">
		<div>
		문제 ${Q.qNo } ${Q.qIdx}. ${Q.qTitle}
		<a href="${pageContext.request.contextPath}/teacher/addExamplemodifyQuestion?questionNo=${Q.qNo}&testNo=${Q.testNo}">수정</a>
		<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${Q.qNo}&testNo=${Q.testNo}">삭제</a>
			
		</div>
			<c:forEach var="E" items="${EList}">
				
					<div>
					  ${E.eIdx}. ${E.eTitle} (${E.eOX})
					</div>
				
			</c:forEach>
		</c:forEach>
		<br>
		<script>
			const qInputEl = document.querySelector('#questionIdx')
			const qmodalEl = document.querySelector('#QModal')
		
			qmodalEl.addEventListener('shown.bs.modal', function () {
				qInputEl.focus()
			})
			const eInputEl = document.querySelector('#questionIdx')
			const emodalEl = document.querySelector('#EModal')
		
			emodalEl.addEventListener('shown.bs.modal', function () {
				qInputEl.focus()
			})
			
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>