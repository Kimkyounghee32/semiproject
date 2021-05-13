<%@page import="data.dto.GalleryDto"%>
<%@page import="data.dao.GalleryDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">

<title>uploading...</title>


</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		System.out.println(directory);
		int maxSize = 1024 * 1024 * 10;
		String encoding="UTF-8";
		
		//생성자로 파일전송 바로 수행,
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealPath = multipartRequest.getFilesystemName("file");
		
		new GalleryDao().uploadGallery(fileName, fileRealPath);
		 
		/* out.write("파일명: " + fileName + "<br>");
		out.write("실제 파일명: " + fileRealPath +"<br>");
		 */
		
	%>
	<script type="text/javascript">
		location.href="../main.jsp?go=gallery/landscape.jsp";
	</script>
</body>
</html>