<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.imgs_wrap{
	min-height:200px;
	border:1px solid #888;
}

</style>
<script src='js/file_upload.js'></script>
</head>
<body>

	<h2>이미지 업로드</h2>
	<div class='input-wrap'>
		<form action="gallery/uploadAction.jsp" method="post" enctype="multipart/form-data">
			<input type='file' id='btnAtt' name="file" multiple required="required" />
			<input type='submit' value='전송' />
		</form>
	</div>
	
	
	<div class='imgs_wrap' id='imgs_wrap'></div>


<!-- 	<script> -->
<!-- 		upload.start('btnAtt', 'submitAction', 'imgs_wrap', 'file_upload_action.jsp'); -->
<!-- 	</script> -->
</body>
</html>