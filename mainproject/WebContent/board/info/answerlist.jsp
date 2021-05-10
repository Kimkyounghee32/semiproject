<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.List"%>
<%@page import="data.dto.InfoAnswerDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.InfoAnswerDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <data>
<%
	String num=request.getParameter("num");
	InfoAnswerDao adao=new InfoAnswerDao();
	List<InfoAnswerDto> list=adao.getboardanswerList(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//MemberDao mdao=new MemberDao();
	for(InfoAnswerDto dto:list)
	{ 
%>
	<answer idx="<%=dto.getIdx()%>" num="<%=dto.getNum()%>">
	<content><%=dto.getContent()%></content>
	<myid><%=dto.getMyid()%></myid>
	<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	</answer>
	<%}
%>	
</data>