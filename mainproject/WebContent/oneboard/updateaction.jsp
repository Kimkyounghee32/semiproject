
<%@page import="data.dto.OneBoardDto"%>
<%@page import="data.dao.OneBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String start=request.getParameter("start");
	String pageNum=request.getParameter("pageNum");
	String content=request.getParameter("content");
	String subject=request.getParameter("subject");
	
	OneBoardDao dao=new OneBoardDao();
// 	dao.updateBoard(num, subject, content);
	//BoardDto dto=dao.getData(num);

	String path="../main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+pageNum;
	response.sendRedirect(path);
%>
