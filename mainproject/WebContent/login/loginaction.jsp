<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.logindao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.logindto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	
		JSONObject ob=new JSONObject();
	if(dao.logincheck(dto.getId(), dto.getPwd())){
		//로그인성공
		session.setAttribute("id",dto.getId());
		session.setAttribute("loginok", "yes");
		session.setMaxInactiveInterval(60*10);
		ob.put("id", true);
	}

	else{
		ob.put("id",false);
	}

%><%=ob.toString()%>