<%@page import="data.dao.mailserver"%>
<%@page import="data.dao.logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	logindao dao=new logindao();
	String pwd=dao.findpw(request.getParameter("id"), request.getParameter("email"));
	
	if(!pwd.equals("0")){
		mailserver mail=new mailserver();
		String finduser=request.getParameter("email");
		String content="<div style='text-align: center;'><div>"
				+"</div><div><p>회원님이 요청하신 임시비밀번호는"+pwd+ "입니다</p></div>"
				+"<div><p>본 메일은 발신전용입니다. 궁금한 사항은 고객센터에 문의해주시기 바랍니다.</p>"
				+"</div></div>";
		String subject="[Pick Pictures]회원님이 요청하신 메일입니다";
		mail.navermain(content, finduser, subject);
	}
%>