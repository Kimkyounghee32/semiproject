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
</head>
<body>

<%
	String id=(String)session.getAttribute("id");	
	System.out.println(id);
	if(id==null){
		%>
		<script type="text/javascript">
		
		alert("모바일환경에서의 로그인이 필요합니다");
		</script>		
		
		<%
		return;
	}
	else{
	%>
		<script type="text/javascript">
			var id="<%=id%>";
		
		</script>
	
	<%
%>


<div class="page">
<div class="logodiv">
	<jsp:include page="../layout/logo.jsp"></jsp:include>
</div>
<div class="qrdiv">
	<b><%=id %>님이 접속을 시도하셨습니까?</b><br><b>화면에 보이는 번호를 클릭해주세요</b>
	<div >
	<button class="qrbtn"><%=request.getParameter("num")%></button>
	<button class="qrbtn"><%=request.getParameter("num2")%></button>
	<button class="qrbtn"><%=request.getParameter("num3")%></button>
	</div>

</div>
</div>
</body>
<script type="text/javascript">
		$("button.qrbtn").click(function(){
			//db에 번호가 있는지 체크하는것 있으면 true하고 id저장 없으면 false 하고 다시 시도하라는 페이지 출력;
			var num=$(this).text();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"qrncheck.jsp",
				data:{"number":num},
				success:function(data){
					if(data.num==true){
						$.ajax({
							//id값과 number전송;
							type:"post",
							dataType:"html",
							url:"qrinsertid.jsp",
							data:{"id":id,
								"number":num},
							success:function(data){
								
							alert("로그인되었습니다");
							return;
						}
						});
						
					}else{
						alert("화면과 다른 버튼을 누르셨습니다 다시 시도해주세요");
						return;
					}
				}
			});
		});
</script>
<%} %>
</html>