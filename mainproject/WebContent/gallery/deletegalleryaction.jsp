<%@page import="data.dao.GalleryDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
GalleryDao gDao = new GalleryDao();

if (userID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요');");
	script.println("location.href = history.back();");
	script.println("</script>");
	script.close();
	return;
}
String num = null;

if(request.getParameter("num") != null) {
	num = request.getParameter("num");
}

if(userID.equals(gDao.getUserID(num))){
	int result = new GalleryDao.deleteGallery(num);	
}
request.setCharacterEncoding("utf-8");
String repTitle = null;
String reportContent = null;
GalleryDao dao = new GalleryDao();
String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
dao.deleteGallery(num);

response.sendRedirect("../main.jsp?go=gallery/gallery.jsp?pageNum=" + pageNum);
%>