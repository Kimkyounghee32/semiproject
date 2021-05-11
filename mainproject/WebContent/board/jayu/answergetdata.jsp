<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.jayuAnswerDto"%>
<%@page import="data.dao.jayuAnswerDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
//엔코딩
	request.setCharacterEncoding("utf-8");

	//dao선언
	jayuAnswerDao dao=new jayuAnswerDao();
	
	//idx,content 읽기
	String idx=request.getParameter("idx");
	
	//getdata 호출 dto받기
	jayuAnswerDto dto=dao.getData(idx);
%>

<content><%=dto.getContent()%></content> 

</data>