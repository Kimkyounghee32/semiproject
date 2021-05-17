<%@page import="data.dao.GalleryDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
System.out.println("del action 진입");

String userID = null;
if (session.getAttribute("id") != null) {
	userID = (String) session.getAttribute("id");
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
System.out.println("del action 세션 유효");

String num = null;


if(request.getParameter("num") != null) {
	num = request.getParameter("num");
}
System.out.println(num);

if(userID.equals(gDao.getUserID(num)) || userID.equals("admin")){
	int result = gDao.deleteGallery(num);	
}

String pageNum = request.getParameter("pageNum");
//response.sendRedirect("../main.jsp?go=gallery/gallery.jsp?" + pageNum);
response.sendRedirect("/mainproject/login/mypage.jsp");
%>