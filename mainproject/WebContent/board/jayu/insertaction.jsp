<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
System.out.println("action");
%>

<jsp:useBean id="dao" class="data.dao.jayuBoardDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.jayuBoardDto"/> <!--이렇게 닫아줘도됩니다-->

<!-- 같은 이름의 데이타를 읽어서 자동으로 dto에 넣어준다 -->
<jsp:setProperty property="*" name="dto"/>
<%	
	//페이지 번호 읽기
	String pageNum=request.getParameter("pageNum");
	dto.setMyid((String)session.getAttribute("id"));
	//db에 insert
	dao.insertjayu(dto);
	//게시글 목록페이지로 이동
	response.sendRedirect("/mainproject/main.jsp?go=board/jayu/jayulist.jsp?pageNum="+pageNum);
%>
