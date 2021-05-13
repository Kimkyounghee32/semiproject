<%@page import="data.dao.GalleryDao"%>
<%@page import="data.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/gallery.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<%
GalleryDao dao = new GalleryDao();
//전체 갯수 구하기
int totalCount = dao.getTotalCount();
int totalPage;//총 페이지수
int startPage;//각 블럭의 시작페이지
int endPage;//각 블럭의 끝페이지
int start;//각 페이지의 시작번호
int end;//각 페이지의 끝번호
int no;//각 페이지에서 출력을 시작할 번호
int perPage = 10;//한페이지에 보여질 글의 갯수
int perBlock = 5;//한블럭에 보여질 페이지의 갯수
int currentPage;//현재 페이지

totalPage = totalCount / perPage + (totalCount % perPage > 0 ? 1 : 0);
String pageNum = request.getParameter("pageNum");
System.out.println("pageNum: " + request.getParameter("pageNum"));
if (pageNum == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(pageNum);

startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

if (endPage > totalPage)
	endPage = totalPage;

start = (currentPage - 1) * perPage + 1;
end = start + perPage - 1;
if (end > totalCount)
	end = totalCount;

no = totalCount - (currentPage - 1) * perPage;
System.out.println("start : " + start);
System.out.println("end : " + end);
List<GalleryDto> list = dao.getList(start, end);
%>
<script type="text/javascript">

$(function(){
	next_load();
	var page=1;
	function next_load(){
		console.log('scrolling..');
		$.ajax({
			type: "get", 
			dataType:"xml", 
			url:"gallery/gallerydata.jsp",
			data:{
				"start":<%=start%>,
				"end":<%=end%>
			},
			success:function(data){
				var s = "";
				//alert($(data).find("photo"));
				$(data).find("photolist").each(function (i, element){
					var photo = $(this).find("photo").text();
					console.log($(this).find("photo").text());
					
					s += "<a class='img-link' href=''>";
					s += "<div class='img-list'>";
					s += "<img " + "src='" + photo + "' class='gallery-img'>";
					s += "<div class='overlay'>"; //$(data).find("writer").text();
					s += "</div>";
					s += "</div>";				
					s += "</a>";
				});
				$('#photolist').append(s);
				page++;
				
			}
			/*,error: function(xhr, status, error) {
				console.log("수신실패");
				
			}*/
		});	
	}
	$(window).scroll(function(){
		console.log($(document).height());
		console.log($(window).height());
	  	if($(window).scrollTop()+100>=$(document).height() - $(window).height()){
			next_load();
		}
	});
});


</script>

</head>

<body>
	<div class="container theme">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp?go=gallery/portrait.jsp">인물</a></li>
				<li class="active"><a href="main.jsp?go=gallery/landscape.jsp">풍경</a></li>
				<li><a href="main.jsp?go=gallery/animal.jsp">동물</a></li>
			</ul>
		</div>
	</div>
	<div id="photolist" class="gallery-grid grid grid-gap-s">
	</div>
	<div class="container">
		<button type="button" class="btn btn btn-primary btn-xs"
			onclick="location.href='main.jsp?go=gallery/galleryupload.jsp'">
			<span class="glyphicon glyphicon-pencil"></span>글쓰기
		</button>

	</div>

</body>
</html>