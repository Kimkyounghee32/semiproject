<%@page import="data.dao.InfoAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("idx");
	String pageNum=request.getParameter("pageNum");
	InfoAnswerDao dao=new InfoAnswerDao();
	dao.deleteboardanswer(idx);
	
	response.sendRedirect("/mainproject/main.jsp?go=board/info/answerlist.jsp?pageNum="+pageNum);
%>