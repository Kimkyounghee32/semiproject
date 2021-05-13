<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	InfoBoardDao dao=new InfoBoardDao();
	int likes=dao.updateLikes(num);
%>
<likes><%=likes%></likes>