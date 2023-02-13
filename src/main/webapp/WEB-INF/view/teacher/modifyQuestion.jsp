<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/teacher/removeQuestion">
			시험 번호 <input type="text" name="testNo">
			<div>
				문제 번호 <input type="text" name="questionIdx" >
				제목 <input type="text" name="questionTitle">
			</div>
			<div>
				<button type="submit">문제추가</button>
			</div>
		</form>
</body>
</html>