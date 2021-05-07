<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String num=request.getParameter("num");
 	String pageNum=request.getParameter("pageNum");
 	InfoBoardDao dao=new InfoBoardDao();
 	dao.deleteInfo(num);
 	
 	response.sendRedirect("/mainproject/main.jsp?go=board/info/infolist.jsp?pageNum="+pageNum);
 
 %>