
<%@page import="data.dto.InfoAnswerDto"%>
<%@page import="data.dao.InfoAnswerDao"%>
<%@page import="data.dto.InfoBoardDto"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- db넣기 -->
<%
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String myid=request.getParameter("myid");
	String content=request.getParameter("content");
	
	InfoAnswerDao dao=new InfoAnswerDao();
	InfoAnswerDto dto=new InfoAnswerDto();
	dto.setMyid(myid);
	dto.setNum(Integer.parseInt(num)); //num은 dto에서 int로 선언해줬으니까 인티져파스인트사용
	dto.setContent(content);
	
	dao.insertboardanswer(dto);
	
%>