<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div id="nav" class="container-fluid">
<nav class="navbar navbar-default">
				<ul class="navcategory">
					<li id="gg"><a href="main.jsp?go=gallery/gallery.jsp">Gallery</a>
					<li id="gc"><a>Community</a>
						<div>
							<ul class="Community">
								<li><a href="main.jsp?go=board/info/infolist.jsp">정보공유</a></li>
								<li><a href="main.jsp?go=board/jayu/jayulist.jsp">자유게시판</a></li>
							</ul>
						</div></li>
					<li id="gs"><a>Support</a>
						<div>
							<ul class="Support">
								<li><a href="main.jsp?go=faq/faq.jsp">자주하는 질문</a></li>
								<li><a href="main.jsp?go=oneboard/oneboardlist.jsp">1:1문의</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
				</div>
</body>
</html>