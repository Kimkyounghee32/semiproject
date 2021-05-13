<%@page import="data.dao.qrdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	qrdao dao=new qrdao();
	dao.savenum(request.getParameter("number"));

%>