<%@page import="data.dao.mailserver"%>
<%@page import="data.dao.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	logindao dao=new logindao();
	String pwd=dao.findpw(request.getParameter("id"), request.getParameter("email"));
	
	if(!pwd.equals("0")){
		mailserver mail=new mailserver();
		String finduser=request.getParameter("email");
		String content="<div style='text-align:center;'>회원님의 임시패스워드는  "+pwd+"  입니다</div>";
		String subject="[Pick Pictures]회원님이 요청하신 메일입니다";
		mail.navermain(content, finduser, subject);
	}
%>