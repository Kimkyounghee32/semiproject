<%@page import="data.dao.InfoBoardDao"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	InfoBoardDao dao=new InfoBoardDao();
	
	InfoBoardDto dto=new InfoBoardDto();
	dto.setWriter(request.getParameter("writer"));
	dto.setWriter(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	dao.insertSmart(dto);
	
	int num=dao.getMaxNum();
	response.sendRedirect("main.jsp?go=board/info/infocontent.jsp?num="+num);
%>