<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

	#startbtn{
	 margin-top: 800px;
 	 margin-bottom: 100px;
 	 margin-left: 400px;
 	 margin-right: 0;
 	 font-size: 50pt;
 	 font-family: 'Gamja Flower';
 	 line-height: 60px;
	}
	div.img{	
	background-image:url('mbtistart.png');
	width: 1120px;
	height: 1200px;
	
	}

</style>
</head>
<body>
<div id="mbtipage">
<div class="img">
<div class="test">
<button type="button" class="btn btn-info btn-lg" id="startbtn" 
style="background-color : #4B89DC; border: none; width: 300px; height: 80px;" 
onclick="location.href='../mbti/test.jsp'">
start
</button>

</div>
</div>
</div>
</body>
</html>