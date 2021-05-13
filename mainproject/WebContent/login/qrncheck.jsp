<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.qrdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	qrdao dao=new qrdao();
	JSONObject ob=new JSONObject();
	System.out.println("qrncheck:"+request.getParameter("number"));
	if(dao.qrcheck(request.getParameter("number"))){
		ob.put("num", true);		
	}
	else{
		ob.put("num", false);
	}
	
	
%><%=ob.toString()%>