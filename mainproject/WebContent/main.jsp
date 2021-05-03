<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css" />
<!-- 3.4.1 MaxCDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<%
	//body를 읽어서 널일경우 body.jsp를 include
	//널이 아닐경우 해당 파일을 include
	String body="layout/body.jsp";
	String go=request.getParameter("go");//경로 포함한 파일명
	if(go!=null)body=go;
%>
<body>
	<div id="page">
		<div>
			<jsp:include page="layout/title.jsp" />
		</div>
		<div>
			<jsp:include page="layout/nav.jsp" />
		</div>
		<div class="body">
			<jsp:include page="<%=body %>" />
		</div>
		<div id="footer" style="opacity: 1;">
		
<div class="footer_cc">
<h2>고객지원센터</h2>
<div class="cc_view cc_call">
<h3><span class="tit">0000-0000</span></h3>
<dl class="list">
<dt>고객센터 운영시간</dt>
<dd>당신이 잠들때</dd>
</dl>
</div>
<div class="cc_view cc_qna">
<h3><a href="#none" onclick="" class="">1:1 문의</a></h3>
<dl class="footerlist">
<dt>24시간 접수 가능</dt>
<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
</dl>
</div>
</div>

<div class="company">
<div class="cc_view cc_kakao">
<h3><a class="tit" href="#none">카카오톡 문의</a></h3>
<dl class="list">
<dt>고객센터 운영시간</dt>
<dd>당신이 잠들때</dd>
</dl>
</div>

<ul class="footerlist">
<li><a class="link" href="">Gallery</a></li>
<li><a class="link" href="" onclick="">Community</a></li>
<li><a class="link" href="" target="">Support</a></li>
<li><a class="link" href="">이용약관</a></li>
<li><a class="link emph" href="">개인정보처리방침</a></li>
<li><a class="link" href="">이용안내</a></li>
</ul>
<br>
주소 : 서울시 백암빌딩 501호 <span class="bar">I</span> 팀장 : 윤준수 <span class="bar">I</span> 이메일 : <a href="bitcamp@bitcamp.com" class="link">help@bitcamp.com</a>
<ul class="footerlist">
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt=" 인스타그램 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt=" 페이스북 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt=" 네이버블로그 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="  "></a>
</li>
<li>
<a href="" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="  "></a>
</li>
</ul>
</div>

</div>

	</div>
</body>
</html>