<%@page import="data.dto.GalleryDto"%>
<%@page import="data.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.0.js"></script> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<%
//로그인한 상태인지 확인
// String key = request.getParameter("key");
String loginok=(String)session.getAttribute("loginok");
String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");

GalleryDao dao = new GalleryDao();
//String loginok = (String) session.getAttribute("loginok");
GalleryDto dto = dao.getData(num);
%>
<body>
	<div>
		<div class="container PhotoNavWrap">
			<img src="<%="upload/" + dto.getImgRealName()%>" class="imgview" display="none">
		</div>
		
		
		<div class="container info-wrap">
			<div class="writerinfo">
				<!-- button area -->
				<div class="basebtn-layout">
					<div class="icon-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-heart basebtn" viewBox="0 0 16 16">
							<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
						</svg>
					</div>
					<div class="icon-wrap">
						<svg data-toggle="" data-target="#myModal" xmlns="http://www.w3.org/2000/svg"  fill="currentColor" class="bi bi-share basebtn" viewBox="0 0 16 16">
							<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
						</svg>
					</div>
					<div class="icon-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
						</svg>	
					</div>			
				</div>
				<!-- user info -->
				<div class="userinfo-wrap">
					<div class="userInfo">
						
							<a class ="userId" href="#"><%=dto.getWriter() %></a>
							<a class ="" href="#"></a>
						</div>
					</div>
					
				</div>
				<!--  -->
				<!--  -->
			</div>
		
	
<!-- 		<div class="addthis_inline_share_toolbox"> -->
<!-- 			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-609b2bdb3ea2638e"></script> -->
<!-- 		</div> -->
		<!-- Go to www.addthis.com/dashboard to customize your tools -->	

		</div>
		<script type="text/javascript">
			if(parseInt($("img.imgview").css("width")) > parseInt($("img.imgview").css("height"))){
				$("img.imgview").css("width", "inherit");
				$("img.imgview").css("height", "auto");
				$("img.imgview").css("dsplay", "block");
				
			} else {
				$("img.imgview").css("width", "auto");
				$("img.imgview").css("height", "1100px");
				$("img.imgview").css("dsplay", "block");
			}
		
		</script>

		<!-- Go to www.addthis.com/dashboard to customize your tools -->
	
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						<p>This is a small modal.</p>
						<div class="addthis_inline_share_toolbox">
							<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-609b2bdb3ea2638e"></script>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	

</body>
</html>