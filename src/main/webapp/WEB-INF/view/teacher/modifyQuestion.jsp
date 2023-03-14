<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제ㆍ보기 수정</title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	<div class="container" style="margin-top: 50px">
		<form method="post" action="${pageContext.request.contextPath}/teacher/modifyQuestion" id="QAF">
			<input type="hidden" name="testNo" id="testNo" value="${qOne.get(0).get('testNo')}">
			<input type="hidden" name="questionNo" id="questionNo" value="${qOne.get(0).get('qNo')}">
			<div>
				문제 번호 <input type="text" name="questionIdx" id="questionIdx" value="${qOne.get(0).get('qIdx')}" >
			</div>
			<div>
				문제 <input type="text" name="questionTitle" id="questionTitle" value="${qOne.get(0).get('qTitle')}">
			</div>
			<c:forEach var="qo" items="${qOne}" >
				<div>
					보기${qo.eIdx}
					<input type="hidden" name="exampleNo" value="${qo.eNo}">
					<input type="hidden" name="exampleIdx" value="${qo.eIdx}">
					<input type="text" name="exampleTitle" id="exampleTitle${qo.eIdx}" value="${qo.eTitle}">
					<input type="hidden" name="answerOx" id="answerOx${qo.eIdx}" > 
					<input <c:if test="${qo.eOx == '정답'}">checked</c:if>  
						type="checkbox" value="${qo.eOx}" id="Ox${qo.eIdx}" > 정답
				</div>
			</c:forEach>
				<div>
					<button type="submit" id="QAB">수정하기</button>
				</div>
			</form>
		</div>
	<script type="text/javascript">
	//문제, 보기 추가 폼 유효성 검사
	$('#QAB').click(function() {
		// 폼 액션 전송
		console.log('문제,보기 추가 클릭');
		if($('#questionIdx').val()==""){
			alert('문제 번호를 입력해주세요!');
			return false;
		}
		if($('#questionTitle').val()==""){
			alert('문제 제목을 입력해주세요!');
			return false;
		}
		if($('#exampleTitle').val()==""){
			alert('보기를 입력해주세요!');
			return false;
		}
		
		// 오답/정답
		let count = 0;
		for(let val = 1; val < 5; val++){
			console.log(val);
			if ($('#Ox'+val).is(':checked')) {
			    $('#answerOx'+val).val('정답');
			    count++;
			} else {
				$('#answerOx'+val).val('오답');
				
			}
		}
		if(count == 1){	// 정답 1개만 인정			
			allCheck = true;
		}else{
			alert('정답 보기를 1개만 체크해 주세요');
		}
		
		$('#QAF').submit();
	});
	</script>
</body>
</html>