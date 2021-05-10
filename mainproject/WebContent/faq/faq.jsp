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
$(function(){
	$(".qnacontents").hide();
	
	$(".qnatag").click(function(){
		$(".qnacontents").toggle();
		$(this).parent().siblings().find("div.qnacontents").hide();
	});
	
	
});
</script>
<body>
<div class="form">
<b id="title">자주 하는 질문</b><br><br>
<input type="text" class="flow search-text" id="searchText" title="검색어 입력">
<button type="button" class="flow btn-search" id="btnSearch">
<span	class="glyphicon glyphicon-search"></span>
</button>

<hr>
<ul id="qna">
<% 
	QnaDao dao=new QnaDao();
	List<QnaDto> list=dao.getAllDatas();

for(QnaDto dto:list)
{
%>
<li>
		<a class="qnatag" >
			<div class="search-result">
				<p class="subject">[<%=dto.getCategory()%>]<%=dto.getSubject()%>
				<span class="glyphicon glyphicon-chevron-down down"></span></p>
			</div>
		</a>
		<div id="qnacont" class="qnacontents"><%=dto.getContent()%></div>
	</li>
<% 
}
%>
</ul>
</div>
</body>
</html>