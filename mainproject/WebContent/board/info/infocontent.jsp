<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>


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
%>

</body>
<table class="table table-bordered" style="width: 600px; margin-left: 100px;">
	<caption>정보게시글상세</caption>
	<hr style="border: 1px solid black;">
	<tr>
		<td>
			<b><%=dto.getWriter() %></b>
			<span style="color:gray; float: right;">
				<%=sdf.format(dto.getWriteday())%>
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
			<%=dto.getContent().replace("\n", "<br>") %>
		</td>
	</tr>
		<tr>
		<td align="right">
			<button type="button" class="btn btn-info btn-xm"
				style="width: 100px;"
				onclick="location.href='main.jsp?go=board/info/infolist.jsp?pageNum=<%=pageNum%>'">목록</button>
				
			<button type="button" class="btn btn-info btn-xm"
					style="width: 100px;"
					onclick="location.href='main.jsp?go=board/info/updateform.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>

			<button type="button" class="btn btn-info btn-xm"
					style="width: 100px;"
					onclick="location.href='board/info/delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>

		</td>
	</tr>
</table>
</html>