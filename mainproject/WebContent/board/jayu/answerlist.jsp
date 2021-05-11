<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.jayuAnswerDto"%>
<%@page import="data.dao.jayuAnswerDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <data>
<%
	/*프로젝트의 경로  */
	 String root=request.getContextPath();
%>
 
<%
	String num=request.getParameter("num");
	String myid=(String)session.getAttribute("myid");	
	jayuAnswerDao dao=new jayuAnswerDao();
	List<jayuAnswerDto> list=dao.getJayuAnswerList(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//MemberDao mdao=new MemberDao();
	for(jayuAnswerDto dto:list)
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