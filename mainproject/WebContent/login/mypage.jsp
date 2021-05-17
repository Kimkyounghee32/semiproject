<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/loginform.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/mypage.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/css/logincss/mygallery.css" />
<link rel="stylesheet" type="text/css" href="/mainproject/main.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<%
String id=(String)session.getAttribute("id");

JSONObject ob = new JSONObject();
JSONArray arry = new JSONArray();
%>
<body>
	<div class="page">
		<div class="logodiv">
			<jsp:include page="../layout/logo.jsp"/>
		</div>
	<div class="mypage">
		<div class="category">
			<div>
			<b>카테고리</b>
			</div>
			<div id="myinfo">
				<a>내 정보</a> 
			</div>
			<div id="infobrd">
				<a>정보게시판</a>
			</div>
			<div id="jayufobrd">
				<a>자유게시판</a>
			</div>
			<div id="gll">
				<a>갤러리</a>
			</div>
		</div>
		<div class="boardtable">
			<div id="bte">
				
			
			</div>			
			
		</div>	
	</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var id="";
		$("#myinfo>a").trigger("click");
	});

	$("div.category a").click(function(){
		var atag=$(this).text();
			$.ajax({
				type:"post",
				url:"mypageboard.jsp",
				data:{"atag":atag},
				dataType:"json",
				success:function(data){
					if(atag=="정보게시판" || atag=="자유게시판"){
						var s="<table class='table'>";
						s+="<caption><b class='bta'>"+atag+"</b></caption>"
						s+="<tr>";
						s+="<td>번호</td>";
						s+="<td>제목</td>";
						s+="<td>생성날짜</td>";
						s+="</tr>";
						$.each(data, function(i, elt) {
							//console.log(data[i].num);
							s+="<tr>";
							s+="<td>"+data[i].num+"</td>";
							s+="<td class='subject'>"+data[i].subject+"</td>";
							s+="<td>"+data[i].writeday+"</td>";
							s+="</tr>";
							
						});
						s+="</table>";
						$("#bte").html(s);
					}
					
					else if(atag=="내 정보"){
						id=data[0].id;
						var s="<div class='mmg'><b>아이디 :"+data[0].id+"</b></div>";
						s+="<div class='mmg'><b>이메일 :"+data[0].email+"</b></div>";
						s+="<div class='mmg'><input class='pass' type='password'>";
						s+="<button class='pabt' type='button'>패스워드 변경</button></div>";
					
						
						$("#bte").html(s);
					} else if(atag=="갤러리") {
						var s="<div class='list-wrap'>";
						
						$.each(data, function(i,elt){
							console.log(data[i].num);
							/*s+="<div class='img-wrap'>";
							s+="<img src='"+data[i].imgrealpath+"'>";
							s+="</div>";*/
							
							s += "<a class='img-link' href='#'>";
							s += "<div class='img-list'>";
							s += "<img value='"+data[i].num+"'src='" + data[i].imgrealpath + "' class='gallery-img'>";
							s += "</div>";				
							s += "</a>";
						});
						
						s+="</div>";
						$("#bte").html(s);
					}
				},error:function(request,error){
					console.log("code:"+request.status+"\n"+request.responseText+"\n"+"error:"+error);
				}
			});
		
	});
	
	$(document).on("click","button.pabt",function(){
		console.log(id);
		 $.ajax({
			//패스워드변경
			type:"post",
			url:"mypw.jsp",
			data:{"pwd":$("input.pass").val(),
					"id":id},
			dataType:"html",
			success:function(data){
				alert("패스워드가 변경되었습니다 다시 로그인해주세요");
				location.href="/mainproject/login/loginform.jsp"
			}
		});
	});
	
	$(document).on("click","img.gallery-img", function(){
		var test = $(this).attr('value');
		//console.log(test);
		//console.log("id:" + $(this).attr('id'));
		if(confirm('삭제하시겠습니까?')) {
			console.log('삭제');
			$.ajax({
				type:"post",
				dataType:"html",
				url:"../gallery/deletegalleryaction.jsp",
				data:{
					"num":$(this).attr('value'),
					"id": "<%=id%>"
				},
				success:function(data){
					console.log("삭제이벤트 success");
					load_gallery();
				}
			});
		}
	});
	function load_gallery(){
		var s="<div class='list-wrap'>";
			$.ajax({
				type:"post",
				url:"mypageboard.jsp",
				data:{"atag":"갤러리"},
				dataType:"json",
				success:function(data){
							
					$.each(data, function(i,elt){
						console.log(data[i].num);
						/*s+="<div class='img-wrap'>";
						s+="<img src='"+data[i].imgrealpath+"'>";
						s+="</div>";*/
						
						s += "<a class='img-link' href='#'>";
						s += "<div class='img-list'>";
						s += "<img value='"+data[i].num+"'src='" + data[i].imgrealpath + "' class='gallery-img'>";
						s += "</div>";				
						s += "</a>";
					});
					s+="</div>";
					$("#bte").html(s);
				}
					
			});
	}	
	$(document).on("click","td.subject",function(){
		console.log($(this).parent().children('td:eq(0)').text());
		if($("b.bta").text()=="정보게시판")
	 		location.href="/mainproject/main.jsp?go=board/info/content.jsp?num="+$(this).parent().children('td:eq(0)').text();
		else{
	 		location.href="/mainproject/main.jsp?go=board/jayu/content.jsp?num="+$(this).parent().children('td:eq(0)').text();
		}
	});


</script>
</html>