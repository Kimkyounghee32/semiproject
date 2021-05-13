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

</head>

<%
//로그인한 상태인지 확인
String key = request.getParameter("key");
String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");

GalleryDao dao = new GalleryDao();
//String loginok = (String) session.getAttribute("loginok");
GalleryDto dto = dao.getData(num);
%>
<body>
	<div class="container PhotoNavWrap">
		<img src="<%="upload/" + dto.getImgRealName()%>" class="imgview" display="none">
	</div>
	
	<div class="container info-wrap">
		<!-- Go to www.addthis.com/dashboard to customize your tools -->
		<script type="text/javascript"
			src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-609b2bdb3ea2638e"></script>
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
</body>
</html>