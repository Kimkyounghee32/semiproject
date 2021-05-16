<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/carousel.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="main.css" />

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap');
div.maininfo{
	font-size: 15pt;
	font-family : Noto Sans KR;
	color: #5D5D5D;
}

div.mainjayu{
	font-size: 15pt;
	font-family : Noto Sans KR;
	color: #5D5D5D;
	
}
.link-wrap{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;

}
.jayu-wrap{

}
</style>

</head>
<body>
<div id="today-photo">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="image/image1.jpg" alt="">
			</div>

			<div class="item">
				<img src="image/image2.jpg" alt="">
			</div>

			<div class="item">
				<img src="image/tenor.gif" alt="">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	<div class="mainglmbti">
	<div class="maingl">
		<div class="test0">
			<img src="image/test2.jpg">
		</div>
		
		<div class="test1">
			<img src="image/test4.jpg">
		</div>
		<div class="test1">
			<img src="image/test5.jpg">
		</div>
	</div>
	<div class="mainmbti">
		<a onclick="location.href='/mainproject/mbti/mbtimain.jsp'"><img alt="경로잘못됨" src="mainmbti.png"></a>
	</div>
	</div>
	
	<div class="mainboard">
	
	<div class="maininfo">
	<script type="text/javascript">
		$(function(){
			
			$.ajax({
				type:"get",
				url:"/mainproject/board/info/getbestread.jsp",
				dataType:"json",
				success:function(data){
					console.log(data);
				var s="";
				s+="<b>정보공유게시판 인기글</b>";
				s+="<hr>";
				s+="<div>";
				$.each(data,function(elt){ //json는 배열 데이터 읽듯이 읽는다
						console.log(data.elt);
				/* s+="<td>"+data[elt].num+"</td>"; */
				s+="<div><a href='/mainproject/main.jsp?go=board/jayu/content.jsp?num="+data[elt].num+"'>"+data[elt].subject+"</a></div>";
				
				});
				s+="</div>";
				
				$("div.maininfo").html(s);
				}
			});
		});
	</script>
	</div>
	
	<div class="mainjayu">
		<script type="text/javascript">
		$(function(){
			
			$.ajax({
				type:"get",
				url:"/mainproject/board/jayu/getbestread.jsp",
				dataType:"json",
				success:function(data){
					console.log(data);
				var s="";
				s+="<b>자유게시판 인기글</b>";
				s+="<hr>";
				s+="<div class='list-wrap'>";
				$.each(data,function(elt){ //json는 배열 데이터 읽듯이 읽는다
						console.log(data.elt);
				/* s+="<td>"+data[elt].num+"</td>"; */
				s+="<div class='link-wrap'><a class='jayulink' href='/mainproject/main.jsp?go=board/jayu/content.jsp?num="+data[elt].num+"'>"+data[elt].subject+"</a></div>";
				});
				s+="</div>";
				
				$("div.mainjayu").html(s);
				}
			});
		});
	</script>
	</div>
	
	
</div>
	
</div>
</body>
</html>