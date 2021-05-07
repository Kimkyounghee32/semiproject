<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/loginform.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/main.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="page">
<div class="logodiv">
	<jsp:include page="../layout/logo.jsp"></jsp:include>
</div>
<form method="post" action="loginaction.jsp">
	<div class="lgmdiv">
		<input type="text" class="lgm form-control" name="id" placeholder="아이디를 입력해주세요">
		<input type="text" class="lgm form-control" name="pw" placeholder="패스워드를 입력해주세요">
		<button class="btn btn-success" type="submit">로그인</button>
	</div>
</form>
	<div class="lgmdiv">
		<a>아이디 찾기</a> <a>비밀번호 찾기</a> <a>회원가입</a>
	</div>
</div>
</body>
</html>