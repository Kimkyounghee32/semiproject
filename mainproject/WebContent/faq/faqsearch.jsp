<?xml version="1.0" encoding="UTF-8"?>
<%@page import="qna.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="qna.QnaDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<list> <%

//dao선언
	QnaDao dao=new QnaDao();
//목록 가져오기
String subject=request.getParameter("subject");

//List<AjaxBoardDto> list=dao.getAllDatas();
List<QnaDto> list=dao.getSearchData(subject);

for(QnaDto dto:list){
  %> <board> <category><%=dto.getCategory()%></category> <subject><%=dto.getSubject()%></subject>
<content><%=dto.getContent()%></content> </board> <%
   }
%> </list>