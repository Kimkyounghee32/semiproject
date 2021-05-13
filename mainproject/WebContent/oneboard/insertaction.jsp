<%@page import="data.dto.OneBoardDto"%>
<%@page import="data.dao.OneBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- new로 선언하는 것과 같다 -->
<jsp:useBean id="dao" class="data.dao.OneBoardDao"/>
<jsp:useBean id="dto" class="data.dto.OneBoardDto"/>

<!-- 같은 이름의 데이터를 읽어서 자동으로 dto에 넣어준다 -->
<jsp:setProperty property="*" name="dto"/>
<%
	//페이지 번호 읽기
	String pageNum=request.getParameter("pageNum");
	dto.setMyid((String)session.getAttribute("id"));
	
	//db에 insert
	dao.insertBoard(dto);
	response.sendRedirect("../main.jsp?go=oneboard/oneboardlist.jsp?pageNum="+pageNum);
%>