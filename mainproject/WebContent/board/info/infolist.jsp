<%@page import="data.dao.InfoAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
h3 {
  display: block;
  font-size: 2em;
  margin-top: 5em;
  margin-bottom: 1em;
  margin-left: 60px;
  margin-right: 0;
  font-weight: bold;
  color: #333333;
}

.table {
 margin-left: auto;
 margin-right: auto;
}

span.glyphicon-chevron-left{
  margin-top: 0em;
  margin-bottom: 1em;
  margin-left: 600px;
  margin-right: 0;
}

.pagenation {
    max-width: 660px;  /* 넓이값은 자식요소들의 넓이합과 같아야지 정 가운데로 맞출 수 있습니다.*/
    margin:0 auto;  /* div 하나일때 가운데 정렬*/
}
</style>
</head>

<%
	InfoBoardDao dao=new InfoBoardDao();
	int totalCount=dao.getTotalCount();
	int totalPage; //총 페이지수
	int startPage; //각 블럭의 시작페이지
	int endPage; //각블럭의 끝페이지
	int start; //각 페이지의 시작번호
	int end; //각 페이지의 끝번호
	int no; //각 페이지에서 출력을 시작할 번호
	int perPage=10; //한페이지에서 보여질 글의 갯수
	int perBlock=5; //한블럭에 보여질 페이지의 갯수
	int currentPage;//현재페이지
	
	//총 페이지수 구하기
	//예:perPage가 5인경우 총 글갯수가 13개라면 총 몇페이지라야할까?
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	//---%: 왼쪽의 피연산자를 오른쪽의 피연산자로 나눈 후, 그 나머지를 반환함.
	
	//현재 페이지(pageNum 이 널일땐 무조건 1페이지로 이동)
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null || pageNum.equals("null"))
		currentPage=1;
	else
		currentPage=Integer.parseInt(pageNum);
	
	//예) 현재페이지가 3인경우 startpage는 1 endpage는 5
	// 현재페이지가 6인경우 startpage는 6 endpage는 10
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//만약 총 페이지수가 8일 경우
	//2번째 블럭은 startpage가 6 endpage가 10 이 되는데
	//이때 endpage는 8로 수정해주어야한다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각 페이지의 시작번호와 끝번호를 구한다
	//현재페이지가 1일 경우 start는 1, 2일경우 6
	start=(currentPage-1)*perPage+1;
	end=start+perPage-1;
	
	//총 글수가 12인 경우 마지막 페이지의 end는 12가 되어야한다
	if(end>totalCount)
		end=totalCount;
	
	//각 글앞에 붙일 시작번호구하기
	//예: 총글이 20개일경우 1페이지는 20부터, 2페이지는 15부터
	//출력해서 1씩 감소해가며 출력할것
	no=totalCount-(currentPage-1)*perPage;
	
	//start부터 end까지 게시글 가져오기
	List<InfoBoardDto> list=dao.getList(start, end);
%>
<body>

<h3>정보공유게시판</h3>
<br>

<!-- 게시판 메인 페이지 영역 시작 -->
<div class="boardlist">
	<div class="row">
		<table class="table table-striped" style=" width:1200px; text-align: center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color: #eeeeee; text-align: center;" width="60">번호</th>
					<th style="background-color: #eeeeee; text-align: center;" width="320">제목</th>
					<th style="background-color: #eeeeee; text-align: center;" width="70">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;" width="100">작성일</th>
					<th style="background-color: #eeeeee; text-align: center;" width="60">추천</th>
					<th style="background-color: #eeeeee; text-align: center;" width="60">조회</th>
				</tr>
				<%
				if(totalCount==0){%>
				<tr>
					<td colspan="6" align="center">
						<b>저장된 게시글이 없습니다</b>
					</td>
				</tr>
				<%}else{
					//게시판 테이블 출력
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					//댓글 dao
					InfoAnswerDao adao=new InfoAnswerDao();
					for(InfoBoardDto dto:list)
					{
						//각 글의 댓글 갯수를 acount에 넣어둔다
						int acount=adao.getboardanswerList(String.valueOf(dto.getNum())).size();
						//String.valueOf() = 괄호안에 있는 모든 타입을 스트링으로 바꿔준다.
						
					%>
						<tr align="center"></tr>
							<td><%=no--%></td>
							<td align="left">
								<%
									//key 는 조회수 증가를 목록에서 클릭한 경우에만 증가하기 위한 값
									String path="/mainproject/main.jsp?go=board/info/infocontent.jsp?num="
									+dto.getNum()+"&pageNum="+currentPage+"&key=list";
								%>
								<a href="<%=path%>" style="color:black;">
								<!-- relevel에 따라서 제목앞에 공백넣기 -->
								<%
								for(int i=1;i<=dto.getRelevel();i++)
								{%>
								&nbsp;&nbsp;&nbsp;<!-- 레벨 1당 공백3칸 -->
								<%}
					
								//답글일 경우는 앞에 이미지 넣기
								if(dto.getRelevel()>0) //Relevel이 0보다 클때 이미지 넣어줌(0은 원글)
								{%>
								<img alt="" src="image/re.png">
								<%}
								%>
								<%=dto.getSubject()==null?"제목없음":dto.getSubject()%>
								<!-- 댓글 갯수 출력 : 있을 경우에만 출력 -->
								<%
								if(acount>0){
									%>
									<span style="margin-left: 5px; color: gray;">
									(<%=acount%>)</span>
									<%} %>
									</a>
							</td>
							<td>
								<%=dto.getMyid()%>
							</td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td><%=dto.getLikes()%></td>
							<td>
							 <!--조회수 글리프아이콘  -->
							<span class="glyphicon glyphicon-eye-open">
							<%=dto.getReadcount()%></span>
							</td>
						</tr>
					<%}
					}
				%>
			</table>


<!-- 페이징처리 -->	
<%
if(totalCount>0){
%>
<div class="pagenation" style="width: 800px; text-align: center;">
	<ul class="pagination">
	<%
		if(startPage>1){
			String pre="/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum"+(startPage-1);	
			%>
			<li><a href="<%=pre%>">이전</a></li>
	<%} 
	//페이지 번호
	for(int i=startPage;i<=endPage;i++)
	{
		String path="/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum="+i;
		if(i==currentPage){%>
		 <li class=active"><a href="<%=path%>"><%=i%></a><li>
		<%}else{ %>
				<li><a href="<%=path%>"><%=i%></a></li>
			<%}
	}
	
		if(endPage<totalPage){ //다음 : 다음블럭의 첫페이지가 active. 
			String next="/mainproject/main.jsp?go=board/info/infolist.jsp?="+(endPage+1);
			%>
			<li><a href="<%=next%>">다음</a></li>
		<%}
	%>
	</ul>
</div>
<%}
%>
		<div class="container">
		<!-- <span class="glyphicon glyphicon-chevron-left" id="pre"></span>
		<span class="glyphicon glyphicon-chevron-right" id="next"></span> -->
		<button type="button" class="btn btn btn-primary btn-xs" 
			style="float: right;  margin-bottom: 50px;"
			onclick="location.href='main.jsp?go=board/info/infoform.jsp'">
			<span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
		
		</div>
	</div>
</div>
</body>
</html>