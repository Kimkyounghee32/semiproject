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
<link rel="stylesheet" type="text/css" href="faq.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("div.qnacontents").hide();
	
	$(".qnatag").click(function(){
		$("div.qnacontents").toggle("slow");
		$(this).parent().siblings().find("div.qnacontents").hide();
	});
	
	 
});	

$(document).on("click","#btnSearch",function(){
	 $("div.qnaa").hide();
	list();
});	
	
function list()
	{
		var subject=$("#searchText").val();
	      
	     $.ajax({
	    	type:"get",
	    	url:"faqsearch.jsp",
	    	dataType : "xml",
	        data : {"subject":subject},
	        success:function(data){
	        var s="";	
	        	s+="<ul class='ulsearch'>";
            	s+="<a class='asearch'>";
            	s+="<div class='dsearch'>";
  
		   var n=$(data).find("board").length;
	        if(n==0){
                alert("해당 질문이 없습니다.");
                return;
             
             }else{
                //var no=total-start+1;//각페이지에서 출력할 시작번호
                $(data).find("board").each(function(i, element) {
                   var n=$(this);
                   var category=n.find("category").text();
                   var subject=n.find("subject").text();
                   var content=n.find("content").text();

                   
                   //출력
                   s+="<p class='subject'>["+category+"]&nbsp;"+subject;
                   s+="<span class='glyphicon glyphicon-chevron-down down'>";
                   s+="</p>";
                   s+="</div>";
                   s+="</a>";
                   //페이지에 해당하는 번호
                   s+="<div class='scontnet'>"+content+"</div><br>";
 				   s+="</li>";
                });
             }
	        s+="</ul>";
            $("div.list").html(s);
			}
	     });
	     
	}

</script>
<body>
<div class="form">
<b id="title">자주 하는 질문</b><br><br>
<input type="text" class="flow search-text" id="searchText" title="검색어 입력">
<button type="button" class="flow btn-search" id="btnSearch">
<span	class="glyphicon glyphicon-search"></span>
</button>

<hr>
<div class="qnaa">
<ul class="qna">
<% 
	QnaDao dao=new QnaDao();
	List<QnaDto> list=dao.getAllDatas();

for(QnaDto dto:list)
{
%>
<li>
		<a class="qnatag" >
			<div class="search-result">
				<p class="subject">[<%=dto.getCategory()%>]&nbsp;<%=dto.getSubject()%>
				<span class="glyphicon glyphicon-chevron-down down"></span></p>
			</div>
		</a>
		<div id="qnacont" class="qnacontents">&nbsp;<%=dto.getContent()%></div>
		<br>
	</li>
<% 
}
%>
</ul>
</div>
</div>
<div class="list"></div>
</body>
</html>