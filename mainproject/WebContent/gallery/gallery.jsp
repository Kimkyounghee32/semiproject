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
<!-- <link rel="stylesheetz" type="text/css" href="main.css" /> -->
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
int perPage = 4;//한페이지에 보여질 글의 갯수
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
	var page;
	var start = <%=start%>;
	var end = <%=end%>;
	var perPage = 4;
	var totalCount = <%=dao.getTotalCount()%>;
	var totalPage = <%=totalPage%>;
	var page;
	var endPage;
	console.log("totalPage:"+totalPage);
	console.log("total count:"+totalCount);
	if(page == null)
		page = 1;
	else
		page = parseInt(<%=request.getParameter("pageNum")%>);
	console.log("onload page: "+page);
	next_load();
	page++;
	start += perPage;
	end += perPage;
	console.log("page: " + page)
	console.log("start:" + start);
	console.log("end:" + end);
	
	/*
	start = (page - 1) * perPage + 1
	end = start + perPage - 1;
	if(endPage > totalPage)
		endPage = totalPage;
	if(end > totalCount)
		end = totalCount;
	*/
	var uploadpath="main.jsp?go=gallery/galleryupload.jsp";

			
	function next_load(){
		console.log('scrolling..');
		//console.log(page);
		//console.log(perPage);
		
		$.ajax({
			type: "get", 
			dataType:"xml", 
			url:"gallery/gallerydata.jsp",
			data:{
				"start":start,
				"end":end
			},
			success:function(data){
				var s = "";
				//alert($(data).find("photo"));
				$(data).find("photolist").each(function (i, element){
					var photo = $(this).find("photo").text();
					console.log($(this).find("photo").text());
					var path = "main.jsp?go=gallery/view.jsp?num=" 
					+ $(this).find("num").text() + "&pageNum=" + page + "&key=list";
					
					s += "<a class='img-link' href='"+path+"'>";
					s += "<div class='img-list'>";
					s += "<img " + "src='" + photo + "' class='gallery-img'>";
					s += "</div>";				
					s += "</a>";
				});
				$('#photolist').append(s);
				/*
				page++;
				start += perPage;
				end += perPage;
				console.log("page: " + page)
				console.log("start:" + start);
				console.log("end:" + end);
				*/
			}
			/*,error: function(xhr, status, error) {
				console.log("수신실패");
				
			}*/
		});	
	}
	$(window).scroll(function(){
		//console.log($(document).height());
		//console.log($(window).height());
	  	if($(window).scrollTop()+100>=$(document).height() - $(window).height()){
			if(page > totalPage){
				console.log("if page:"+ page);
				console.log("if totalPage:"+ totalPage);
				console.log("스크롤 끝");
				return;
			}
			next_load();
			page++;
				start += perPage;
				end += perPage;
				console.log("page: " + page)
				console.log("start:" + start);
				console.log("end:" + end);
			
		}
	});
	//$("#uploadbtn");
});


</script>

</head>

<body>
	<div class="container theme">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp?go=gallery/gallery.jsp">풍경</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<button id="uploadbtn" type="button"
			class="btn btn btn-primary btn-xs" onclick="location.href='main.jsp?go=gallery/galleryupload.jsp'">Upload Photo</button>



	</div>
	<div id="photolist" class="gallery-grid grid grid-gap-s"></div>


</body>
</html>