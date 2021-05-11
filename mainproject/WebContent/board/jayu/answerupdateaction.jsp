<%@page import="data.dao.jayuAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//엔코딩
	request.setCharacterEncoding("utf-8");

	//idx,content 읽기
	String idx=request.getParameter("idx");
	String content=request.getParameter("content");
	System.out.println(idx);
	System.out.println(content);
	
	//dao선언 후 수정
	jayuAnswerDao dao=new jayuAnswerDao();
	
	//수정메서드 호출
	dao.updateanswer(idx, content);
	
	//목록으로 이동
	response.sendRedirect("/mainproject/main.jsp?go=board/jayu/answerlist.jsp");
%>