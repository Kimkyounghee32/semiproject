<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jayuform</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap');

body {
  padding-top: 70px;
  margin-left : 20%;
  margin-right : 20%;
  padding-bottom: 30px;
}

span.title{
	font-family: Noto Sans KR;
	font-size : 23pt;
	font-weight: bold;
	color: #4B89DC;
}

</style>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();
%>
<% 

	String loginok=(String)session.getAttribute("loginok");
	if(loginok==null)
	{%>
		<script type="text/javascript">
			alert("글을 쓰려면 먼저 로그인을 해주세요");
			history.back();
		</script>
	<%}else{
	//답글일 경우 4가지읽기
	String num=request.getParameter("num");
	String reg=request.getParameter("reg");
	String restep=request.getParameter("restep");
	String relevel=request.getParameter("relevel");
	String pageNum=request.getParameter("pageNum");
	
	if(num==null){//integer로 바꿀때 널포인트익셉션이나 넘버포맷익셉션 오류 막기 위해 0으로 선언
		num="0";
		reg="0";
		restep="0";
		relevel="0";
		pageNum="1";
	}
%>

<!-- se2폴더에서 js파일 가져오기  -->
<script type="text/javascript" src="<%=root %>/se2/js/HuskyEZCreator.js" 
charset="utf-8"></script>
<script type="text/javascript" src="<%=root %>/se2/js/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" 
charset="utf-8"></script>

</head>
<body>
<div class="container" role="main">
	<span class="title">자유게시글 작성</span>
	<form action="board/info/insertaction.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pagenum" value="<%=pageNum%>">
	<input type="hidden" name="restep" value="<%=restep %>">
	<input type="hidden" name="relevel" value="<%=relevel %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
		
		<%
		//id 세션값얻기
		String id=(String)session.getAttribute("id");
		%>
		
		<%-- <b><%=num.equals("0")?"글쓰기":"답글쓰기" %></b> --%>
		<br>
		<div class="mb-3">
		 	<label for="writer">작성자</label>
		 	<input type="text" name="myid" class="form-control" 
		 		readonly="readonly" style="width: 120px;" value="<%=id%>">
		 <br>
		</div>
		<div class="mb-3">
			<label for="subject">제목</label>
			<input type="text" class="form-control" name="subject" id="subject" 
			placeholder="제목을 입력해 주세요" autofocus/>
			<br>
			<p style="background-color: #ccccc">
			※ 저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다. </p>
		</div>
		<br>
		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" 
				style="width: 100%; height: 500px; display: none;"></textarea>
		</div>
		<div>
		<button type="button" class="btn btn-sm btn-primary" id="btnList"
			style="width: 100px; float:right; margin-left: 10px;" 
			onclick="location.href='/mainproject/main.jsp?go=board/jayu/jayulist.jsp'">목록</button>
		<button type="button" class="btn btn-sm btn-primary" id="btnSave"
			style="width: 100px; float:right;" onclick="submitContents(this)">작성완료</button>
		</div>
	</form>
	<%}	
%>		
</div>
<!-- 스마트게시판에 대한 코드넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html", /* se2에 들어있는 html에 연결해주는 부분 */

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 
    }
    
}

// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}

</script>

</body>
</html>