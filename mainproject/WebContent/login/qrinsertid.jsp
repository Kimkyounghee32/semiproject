<%@page import="data.dao.qrdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	System.out.println("qrinsertid에서 number:"+request.getParameter("number"));
	System.out.println("qrinsertid에서 id:"+request.getParameter("id"));
	qrdao dao=new qrdao();
	dao.qrinsertid(request.getParameter("id"), request.getParameter("number"));

%>
