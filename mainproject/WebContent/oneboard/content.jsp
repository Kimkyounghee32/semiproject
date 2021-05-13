<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.OneBoardDao"%>
<%@page import="data.dto.OneBoardDto"%>
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
<%
	String loginok=(String)session.getAttribute("loginok");

	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");

	OneBoardDao dao=new OneBoardDao();
	OneBoardDto dto = dao.getData(num);

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

	//세션에서 로그인한 아이디를 얻는다
	String id=(String)session.getAttribute("id");
			
	//로그인한 아이디와 dto의 아이디가 같을 경우 수정, 삭제 버튼이 보이도록한다
	//널이 있을때(로그인안했을때) 이퀄쓰면 nullpointexception 나오므로 조건추가(myid!=null)
	if(loginok!=null && dto.getMyid().equals(id))
	{	
%>
<div class="container">
<img src="image/one.png" id="conimg">
	<div class="row">
		<table class="table">
			<tr class="table-active">
				<td colspan="4">
					<b style="font-size: 12pt;">제목&nbsp;&nbsp;<%=dto.getSubject()%></b></td>
			</tr>
			<tr>
				<td><span class="title">작성자</span>&nbsp;<%=dto.getMyid()%></td>
				<td>작성일&nbsp;<%=dto.getWriteday() %></td>
			</tr>
			<tr>
					<td colspan="4">
					<%
					if(dto.getContent()==null){%>
					<h3>내용없음</h3>
					<%}else{%>
						<%=dto.getContent().replace("\n","<br>")%>
					<%}
					%>
				<br><br>
				</tr>
				<tr>
				</tr>
		</table>
		
	</div>
	<table>
	<tr>
		<td align="right">
		<button type="button" class="btncon btn btn-primary btn-xs"
			onclick="location.href='/mainproject/main.jsp?go=oneboard/insertform.jsp'">글쓰기</button>
			<% 
				String reple="/mainproject/main.jsp?go=oneboard/insertform.jsp?num="
					+dto.getNum()+"&reg="+dto.getReg()+"&restep="+
					dto.getRestep()+"&relevel="+dto.getRelevel()
					+"&pageNum="+pageNum;
			%>
		<button type="button" class="btncontent btn btn-primary btn-xs" style="width: 60px;"
			onclick="location.href='<%=reple%>'">답글쓰기</button>
			
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 60px; margin-left: 2px;"
			onclick="location.href='/mainproject/main.jsp?go=oneboard/oneboardlist.jsp?pageNum=<%=pageNum%>'">목록</button>

		<!-- 글목록 수정삭제 부분 -->
		
		<%
				String mod="main.jsp?go=oneboard/updateform.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum;
				String del="oneboard/delete.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum; 
				//delete는 경로에서 메인을 통할 필요가 없음. 보여줄게 없기 때문에->바로 삭제할 예정.
			%>
		<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 60px; margin-left: 2px;"
					onclick="location.href='<%=mod%>'" idx="">수정</button>
					
				<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 60px; margin-left: 2px;"
					id="boarddel" num="" onclick="location.href='<%=del%>'">삭제</button>	
		<% %>
</td>
</table>
</div>
<%
}else{
	%>
	<script type="text/javascript">
	alert("본인이 작성한 문의만 볼 수 있습니다.");
	history.back();
	</script>	
<%}
	
%>
<input type="hidden" name="id" id="id" value="<%=id%>">
<input type="hidden" name="num" id="num" value="<%=num%>">
</body>
</html>