<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi_infocontent</title>
<link rel="stylesheet" href="/mainproject/css/infoBoard.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<body>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();

	//로그아웃시에도 아이디가 세션에 있기 때문에 게시글에서 수정삭제가 보인다.
	//로그인한 상태인지 확인
	String loginok=(String)session.getAttribute("loginok");
%>
</body>
<script type="text/javascript">

		//댓글 출력하는 함수
		function list()
		{
			
			$("#add").show();
			$("#up").hide();
			var num=$("#num").val();
			$.ajax({
				type:"get", //post : 웹브라우저에서 웹서버에 데이타를 전달(전달되는 데이터가 보이지 않는다)
				dataType:"xml", //dataType : 서버가 리턴하는 데이터 타입 (xml, json, script, html)
				url:"/mainproject/board/info/answerlist.jsp", //url : 데이터를 전송할 URL
				data:{"num":num}, //data : 서버에 전송할 데이터, key/value 형식의 객체
				error : function(e){ 
					alert(e.responseText);
		 		},	
				success:function(data){ //success : ajax통신에 성공했을 때 호출될 이벤트 핸들러
					var su=$(data).find("answer").length;
					$("span.su").text(su);
					
					var s="";
					$(data).find("answer").each(function (i,element) {
						var n=$(this);
						var idx=n.attr("idx");
						var myid=n.find("myid").text();
						var content=n.find("content").text();
						var writeday=n.find("writeday").text();
						
						s+="<div class='reple'>";
						s+=myid+"<span class='repleA'>"+"&nbsp";
						s+=writeday+"<span class='repleB'>"+"&nbsp"+"&nbsp"+"&nbsp"+"<br>";
						s+=content;

						var login="<%=loginok%>";
						console.log(login);
						//댓글도 로그인 상태에만 본인이 쓴 댓글에 한해서
						//수정 삭제 아이콘이 보이도록 한다 --%>
						
						//로그인한 아이디 얻기
						var logid=$("#myid").val();//로그아이디는 인풋타입이니까 val()추가
						console.log(logid);
						
						if(login=='yes'&& logid==myid){ //로그인한아이디가 글쓴사람아이디와 같으면
							s+="<span class='amod glyphicon glyphicon-edit' idx="+idx+"></span>";
							s+="<span class='adel glyphicon glyphicon-trash' idx="+idx+"></span>";
							s+="<hr>";
						}
						s+="</span>";
						s+="</div>";
							$("div.alist").html(s);
					})
				}
			})
		}
	
	
	$(function(){
		list(); //처음 시작시 댓글 일단 출력
		
		var a;
		
		//댓글 추가 이벤트
		$("#btnrepleconfirm").click(function(){
			var num=$("#num").val();
			var myid=$("#myid").val();
			var replewrite=$("#replewrite").val();
			if(replewrite.length==0){
				alert("댓글 내용을 입력 후 확인을 눌러주세요");
				return;
			}
			
			$.ajax({
				type:"post", //post : 웹브라우저에서 웹서버에 데이타를 전달(전달되는 데이터가 보이지 않는다)
				dataType:"html", //dataType : 서버가 리턴하는 데이터 타입 (xml, json, script, html)
				url:"/mainproject/board/info/insertanswer.jsp", //url : 데이터를 전송할 URL
				data:{"num":num,"myid":myid,"content":replewrite}, //data : 서버에 전송할 데이터, key/value 형식의 객체
				error : function(){ 
					alert('통신실패!!');
		 		},	
				success:function(d){ //success : ajax통신에 성공했을 때 호출될 이벤트 핸들러
					//목록 다시 출력 
					list();
					//입력값 지우기
					$("#replewrite").val("");
				}
				
			})
		})
		
		$(document).on("click","span.adel", function() {
			var idx=$(this).attr("idx");
			//alert(idx);
			 $.ajax({
				type:"get",
				dataType: "html",
				url:"/mainproject/board/info/answerdelete.jsp",
				error : function(){ 
					alert('통신실패!!');
		 		},	
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
				url:"/mainproject/board/info/answerupdateaction.jsp",
				dataType:"xml",
				data:{"idx":idx},
				success:function(data){
					var content=$(data).find("content").text();
					//수정폼태그안에 넣어준다
					$("#replemod").val(content);
			}
		}); 
	});
		
		$(document).on("click", "#btnreplemod", function(){
			var data=$("#replemod").val();
			var idx=a;
			console.log(data);
			$.ajax({
				type:"post",
				dataType:"html",
				url:"/mainproject/board/info/answerupdateaction.jsp",
				data:{"content":data,"idx":idx},
				error : function(){ 
					alert('통신실패!!');
		 		},	
				success:function(data){
					list();
				}
			});		
		});
	});
	
</script>	
<script type="text/javascript">

	//게시판 글 삭제버튼 이벤트
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
	
	//좋아요 이벤트
	$(document).on("click", "span.glyphicon-thumbs-up", function(){
		var num=$(this).attr("num");
		console.log(num);
		$.ajax({
			type:"get",
			dataType:"xml",
			url:"/mainproject/board/info/infolikes.jsp",
			data:{"num":num},
			success:function(data){
				console.log("test");
				$("span.likes span.likesu").text($(data).text());
				location.reload();
			}
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
	/* String id=dto.getMyid(); */
	
%>
<table class="table table-bordered" style="width: 1000px; border-color: white;">
	<caption><h4>정보게시글 상세</h4></caption>
	<tr>
		<td colspan="4">
			<b style="font-size: 12pt;">제목&nbsp;<%=dto.getSubject()%></b></td>
	</tr>
	<tr>
		<td><span class="title">작성자</span>&nbsp;<%=dto.getMyid()%></td>
		<td>작성일&nbsp;<%=dto.getWriteday() %></td>
		<td>조회&nbsp;<%=dto.getReadcount() %></td>
		<td><span class="likes">추천</span>
					<span class="glyphicon glyphicon-thumbs-up" num=<%=dto.getNum()%>>&nbsp;</span>&nbsp;<%=dto.getLikes() %>
		
			<span class="likesu"></span>
		</td>
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
			
		<%-- <%
				//널이아니면 읽어들여야하는것들 다 써주자
				String reple="/mainproject/main.jsp?go=board/infoform.jsp?num="
					+dto.getNum()+"&reg="+dto.getReg()+"&restep="+
					dto.getRestep()+"&relevel="+dto.getRelevel()
					+"&pageNum="+pageNum;
			%>
		<button type="button" class="btncontent btn btn-primary btn-xs" style="width: 60px;"
			onclick="location.href='<%=reple%>'">답글쓰기</button> --%>
			
		<button type="button" class="btn btn btn-primary btn-xs"
			style="width: 60px; margin-left: 2px;"
			onclick="location.href='/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum=<%=pageNum%>'">목록</button>
			
			
		<!-- 글목록 수정삭제 부분 -->
		
		<%
				String mod="main.jsp?go=board/info/infoupdateform.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum;
				String del="board/info/infoboarddelete.jsp?num="
					+dto.getNum()+"&pageNum="+pageNum; 
				//delete는 경로에서 메인을 통할 필요가 없음. 보여줄게 없기 때문에->바로 삭제할 예정.
			%>
			
		<%
				//세션에서 로그인한 아이디를 얻는다
				String id=(String)session.getAttribute("id");
				
				//로그인한 아이디와 dto의 아이디가 같을 경우 수정, 삭제 버튼이 보이도록한다
				//널이 있을때(로그인안했을때) 이퀄쓰면 nullpointexception 나오므로 조건추가(myid!=null)
				if(id!=null && loginok!=null)
				{		
			%>
		<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 60px; margin-left: 2px;"
					onclick="location.href='<%=mod%>'" idx="">수정</button>
					
				<button type="button" class="btn btn btn-primary btn-xs"
					style="width: 60px; margin-left: 2px;"
					id="boarddel" num="" onclick="location.href='<%=del%>'">삭제</button>	
		<%} %>
</td>
</table>
	<br>
	
		<input type="hidden" name="myid" id="myid" value="<%=id%>">
		<input type="hidden" name="num" id="num" value="<%=num%>">
		<b style="margin-left: 250px;">총<span class="su">0</span>개의 댓글이 있습니다</b>
		<br>
		
		<%
		//댓글 입력창은 로그인한 상태에서만 보이도록한다(입력창만! 댓글 목록은 로그아웃상태에서도 보임)
		if(loginok!=null) 	
		{%>
			
		<div style="margin-left: 250px;" class="form-inline" id="add">
		
			<input type="text" class="form-control" style="width: 900px;"
				id="replewrite" placeholder="댓글을 입력해주세요">
			<button type="button" class="btn btn-primary btn-xs"
			id="btnrepleconfirm" style="float:500px; height: 30px;">확인</button>
		</div>
			
		<div style="margin-left: 250px;" class="form-inline" id="up">
			<input type="text" class="form-control" style="width: 900px;"
				id="replemod" placeholder="수정할 댓글을 입력해주세요">
			<button type="button" class="btn btn-primary btn-xs"
			id="btnreplemod">수정</button>
			</div>
		<br>
		<%}
		%>
			
<div class="alist"></div>

</body>
</html>