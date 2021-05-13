<%@page import="data.dto.OneBoardDto"%>
<%@page import="data.dao.OneBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OneBoardDao dao =new OneBoardDao();
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	dao.deleteBoard(num);

	

	response.sendRedirect("../main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+pageNum);
%>




