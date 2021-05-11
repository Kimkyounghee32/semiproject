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

table{
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

</style>
<body>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();
%>

<%
	//로그아웃시에도 아이디가 세션에 있기 때문에 게시글에서 수정삭제가 보인다.
	//로그인한 상태인지 확인
	String loginok=(String)session.getAttribute("loginok");

%>
</body>
<script type="text/javascript">

	//댓글 출력하는 함수
	function list()
	{
		//댓글 출력하는 함수
		function list()
		{
			
			$("#add").show();
			$("#up").hide();
			var num=$("#num").val();
			$.ajax({
				type:"get", //post : 웹브라우저에서 웹서버에 데이타를 전달(전달되는 데이터가 보이지 않는다)
				dataType:"xml", //dataType : 서버가 리턴하는 데이터 타입 (xml, json, script, html)
				url:"mainproject/board/info/answerlist.jsp", //url : 데이터를 전송할 URL
				data:{"num":num}, //data : 서버에 전송할 데이터, key/value 형식의 객체
				success:function(data){ //success : ajax통신에 성공했을 때 호출될 이벤트 핸들러
					var su=$(data).find("answer").length;
					$("span.su").text(su);
					
					var s="";
					$(data).find("answer").each(function (i,element) {
						var n=$(this);
						var idx=n.attr("idx");
						var myid=n.find("myid").text();
						var content=n.find("content").text();
						var name=n.find("name").text();
						var writeday=n.find("writeday").text();
						
						s+=name+"("+myid+"):"+content+"<span class='aday'>";
						s+=writeday;
						var login="<%=loginok%>";
						console.log(login);
						//댓글도 로그인 상태에만 본인이 쓴 댓글에 한해서
						//수정 삭제 아이콘이 보이도록 한다 --%>
						
						//로그인한 아이디 얻기
						var logid=$("#myid").val();//로그아이디는 인풋타입이니까 val()추가
						console.log(logid);
						
						if(login=='yes'&& logid==myid){ //로그인한아이디가 글쓴사람아이디와 같으면
							s+="<span class='amod glyphicon glyphicon-pencil' idx="+idx+"></span>";
							s+="<span class='adel glyphicon glyphicon-remove' idx="+idx+"></span>";
						}
						s+="</span><br>"
							$("div.alist").html(s);
						//}
					})
				}
			})
		}
	
	
	$(function(){
		list(); //처음 시작시 댓글 일단 출력
		
		var a;
		
		//댓글 추가 이벤트
		$("#btnadd").click(function(){
			var num=$("#num").val();
			var myid=$("#myid").val();
			var acontent=$("#acontent").val();
			if(acontent.length==0){
				alert("댓글 내용을 입력 후 확인을 눌러주세요");
				return;
			}
			
			$.ajax({
				type:"post", //post : 웹브라우저에서 웹서버에 데이타를 전달(전달되는 데이터가 보이지 않는다)
				dataType:"html", //dataType : 서버가 리턴하는 데이터 타입 (xml, json, script, html)
				url:"mainproject/board/info/insertanswer.jsp", //url : 데이터를 전송할 URL
				data:{"num":num,"myid":myid,"content":acontent}, //data : 서버에 전송할 데이터, key/value 형식의 객체
				success:function(d){ //success : ajax통신에 성공했을 때 호출될 이벤트 핸들러
					//목록 다시 출력 
					list();
					//입력값 지우기
					$("#acontent").val("");
				}
				
			})
		})
		
		$(document).on("click","span.adel", function() {
			var idx=$(this).attr("idx");
			//alert(idx);
			 $.ajax({
				type:"get",
				dataType: "html",
				url:"board/info/answerdelete.jsp",
				data:{"idx":idx},
				success:function(d){
					//현재페이지 새로고침
					location.reload();
					
				}
			})
		})
		
		$(document).on("click", "span.amod",function(){
			//수정할 idx의 속성에서 가져오기
			$("#add").hide();
			$("#up").show();
			var idx=$(this).attr("idx");
			a=idx;
			$.ajax({
				type:"get",
				url:"info/board/answergetdata.jsp",
				dataType:"xml",
				data:{"idx":idx},
				success:function(data){
					var content=$(data).find("content").text();
					//수정폼태그안에 넣어준다
					$("#ucontent").val(content);
			}
		}); 
	});
		
		$(document).on("click", "#btnu", function(){
			var data=$("#ucontent").val();
			var idx=a;
			//console.log(data);
			$.ajax({
				type:"post",
				dataType:"html",
				url:"info/board/answerupdateaction.jsp",
				data:{"content":data,"idx":idx},
				success:function(data){
					list();
				}
			});		
		});
	});
	
</script>
</head>
<body>
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
	//System.out.println(sdf);
	
	//작성자 id 얻어오기
	String mid=dto.getMyid();
	
%>
<table class="table table-bordered" style="width: 1000px; border-color: white;">
	<caption><h4>정보게시글 상세</h4></caption>
	<tr>
		<td colspan="4">
			<b style="font-size: 12pt;">제목&nbsp;<%=dto.getSubject()%></b></td>
	</tr>
	<tr>
		<td>작성자&nbsp;<%=dto.getMyid()%></td>
		<td>작성일&nbsp;<%=dto.getWriteday() %></td>
		<td>조회&nbsp;<%=dto.getReadcount() %></td>
		<td>추천&nbsp;<%=dto.getLikes() %></td>
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
		</td>
	</tr>
	</table>
<table>
	<tr>
		<td align="right">
		<button type="button" class="btncontent btn btn-primary btn-xs"
			onclick="location.href='/mainproject/main.jsp?go=board/info/infoform.jsp'">글쓰기</button>
			
		<%
				//널이아니면 읽어들여야하는것들 다 써주자
				String reple="/mainproject/main.jsp?go=board/infoform.jsp?num="
					+dto.getNum()+"&reg="+dto.getReg()+"&restep="+
					dto.getRestep()+"&relevel="+dto.getRelevel()
					+"&pageNum="+pageNum;
			%>
		<button type="button" class="btncontent btn btn-primary btn-xs" style="width: 60px;"
			onclick="location.href='<%=reple%>'">답글쓰기</button>
			
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 60px; margin-left: 2px;"
			onclick="location.href='/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum=<%=pageNum%>'">목록</button>
			
			
		<%
				String mod="mainproject/main.jsp?go=board/info/infoupdateform.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum;
				String del="board/info/infoboarddelete.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum; 
				//delete는 경로에서 메인을 통할 필요가 없음. 보여줄게 없기 때문에->바로 삭제할 예정.
			%>
			
			<%
				//세션에서 로그인한 아이디를 얻는다
				String myid=(String)session.getAttribute("mid");
				
				//로그인한 아이디와 dto의 아이디가 같을 경우 수정, 삭제 버튼이 보이도록한다
				//널이 있을때(로그인안했을때) 이퀄쓰면 nullpointexception 나오므로 조건추가(myid!=null)
				if(myid!=null && loginok!=null && myid.equals(dto.getMyid()))
				{
					
			%>
			
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 60px; margin-left: 2px;"
			onclick="location.href='<%=mod%>'" idx="">수정</button>
			
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 60px; margin-left: 2px;"
			id="boarddel" num="" onclick="location.href='<%=del%>'">삭제</button>	
			
		<%} %>

</table>
	<br>
		
		
<script type="text/javascript">
	//삭제버튼이벤트
	$("#boarddel").click(function () {
		var num=$(this).attr("num");
		alert(num);
		$.ajax({
			type:"get",
			dataType: "html",
			url:"board/info/infoboarddelete.jsp",
			data:{"num":num},
			success:function(d){
				
			}
		})
		
	})
</script>

		<input type="hidden" name="myid" id="myid" value="<%=mid%>">
		<input type="hidden" name="num" id="num" value="<%=num%>">	
		<b style="margin-left: 250px;">총<span class="su">0</span>개의 댓글이 있습니다</b>
		
		
		<div style="width:750px; margin-left: 250px;" class="form-inline" id="add">
			<input type="text" class="form-control" style="width: 700px;"
				id="acontent" placeholder="댓글을 입력해주세요">
			<button type="button" class="btn btn-primary btn-xs" id="btnadd" style="float: right;">확인</button>		
		</div>

<div class="alist"></div>
</body>
</html>