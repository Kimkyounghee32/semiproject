<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	
	logindao dao = new logindao();
	
		JSONObject ob=new JSONObject();
	
	if(dao.idcheck(request.getParameter("id"))){
		ob.put("id", true);
	}	
	
	else if (dao.idcheck(request.getParameter("id"))==false){
		ob.put("id",false);		
	}


%><%=ob.toString() %>
