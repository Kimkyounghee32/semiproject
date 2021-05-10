<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.logindao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.logindto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	
	if(dao.logincheck(dto.getId(), dto.getPwd())){
		//session 만들고 이전에 있던 화면으로	
		session.setAttribute("id",dto.getId());
		session.setAttribute("loginok", "yes");
		session.setMaxInactiveInterval(60*10);
		response.sendRedirect("/mainproject/main.jsp");		
	}
	else{
		
	}

%>
