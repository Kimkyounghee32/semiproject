<%@page import="qna.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="qna.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="faq.css" />
</head>
<script type="text/javascript">
/*$(function(){
	$(".qnacontents").hide();
	
	$(".qnatag").click(function(){
		$(".qnacontents").toggle();
		$(".qnatag").toggleClass(".down");
	});
	
	
});*/
</script>
<body>
<div class="form">
<b id="title">자주 하는 질문</b><br><br>
<input type="text" class="flow search-text" id="searchText" title="검색어 입력">
<button type="button" class="flow btn-search" id="btnSearch">
<span	class="glyphicon glyphicon-search"></span>
</button>
</div>
<hr>
<table class="table table-bordered" id="qna">
<% 
	QnaDao dao=new QnaDao();
	List<QnaDto> list=dao.getAllDatas();
	System.out.println(list);

for(QnaDto dto:list)
{
%>
<tr align="center">	
<td><%=dto.getSubject()%></td>
</tr>
<tr align="center">	
<td><%=dto.getContent()%></td>
</tr>
<% 
}
%>
</table>
</body>
</html>