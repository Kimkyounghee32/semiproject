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
	div.camera img{
	width: 300px;
	position: absolute;
	left: 40%;
	top: 10%;
	}
	
	div.choose{
	position: absolute;
	left: 40%;
	top: 50%;
	}
	
	div.text{
	position: absolute;
	left: 40%;
	top: 3%;
	}
	
	div.text2{
	position: absolute;
	left: 30%;
	top: 35%;
	}
	
</style>
</head>
<body>
<div class="text">
	<h2><b>당신 성향에 맞는 카메라는?</b></h2>
</div>
<div class="camera">
<img src="mbtimain.jpg">
</div>
<div class="text2">
	<h2>낯선 곳으로 사진출사를 나가기로 한 당신! <br><br>누구랑 갈 것인가요??</h2>
</div>
<div class="choose">
<button type="button" class="btn btn-info btn-lg" style="background-color : black; border: none;">
누구랑 가긴 누구랑 가! 무조건 혼자 간다!
</button>
<br>
<br>
<button type="button" class="btn btn-info btn-lg" style="background-color : black; border: none;">
낯선 곳은 무서우니까~ 커뮤니티에서 친구를 구한다!
</button>
</div>
<script type="text/javascript">
   location.href="main.jsp?go=mbtimain.jsp";
</script>
</body>
</html>