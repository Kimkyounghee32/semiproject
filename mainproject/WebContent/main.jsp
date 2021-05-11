<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="main.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<%
	//body를 읽어서 널일경우 body.jsp를 include
	//널이 아닐경우 해당 파일을 include
	String body="layout/body.jsp";
	String go=request.getParameter("go");//경로 포함한 파일명
	if(go!=null)body=go;
		
		String id=(String)session.getAttribute("id");

%>
	<div class="page">
		<div class="title">
			<jsp:include page="layout/title.jsp" />
		</div>
		<div class="nav">
			<jsp:include page="layout/nav.jsp"/>
		</div>
		<div class="body">
			<jsp:include page="<%=body %>"/>
		</div>
		<div>
			<jsp:include page="layout/footer.jsp" />
		</div>
</div>
</body>
</html>