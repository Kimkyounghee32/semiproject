<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/oneboard.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<!-- 로그인된 사용자가 아니라면 로그인창으로 돌려줌 -->
<%
String loginok=(String)session.getAttribute("loginok");
if(loginok==null)
{
%> <script type="text/javascript">
alert("글을 쓰려면 먼저 로그인을 해주세요");
history.back();
</script>	
<%}else{
		//답글일 경우 4가지 읽기(원글인경우 모두 null)
		String num=request.getParameter("num");
		String reg=request.getParameter("reg"); //hidden으로 value 값 넣어주는 목적이라 int,String 상관 x
		String restep=request.getParameter("restep");
		String relevel=request.getParameter("relevel");
		String pageNum=request.getParameter("pageNum");
		//원글일 때는 null => 0으로 넘어감
		if(num==null){
			num="0";
			reg="0";
			restep="0";
			relevel="0";
			pageNum="1";
		}
	%>	<form action="board/insertaction.jsp" method="post">
			<!-- 원글일 경우 0, 답글일 경우 value 값 -->
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="reg" value="<%=reg%>">
			<input type="hidden" name="restep" value="<%=restep%>">
			<input type="hidden" name="relevel" value="<%=relevel%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
	
			<%
				//세션에서 아이디 얻어오기
				String myid=(String)session.getAttribute("mid");
			%>

		
		<input type="text" name="bdTitle" class="form-control mt-4 mb-2"
		placeholder="제목을 입력해주세요." required="required">
		<div class="form-group">
		<textarea class="form-control" rows="10" name="bdContent"
			placeholder="내용을 입력해주세요"required="required" ></textarea>
	</div>
	<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
	</form>
	<%}
%>
</body>
</html>


