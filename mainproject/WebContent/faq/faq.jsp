<%@page import="data.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="faq/faq.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("div.qnacontents").hide();
	$("div.btn").hide();
	$(".qnatag").click(function(){
		$("div.qnacontents").toggle("slow");
		$(this).parent().siblings().find("div.qnacontents").hide();
	}); 
});	

$(document).on("click","#btnSearch",function(){
	 $("div.qnaa").hide();
	 $("div.btn").show();
	list();
});	
	

function list()
{
	var subject=$("#searchText").val();

     $.ajax({
    	type:"get",
    	url:"faq/faqsearch.jsp",
    	dataType : "xml",
        data : {"subject":subject},
        success:function(data){
        var s="";	
       		s+="<div class='dsearch'>";
        	s+="<b class='asearch'>";
        	
     	
	   var n=$(data).find("board").length;
	   var m=subject.length;
	   console.log(n);
        if(n==0){
            alert("해당 질문이 없습니다.");
            history.go();
    	 }else if(m==0){
    		alert("질문을 입력해주세요.");
    		 history.go();
    	 }else if(subject==" "){
    		 alert("질문을 입력해주세요.");
    		 history.go();
    	 }else{
            //var no=total-start+1;//각페이지에서 출력할 시작번호
            $(data).find("board").each(function(i, element) {
               var n=$(this);
               var category=n.find("category").text();
               var subject=n.find("subject").text();
               var content=n.find("content").text();

               
               //출력
               s+="<p class='subject'>["+category+"]&nbsp;"+subject;
               s+="</p>";
               
               s+="</b>";
               //페이지에 해당하는 번호
               s+="<div class='scontnet'>"+content+"</div><br>";
            });
         }
        s+="</div>";
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
<span class="glyphicon glyphicon-search search"></span>
</button>
<br>
<br>
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
<div class="btn">
<button class="btn btn-info btn-lg" onclick="location.href='faq/faq.jsp'">목록</button>
</div>
</body>
</html>