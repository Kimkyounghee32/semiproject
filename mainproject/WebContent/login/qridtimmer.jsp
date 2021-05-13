<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.qrdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	System.out.println("타이머작동");
	qrdao dao=new qrdao();
	JSONObject ob=new JSONObject();
	String id=dao.qridtimmer(request.getParameter("number"));
	System.out.println(id);
	if(!id.equals("0"))
		{
			session.setAttribute("id", id);
			System.out.println("세션부여됨:"+id);
			session.setAttribute("loginok", "yes");
			ob.put("id", id);
		}

	else
		ob.put("id", false);


%><%=ob.toString() %>
