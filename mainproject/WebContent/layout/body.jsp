<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="main.css" />

<style type="text/css">
</style>
</head>
<body>
	<div id="today">
		<jsp:include page="/today/todayphoto.jsp" />
	</div>
	
	<div class="mainglmbti">
	<div class="maingl">
		<div class="test0">
			<img src="image/test2.jpg">
		</div>
		
		<div class="test1">
			<img src="image/test4.jpg">
		</div>
		<div class="test1">
			<img src="image/test5.jpg">
		</div>
	</div>
	<div class="mainmbti">
		<img alt="경로잘못됨" src="mainmbti.png">
	</div>
	</div>
	
	<div class="mainboard">
	<div class="maininfo">
		<table class="table .table-hover">
		<caption><b>정보게시판</b></caption>
		<tr>
			<td>정보게시판
			</td>
		</tr>
		<tr>
			<td>정보게시판2
			</td>
		</tr>
		<tr>
			<td>정보게시판3
			</td>
		</tr>
		</table>
	</div>

	<div class="mainjayu">
		<table class="table .table-hover">
		<caption><b>자유게시판</b></caption>
		<tr>
			<td>자유게시판
			</td>
		</tr>
		<tr>
			<td>자유게시판2
			</td>
		</tr>
		<tr>
			<td>자유게시판3
			</td>
		</tr>
		</table>
	</div>
	</div>
	
</body>
</html>