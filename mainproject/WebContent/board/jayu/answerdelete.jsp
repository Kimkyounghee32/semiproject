<%@page import="data.dao.jayuAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root=request.getContextPath();
%>

<%
	String idx=request.getParameter("idx");
	String pageNum=request.getParameter("pageNum");
	jayuAnswerDao dao=new jayuAnswerDao();
	dao.deletejayuanswer(idx);
	
	response.sendRedirect("/mainproject/main.jsp?go=board/jayu/answerlist.jsp?pageNum="+pageNum);
%>