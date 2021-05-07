<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/mainproject/main.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/loginform.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="page">
<div class="logodiv">
	<jsp:include page="../layout/logo.jsp"></jsp:include>
</div>

<form method="post" action="loginaction.jsp">
	<input type="text" class="lgm form-control" name="id" placeholder="아이디를 입력해주세요">
	<input type="text" class="lgm form-control" name="pw" placeholder="패스워드를 입력해주세요">
	<input type="text" class="lgm form-control" name="email" placeholder="이메일을 입력해주세요">
	<div>
		<input type="text" class="hp form-control" name="hp">
		<input type="text" class="hp form-control" name="hp1">
		<input type="text" class="hp form-control" name="hp2">
	</div>
	<button type="submit">로그인</button>
</form>
</div>
</body>
</html>