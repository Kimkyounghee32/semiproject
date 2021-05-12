<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jayuform</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

body {
  padding-top: 70px;
  margin-left : 20%;
  margin-right : 20%;
  padding-bottom: 30px;
}

h3{
	font-family: Noto Sans KR;
	font-size : 23pt;
	font-weight: bold;
}
</style>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();

	//답글일 경우 num읽기
	String num=request.getParameter("num");
	String reg=request.getParameter("reg");
	String restep=request.getParameter("restep");
	String relevel=request.getParameter("relevel");
	String pageNum=request.getParameter("pageNum");
	
	if(num==null){//integer로 바꿀때 널포인트익셉션이나 넘버포맷익셉션 오류 막기 위해 0으로 선언
		num="0";
		reg="0";
		restep="0";
		relevel="0";
		pageNum="1";
	}
%>

<!-- se2폴더에서 js파일 가져오기  -->
<script type="text/javascript" src="<%=root %>/se2/js/HuskyEZCreator.js" 
charset="utf-8"></script>
<script type="text/javascript" src="<%=root %>/se2/js/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" 
charset="utf-8"></script>
</head>
<body>
<div class="container" role="main">
	<h3>자유게시글 작성</h3>
	<form action="board/jayu/insertaction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pagenum" value="<%=pageNum%>">
	<input type="hidden" name="restep" value="<%=restep %>">
	<input type="hidden" name="relevel" value="<%=relevel %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<br>
		<%-- <b><%=num.equals("0")?"글쓰기":"답글쓰기"%></b> --%>
		<div class="mb-3">
		<label for="subject">제목</label>
			<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해 주세요" autofocus/>
			<br>
			<p style="background-color: #ccccc">※ 저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다. </p>
	
	
</body>
</html>