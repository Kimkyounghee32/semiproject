<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.OneBoardDto"%>
<%@page import="data.dao.OneBoardDao"%>
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
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	OneBoardDao dao=new OneBoardDao();
	OneBoardDto dto=dao.getData(num);
	
	%>	<form action="oneboard/updateaction.jsp" method="post" id="updateform">
			<!-- 원글일 경우 0, 답글일 경우 value 값 -->
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
	
			<%
				//세션에서 아이디 얻어오기
				String myid=(String)session.getAttribute("id");
			%>
		<input type="text" name="subject" class="form-control" id="bdTitle"
		 required="required" value="<%=dto.getSubject()%>">
		<div class="form-group">
		<textarea class="form-control" rows="10" name="content" id="bdContent"
		required="required" ></textarea>	
		</div>
		
		<div class="btn form-inline">
		
		<button type="button" class="btn btn-secondary" id="listbtn"
		onclick="location.href='/mainproject/main.jsp?go=oneboard/oneboardlist.jsp'">목록</button>
		<button type="submit" class="btn btn-secondary">수정하기</button>
		</div>
		</form>

</body>
</html>


