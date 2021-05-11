<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/loginform.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<%
	if(session.getAttribute("loginok")=="yes"){
		String id=(String)session.getAttribute("id");
	%>
	<b><%=id %>님</b>
	<script type="text/javascript">console.log("tq?");</script>
	<b class="loginjsp" onclick="location.href='login/mypage.jsp'">마이페이지</b> 
	<b class="loginjsp" onclick="location.href='login/logout.jsp'">로그아웃</b> 

<%	}
	else{%>
<b class="loginjsp" onclick="location.href='login/loginform.jsp'">로그인</b> 
<b class="loginjsp" onclick="location.href='login/createuser.jsp'">회원가입</b> 
<b class="loginjsp" onclick="location.href='login/.jsp'">아이디찾기</b>
		
<%} %>	
</body>
</html>