<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/teacher/modifyQuestion">
			<input type="hidden" name="questionNo" value="${qNo}">
			시험 번호 <input type="text" name="testNo" value="${tNo}">
			<div>
				문제 번호 <input type="text" name="questionIdx" value="${qIdx}" >
				제목 <input type="text" name="questionTitle" value="${qIdxqTitle}">
			</div>
			<div>
				<button type="submit">문제수정</button>
			</div>
		</form>
</body>
</html>