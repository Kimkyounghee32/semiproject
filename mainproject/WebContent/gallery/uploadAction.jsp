<%@page import="data.dto.GalleryDto"%>
<%@page import="data.dao.GalleryDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="data.dao.GalleryDao"/>
<jsp:useBean id="dto" class="data.dto.GalleryDto"/> 
<%
	
	dto.setWriter(request.getParameter("writer"));
	System.out.println("upact:"+dto.getNum());
	System.out.println("upact request.getparameter writer:"+request.getParameter("writer"));
	System.out.println("upact:"+dto.getImgName());
	System.out.println("upact:"+dto.getImgRealName());
	System.out.println("upact:"+dto.getHashtag()); 
%>

	<%	
		
		String directory = application.getRealPath("/upload");
		System.out.println("getRealPath(\"/upload\"):" + directory);
		int maxSize = 1024 * 1024 * 10;
		String encoding="UTF-8";
		
		String writer =(String) session.getAttribute("id");
		//System.out.println("writer: " + writer);		
		//생성자로 파일전송 바로 수행,
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		System.out.println("test:"+multipartRequest.getParameter("writer"));
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealPath = multipartRequest.getFilesystemName("file");
		
		System.out.println("upload Action fileName: " + fileName );
		System.out.println("upload Action fileRealPathName: " + fileRealPath );
		dto.setWriter(writer);
		dto.setImgName(fileName);
		dto.setImgRealName(fileRealPath);
		System.out.println("RealName(): " + dto.getImgRealName());
		dao.uploadGallery(dto);
		/* out.write("파일명: " + fileName + "<br>");
		out.write("실제 파일명: " + fileRealPath +"<br>");
		 */
		response.sendRedirect("../main.jsp?go=gallery/landscape.jsp");
	%>