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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>

<%
	//로그아웃시에도 아이디가 세션에 있기 때문에 게시글에서 수정삭제가 보인다.
	//로그인한 상태인지 확인
	String loginok=(String)session.getAttribute("loginok");

%>

<%
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		pageNum="1";
	String key=request.getParameter("key");
	
	//key가 널이 아닌 경우 조회수 1증가
	InfoBoardDao dao=new InfoBoardDao();
	
	if(key!=null)
		dao.updateReadcount(num);
	
	//dto가져오기
	InfoBoardDto dto=dao.getData(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	System.out.println(sdf);
%>

</body>
<table class="table table-bordered" style="width: 600px; margin-left: 100px;">
	<caption>정보게시글 상세</caption>
	<hr style="border: 1px solid black;">
	<tr>
		<td>
			<b><%=dto.getWriter() %></b>
		</td>
	</tr>
	<tr>
		<td>
		<span style="color:gray; float: right;">
			<%=dto.getWriteday()%>
		</span>
		</td>
	</tr>
		<tr>
		<td>
			<b style="font-size: 23pt;"><%=dto.getSubject()%></b>
			<span style="color:gray; float: right;">
				조회<%=dto.getReadcount()%>
			</span>
		</td>
	</tr>
	<tr>
		<td>
			<%=dto.getContent()%>
		</td>
	</tr>
		<tr>
		<td align="right">
			<button type="button" class="btn btn btn-primary btn-xs"
				style="width: 80px;"
				onclick="location.href='/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum=<%=pageNum%>'">목록</button>
				
			<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 800px;"
					onclick="location.href='main.jsp?go=board/info/updateform.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>

			<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 800px;"
					onclick="location.href='board/info/delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>

		</td>
	</tr>
</table>
</html>