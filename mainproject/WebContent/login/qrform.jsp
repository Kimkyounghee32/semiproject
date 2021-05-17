<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/loginform.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/qr.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/main.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

</style>
<% 
	String[] ran=new String[3];
		ran[0]=String.valueOf((int)((Math.random()*100)+1));
		ran[1]=String.valueOf((int)((Math.random()*100)+1));
		ran[2]=String.valueOf((int)((Math.random()*100)+1));
	
		//ran[3]=선택될 인덱스값
		int idx=(int)(Math.random()*3);
		
		String q=ran[idx];
%>

<script type="text/javascript">
	var q="<%=q%>";
</script>
</head>
<body>
<div class="page">
<div class="logodiv">
	<jsp:include page="../layout/logo.jsp"></jsp:include>
</div>
	<div class="qrpick">
		<img  src="http://chart.apis.google.com/chart?cht=qr&chs=350x350&
		chl=http%3a%2f%2f//ip주소입력해주세요%3a9000%2fmainproject%2flogin%2fqrrequest.jsp%3fnum%3d<%=ran[0]%>%26num2%3d<%=ran[1]%>%26num3%3d<%=ran[2]%>">
	</div>
	<div class="qrdiv">
		<b>모바일 화면에 보이는 <b class="qrnumber"><%=q%></b> 을 선택해주세요</b>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type:"post",
			dataType:"html",
			url:"qrsave.jsp",
			data:{"number":q},
			success:function(data){
						var time=setInterval(timmer,6000);
						setTimeout(function() {
							clearInterval(time);
							$.ajax({
								type:"post",
								dataType:"html",
								url:"qrdelete.jsp",
								data:{"number":q},			
								success:function(data){
								alert("시간초과입니다");
								history.go(-1);
								}
							});
						}, 60000);
			}
		});
	});
	
	function timmer(){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"qridtimmer.jsp",
			data:{"number":q},
			success:function(data){
				if(data.id!=false){
					clearInterval(timmer);
					$.ajax({
						type:"post",
						dataType:"html",
						url:"qrdelete.jsp",
						data:{"number":q},			
						success:function(data){
							location.href="/mainproject/main.jsp";
						}
					});
					
				}
			}
				
			});
		
			
	}
	window.onbeforeunload = function() {
		$.ajax({
			type:"post",
			dataType:"html",
			url:"qrdelete.jsp",
			data:{"number":q},			
			success:function(data){
			alert("시간초과입니다");
			history.go(-1);
			}
		});
	}
</script>	

</html>


