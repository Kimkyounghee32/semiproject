<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css" />
<!-- 3.4.1 MaxCDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<!-- <script src="https://code.jquery.com/jquery-3.5.0.js"></script> -->
</head>
<%
	//body를 읽어서 널일경우 body.jsp를 include
	//널이 아닐경우 해당 파일을 include
	String body="layout/body.jsp";
	String go=request.getParameter("go");//경로 포함한 파일명
	if(go!=null)body=go;
%>
<body>
<div id="page">
	<div>
		<jsp:include page="layout/title.jsp"/>
	</div>
	<div>
		<jsp:include page="layout/nav.jsp"/>
	</div>
	<div id = "today">
		<jsp:include page="today/todayphoto.jsp"/>
	</div>
	<div id="loginpage" class="container-fluid">
		<jsp:include page="login/login.jsp"/>
	</div>
	<div class="body">
		<jsp:include page="<%=body %>"/>
	</div>
	
</div>

</body>
</html>