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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="page">
	<div class="logodiv">
		<jsp:include page="../layout/logo.jsp"></jsp:include>
	</div>
	<div class="lgmdiv">
		<input type="text" class="lgm form-control" name="email" placeholder="이메일을 입력해주세요">
		<button id="loginac" class="btn btn-primary" type="submit">아이디찾기</button>
	</div>
</div>
<script type="text/javascript">
	$("#loginac").click(function(){
		console.log($("input[name=email]").val());
		$.ajax({
			//email 조회하고 있으면 true 없으면 false를 뱉는다
			type:"post",
			url:"findbemail.jsp",
			dataType:"html",
			data:{ email:$("input[name=email]").val() },
			success:function(data){
				location.href="result.jsp";		
			}
		});
	});
</script>
</body>
</html>