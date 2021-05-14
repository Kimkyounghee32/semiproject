<%@page import="data.dao.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	logindao dao=new logindao();
	dao.mypw(request.getParameter("pwd"), request.getParameter("id"));
	session.invalidate();
%>