<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="data.dao.logindao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.logindto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	//유저 생성
	dao.createuser(dto);

	//세션부여
	session.setAttribute("id",dto.getId());
	session.setAttribute("loginok", "yes");
	session.setMaxInactiveInterval(60*10); //세션 10분
%>    