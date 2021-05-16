<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.GalleryDto"%>
<%@page import="data.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <data>
<%
	String num=request.getParameter("num");
	System.out.println("reqpram num :" + num);
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	System.out.println("start: " + start);
	System.out.println("end: " + end);
	GalleryDao dao=new GalleryDao();
	List<GalleryDto> list=dao.getList(start, end);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//MemberDao mdao=new MemberDao();
	for(GalleryDto dto:list) { 
		String photo = "upload/" + dto.getImgRealName();
		System.out.println(photo);
	%>
	<photolist>
		<num><%=dto.getNum()%></num>
		<writer><%=dto.getWriter()%></writer>
		<photo><%=photo%></photo>
		<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	</photolist>
	<%}
%>	
</data>