<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//엔코딩
	request.setCharacterEncoding("utf-8");
	
	//num,subject,content 읽기
	String num=request.getParameter("num");
	String start=request.getParameter("start"); //게스트업데이트부분에서 추가함
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	//dao 선언후 수정
	InfoBoardDao dao=new InfoBoardDao();
	dao.updateInfo(subject, content, num);
	
	/* //목록으로 이동
	response.sendRedirect("../main.jsp?go=board/boardlist.jsp"); */
	
	//목록으로 이동
	String go="/mainproject/main.jsp?go=board/info/infolist.jsp?start="+start;
	response.sendRedirect(go);
%>