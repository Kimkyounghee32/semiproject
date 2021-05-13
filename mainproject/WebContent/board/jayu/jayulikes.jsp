<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.jayuBoardDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	jayuBoardDao dao=new jayuBoardDao();
	int likes=dao.updateLikes(num);
%>
<likes><%=likes%></likes>