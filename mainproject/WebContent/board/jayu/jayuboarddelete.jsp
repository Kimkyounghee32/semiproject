<%@page import="data.dao.jayuBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String num=request.getParameter("num");
 	String pageNum=request.getParameter("pageNum");
 	jayuBoardDao dao=new jayuBoardDao();
 	dao.deletejayu(num);
 	
 	response.sendRedirect("/mainproject/main.jsp?go=board/jayu/jayulist.jsp?pageNum="+pageNum);
 
 %>