<%@page import="data.dao.mailserver"%>
<%@page import="data.dto.logindto"%>
<%@page import="data.dao.logindao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//일단 전송
	logindao dao=new logindao();
	String id=dao.findid(request.getParameter("email"));
	//여기서 스크립트를 입혀서 전송 일단 테스트
	
	mailserver mail=new mailserver();
	String finduser=request.getParameter("email");
	String content="<div style='text-align:center;'>회원님의 아이디는"+id+"입니다</div>";
	String subject="[Pick Pictures]회원님이 요청하신 메일입니다";
	mail.navermain(content, finduser, subject);	
%>	
