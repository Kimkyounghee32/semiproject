<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	display: inline-block;
	margin-top: 100px;
}

.imgs_wrap {
	min-height: 200px;
	border: 1px solid #888;
}

.HomeUpload--Button {
	cursor: pointer;
	width: 153px;
	height: 48px;
	line-height: 48px;
	background: #0870d1;
	border-radius: 28px;
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
	color: #fff;
	font-weight: 700;
}

.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
</style>
<!-- <script type="text/javascript">
$(function(){
	$("#addbtn").click(function(e){
		//e.preventDefault();
		$("#addphoto").click();
	});
	function changeValue(obj){
		alert(obj.value);
	}
});
</script>
 --><%
	String loginok=(String)session.getAttribute("loginok");
	if(loginok==null)
	{%>
		<script type="text/javascript">
			alert("글을 쓰려면 먼저 로그인을 해주세요");
			history.back();
		</script>
	<%}
%>
</head>
<body>


	<div class="container" style="height: 1200px; text-align: center;">
		<div class="form-control">
			<form action="gallery/uploadAction.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="writer" value="<%=(String) session.getAttribute("id")%>">
				<input type="hidden" name="pagenum" value="page">
				
				<label id="addbtn" class="HomeUpload--Button" for="addphoto"> Upload </label>
				<input type="file" id="addphoto" name="file" required="required" style="display: none;"> 
				<input class="HomeUpload--Button" type="submit" value="전송" />
			</form>
				<%
				String id = null; //
				if (session.getAttribute("id") != null) {
					id = (String) session.getAttribute("id");
				}
				System.out.println("session id get Success : " + id);
// 				System.out.println("");
// 				System.out.println("");
// 				System.out.println("");
				%>
		</div>

	</div>
</body>
</html>