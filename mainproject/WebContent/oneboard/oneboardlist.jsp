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
	int totalPage;//총 페이지수
	int startPage;//각 블럭의 시작페이지
	int endPage;//각 블럭의 끝페이지
	int start;//각 페이지의 시작번호
	int end;//각 페이지의 끝번호
	int no;//각 페이지에서 출력을 시작할 번호
	int perPage=5;//한페이지에 보여질 글의 갯수
	int perBlock=5;//한블럭에 보여질 페이지의 갯수
	int currentPage;//현재 페이지

	
	//총 페이지 수 구하기
	//ex) perPage가 5인 경우 총 글 갯수가 13개라면 총 몇 페이지여야할까?
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	//현재페이지(pageNum==null 무조건 1페이지로 이동)
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)//page는 내부 객체라서 변수 선언x
		currentPage=1;
	else
		currentPage=Integer.parseInt(pageNum);
	//예) 현재 페이지가 3인 경우 startPage=1,endPage=5
	//	  현재 페이지가 6인 경우 startPage=6,endPage=10
	startPage=(currentPage-1)/perBlock*perBlock+1; 
	endPage=startPage+perBlock-1;
	
	//만약 총 페이지 수가 8일 경우 두번째 블럭은 startPage=6 endPage=10
	//이때 endPage는 8로 수정해주어야 한다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각 페이지의 시작번호, 끝번호 구하기
	//현재 페이지가 1일 경우, start는 1
	// 				2일 경우, start는 6
	start=(currentPage-1)*perPage+1;
	end=start+perPage-1;
	//총 글수가 12인 경우 마지막 페이지의 end는 12가 되어야 한다
	if(end>totalCount)
		end=totalCount;
	//각 글 앞에 붙일 시작번호 구하기
	//ex)총 글이 20개일 경우 1페이지는 20~, 2페이지는 15~, 출력해서 1씩 감소해가며 출력
	no=totalCount-(currentPage-1)*perPage;
	
	//start부터 end까지 게시글 가져오기
	String myid=(String)session.getAttribute("id");
	if(myid==null)myid="null";
	List<OneBoardDto> list=dao.getList(start, end,myid);
%>
<body>
<div class="listform">
<div class="list">
<img src="image/one.png" id="oneimg">
<table class="table table-bordered" style="width: 900px;">
	<tr bgcolor="#ccc">
		<th width="60">번호</th>
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
			<td><%=no--%></td>
		<td align="left">
		
				<%
					//key는 조회수 증가를 목록에서 클릭한 경우에만 증가시키기 위한 값
					String path="/mainproject/main.jsp?go=oneboard/content.jsp?num="
						+dto.getNum()+"&pageNum="+currentPage+"&key=list";
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
<%
	if(totalCount>0)
	{%>
	<div style="width: 900px; text-align: center;" class="paging">
		<ul class="pagination">
		<%
		if(startPage>1){ //startPage가 1일땐 나타낼 필요 x , (startPage-1) : startPage의 전 블럭
			String pre="main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+(startPage-1);
		%>
			<li><a href="<%=pre%>"><%="이전"%></a></li>
		<%}
		
			for(int i=startPage; i<=endPage; i++)
			{
				String path="main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+i;
				//현재 페이지인 경우 클래스 active 추가
				if(i==currentPage){%>
					<li class="active"><a href="<%=path%>"><%=i%></a></li>
				<%}else{%>
					<li><a href="<%=path%>"><%=i%></a></li>
				<%}
			}
		if(endPage<totalPage){  //endPage는 totalPage보다 클 수 없고 같을땐 나타낼 필요x
								//(endPage+1) : endPage의 다음 블럭
			String pre="main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+(endPage+1);
			%> <li><a href="<%=pre%>"><%="다음"%></a></li>
		<%}
		%>
		
		</ul>
	</div>
	<%}

%>
</div>
</body>
</html>