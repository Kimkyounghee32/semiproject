<%@page import="data.dto.InfoBoardDto"%>
<%@page import="data.dao.InfoBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

body {
  padding-top: 70px;
  margin-left : 20%;
  margin-right : 20%;
  padding-bottom: 30px;
}

h3{
	font-family: Noto Sans KR;
	font-size : 23pt;
	font-weight: bold;
}

</style>
<%
	 //프로젝트의 경로
	 String root=request.getContextPath();
%>
</head>
<body>
<%

//num 읽기
	String num=request.getParameter("num");
	//수정 후 보던페이지로 가기위해서 start도 읽음
	String start=request.getParameter("start");
	//num에 해당하는 dto 얻기
	InfoBoardDao dao=new InfoBoardDao();
	InfoBoardDto dto=dao.getData(num);
%>


<!-- se2폴더에서 js파일 가져오기  -->
<script type="text/javascript" src="<%=root %>/se2/js/HuskyEZCreator.js" 
charset="utf-8"></script>
<script type="text/javascript" src="<%=root %>/se2/js/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" 
charset="utf-8"></script>


<div class="update">
	<h3>정보게시글 수정</h3>
	<form action="board/info/infoupdateaction.jsp" method="post">
	
	<!-- hidden  -->
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="start" value="<%=start%>">
		
		<div class="mb-3">
			<label for="subject">제목</label>
			<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해 주세요" value="<%=dto.getSubject()%>">
			<br>
			<p style="background-color: #ccccc">※ 저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다. </p>
		</div>
		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" 
				style="width: 100%; height: 500px; display: none;"><%=dto.getContent()%></textarea>
		</div>
		<div>
		<button type="button" class="btn btn-sm btn-primary" id="btnList"
			style="width: 100px; float:right; margin-left: 10px;" onclick="location.href='/mainproject/main.jsp?go=board/info/infolist.jsp'">목록</button>
		<button type="submit" class="btn btn-sm btn-primary" id="btnSave"
			style="width: 100px; float:right;">수정완료</button>
		</div>
	</form>
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