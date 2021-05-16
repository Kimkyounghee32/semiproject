<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.mypagedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String atag = request.getParameter("atag");
String id = (String) session.getAttribute("id");

JSONObject ob = new JSONObject();
JSONArray arry = new JSONArray();
//id랑 태그던져서 구한다
if (id != null) {
	if (!id.equals(null)) {
		if (atag.equals("정보게시판")) {
			arry=mypagedao.infoboard(id);
			
		} else if (atag.equals("자유게시판")) {
			arry=mypagedao.jayuboard(id);
			
			
		}else if (atag.equals("갤러리")) {
			
		
		} else {
			//내정보
			String[] myinfo=mypagedao.myinfo(id);
			ob.put("id", myinfo[0]);
			ob.put("email", myinfo[1]);
			arry.add(ob);
			
		}
	}
}
%><%=arry.toString()%>