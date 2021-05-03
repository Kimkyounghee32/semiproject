<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/gallery.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp?go=gallery/portrait.jsp">인물</a></li>
				<li><a href="main.jsp?go=gallery/landscape.jsp">풍경</a></li>
				<li><a href="main.jsp?go=gallery/animal.jsp">동물</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<ul>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>
			<li><img class="gallery-img" src="image/test.jpg"></li>

		</ul>
	</div>

	<div>
		<nav class="pagebar" aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>

</body>
</html>