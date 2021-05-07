
<%@page import="data.dto.InfoBoardDto"%>
<%@page import="data.dao.InfoSmartDao"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- db넣기 -->
<%
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String myid=request.getParameter("myid");
	String content=request.getParameter("content");
	
	
%>