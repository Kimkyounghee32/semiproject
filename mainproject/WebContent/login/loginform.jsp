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
		<input type="text" class="lgm form-control" name="id" placeholder="아이디를 입력해주세요">
		<input type="text" class="lgm form-control" name="pwd" placeholder="패스워드를 입력해주세요">
		<button class="btn btn-success" type="submit">로그인</button>
</div>
	<div class="lgmdiv">
		<a href="findID.jsp">아이디 찾기</a> <a href="findPW.jsp">비밀번호 찾기</a> <a href="createuser.jsp">회원가입</a>
	</div>
</div>
</body>
<script type="text/javascript">
	document.querySelector("button").addEventListener("click", function(e) {
		$.ajax({
			type:"post",
			url:"loginaction.jsp",
			dataType:"json",
			data:{"id":$("input[name=id]").val(),
				"pwd":$("input[name=pwd]").val()},
			success:function(data){
				if(data.id==true){
				console.log("성공");
				location.href="/mainproject/main.jsp";
				}
				else{
					alert("아이디 또는 비밀번호를 잘못입력하셨습니다");
				}
			}		
		});
		
	});			

</script>
</html>