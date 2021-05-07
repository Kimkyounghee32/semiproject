<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="mainproject/WebContetn/css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

body {
	padding-top: 70px;
	margin-left : 15%;
	margin-right : 15%;
	padding-bottom: 30px;
}

h4{
	font-family: Noto Sans KR;
	font-size : 23pt;
	font-weight: bold;
}

#button{
 	margin-right : 60px;
}

</style>
</head>
<body>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();
%>

<%
	//key,num,pageNum
	String key=request.getParameter("key");
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	
	//key가 널이 아닌 경우 조회수 1증가////목록에서 클릭시에만 조회수 증가
	InfoBoardDao dao=new InfoBoardDao();

	if(key!=null)
		dao.updateReadcount(num);
	
	//dto
	InfoBoardDto dto=dao.getData(num);
	
	//날짜타입
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	System.out.println(sdf);
	
	//작성자 이름 얻어오기
	
%>
<table class="table table-bordered" style="width: 1000px; border-color: white;">
	<caption><h4>정보게시글 상세</h4></caption>
	<tr>
		<td colspan="4">
			<b style="font-size: 12pt;">제목<%=dto.getSubject()%></b></td>
	</tr>
	<tr>
		<td>작성자&nbsp;<%=dto.getWriter()%></td>
		<td>작성일&nbsp;<%=dto.getWriteday() %></td>
		<td>조회&nbsp;<%=dto.getReadcount() %></td>
		<td>추천&nbsp;<%=dto.getLikes() %></td>
	</tr>
	<tr>
		<td colspan="4">
			<%=dto.getContent()%>
		</td>
	</tr>
	</table>
	
	<div id="button">
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 80px; float: right; margin-left: 10px;"
			onclick="location.href='/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum=<%=pageNum%>'">목록</button>
				
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 80px; float: right; margin-left: 10px;"
			onclick="location.href='/mainproject/main.jsp?go=board/info/infoupdateform.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>

		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 80px; float: right"
			onclick="location.href='/mainproject/board/info/infoboarddelete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
	</div>
</body>
</html>