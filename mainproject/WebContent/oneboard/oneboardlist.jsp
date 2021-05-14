<%@page import="data.dao.logindao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.OneBoardDao"%>
<%@page import="data.dto.OneBoardDto"%>
<%@page import="java.util.List"%>
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
<%
	//전체 갯수
	OneBoardDao dao =new OneBoardDao();
	int totalCount=dao.getTotalCount();
	
	//start부터 end까지 게시글 가져오기
	String myid=(String)session.getAttribute("id");
	if(myid==null)myid="null";
	List<OneBoardDto> list=dao.getList(myid);
%>
<body>
<div class="listform">
<div class="list">
<img src="image/one.png" id="oneimg">
<table class="table table-bordered" style="width: 900px;">
	<tr bgcolor="#ccc">
		<th width="320">제목</th>
		<th width="70">작성자</th>
		<th width="100">작성일</th>
	</tr>
	<% if(totalCount==0)
	{%>
		<tr>
			<td colspan="4" align="center">
			 	<b>남긴 문의가 없습니다</b>
			 </td>
		</tr>
	<%}else{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(OneBoardDto dto:list)
		{%>
		<tr align="center">
			
		<td align="left">
		
				<%
					//key는 조회수 증가를 목록에서 클릭한 경우에만 증가시키기 위한 값
					String path="/mainproject/main.jsp?go=oneboard/content.jsp?num="
						+dto.getNum()+"&pageNum=";
				%>
					<a href="<%=path%>" style="color:black;">
					<!-- relevel에 따라서 제목 앞에 공백 넣기 -->
						<%
						//0은 원글이므로 int i=1
						 for(int i=1; i<dto.getRelevel(); i++)
						 {%>
							 &nbsp;&nbsp;&nbsp;<!--  레벨 1당 공백 3칸 -->
						 <%}
						
						//답글인경우는 앞에 이미지 넣기
						if(dto.getRelevel()>0) //0은 원글, 답글일때만 이미지 
						{%>
							<img src="image/re.png">
						<%}
						%>
						<%=dto.getSubject()==null?"제목없음":dto.getSubject()%>
					</a>
				</td>
				<td>
				<%
					//id 세션값얻기
					String loginok=(String)session.getAttribute("loginok");
					String id=(String)session.getAttribute("id");
				%>
				<%=dto.getMyid()%>
				</td>
				<td style="width:100px;"><%=sdf.format(dto.getWriteday()) %></td>
			</tr>	
	  <%}
	}
	%>
</table>
<button class="btn btn-info" id="writebtn"
onclick="location.href='/mainproject/main.jsp?go=oneboard/insertform.jsp'">문의작성</button>
</div>
	<!-- 페이징 처리 -->
</div>
</body>
</html>