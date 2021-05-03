<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="main.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
	#mbtipage {
	min-width: 1200px;
	max-width: 1200px;
	margin: auto;
	padding: 10px;
	height: 100vh;
	}
	
	div.img{	
	background-image:url('mbtitest.png');
	background-repeat:no-repeat;
	width: 1120px;
	height: 850px;
	margin-top: 0px;
	}	
	
	div.text{
	margin-left : 100px; 
	}
	
	div.choose{
	width: 600px;
	margin-left:350px;
	}
	
	#text2{
	padding-top: 500px;
	margin-left:200px;
	color: #18A8F1;
	}
</style>
</head>
<body>
<div id="mbtipage">
<div class="img">
<div class="text">
<h2 id="text2">
<b>
낯선 곳으로 출사를 나가기로 한 당신!<br>누구와 함께 갈 것인가요?</b></h2><br>
</div>
<div class="choose">
<button type="button" class="btn btn-info btn-lg button" style="background-color : #4B89DC; border: none;">
누구랑 가긴 누구랑 가! 무조건 혼자 간다!
</button>
<br>
<br>
<button type="button" class="btn btn-info btn-lg button" style="background-color : #4B89DC; border: none;">
낯선 곳은 무서우니까~ 커뮤니티에서 친구를 구한다!
</button>
</div>
</div>
</div>
</body>
</html>