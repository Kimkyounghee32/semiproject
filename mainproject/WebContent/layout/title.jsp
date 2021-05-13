<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 --></head>
<body>
			<div id="loginpage" class="container-fluid">
				<jsp:include page="/login/login.jsp" />
			</div>
			<div class="logodiv2">
			<div class="logodiv">
				<!-- <div id="logo">
					<img src="logo.jpg" /> <a  href="main.jsp"><b>Pick Pictures</b></a>
				</div> -->
				<jsp:include page="logo.jsp" />
				
			</div>
			</div>
			<div id="search">
				<input type="text" placeholder="검색어를 입력해주세요" />
				<button type="button" class="btn btn-primary btn-sm">검색</button>
			</div>
			
			
</body>
</html>