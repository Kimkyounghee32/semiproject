<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
h3 {
  display: block;
  font-size: 2em;
  margin-top: 5em;
  margin-bottom: 1em;
  margin-left: 300px;
  margin-right: 0;
  font-weight: bold;
  color: #333333;
}
span.glyphicon-chevron-left{
  margin-top: 0em;
  margin-bottom: 1em;
  margin-left: 500px;
  margin-right: 0;
}
</style>
</head>
<body>
	<h3>정보공유게시판</h3>
	<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">추천</th>
						<th style="background-color: #eeeeee; text-align: center;">조회</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>10</td>
					<td>투어박스 네오 사진편집 영상편집 포토샵 프리미어 컨트롤러 </td>
					<td>덕촌이장</td>
					<td>21/05/01</td>
					<td>6</td>
					<td>341</td>
					</tr>
					<tr>
					<td>9</td>
					<td>소니 E-마운트 카메라의 화각을 완성하다. 탐론 17-28mm F2.8 Di III RXD </td>
					<td>덕촌이장</td>
					<td>2021/04/27</td>
					<td>10</td>
					<td>651</td>
					</tr>
					<tr>
					<td>8</td>
					<td>a6400 에 빌트록스 23mm 1.4 사용기입니다! 제주살이 </td>
					<td>22이</td>
					<td>21/04/20</td>
					<td>5</td>
					<td>111</td>
					</tr>
					<tr>
					<td>7</td>
					<td>시네마 미러리스 카메라 루믹스 S5 간단 사용기!</td>
					<td>토담</td>
					<td>21/04/18</td>
					<td>2</td>
					<td>31</td>
					</tr>
					<tr>
					<td>6</td>
					<td>빌트록스 VILTROX EF-GFX Lens Mount Adapter 렌즈마운트 어뎁터</td>
					<td>현이스</td>
					<td>21/04/11</td>
					<td>3</td>
					<td>321</td>
					</tr>
					<tr>
					<td>5</td>
					<td>Fujifilm 후지 GFX50R 중형카메라 장노출 판형깡패</td>
					<td>덕촌이장</td>
					<td>21/05/01</td>
					<td>6</td>
					<td>341</td>
					</tr>
					<tr>
					<td>4</td>
					<td>65년 생의 카메라 이야기 - 후지필름 X-Pro3</td>
					<td>덕촌이장</td>
					<td>2021/04/27</td>
					<td>10</td>
					<td>651</td>
					</tr>
					<tr>
					<td>3</td>
					<td>니콘 Nikon D3s : '격정(激情)'의 순간인가 </td>
					<td>22이</td>
					<td>21/04/20</td>
					<td>5</td>
					<td>111</td>
					</tr>
					<tr>
					<td>2</td>
					<td>어도비 클라우드 파일 복구 요청기 (결론 : 복구 안해줍니다)</td>
					<td>토담</td>
					<td>21/04/18</td>
					<td>2</td>
					<td>31</td>
					</tr>
					<tr>
					<td>1</td>
					<td>RICOH GR III 지난 3년간의 기록 4K</td>
					<td>현이스</td>
					<td>21/04/11</td>
					<td>3</td>
					<td>321</td>
					</tr>	
				</tbody>
				</table>
				
				<div>
				<button type="button" class="btn btn-info btn-xs" >다음페이지</button>
				<span class="glyphicon glyphicon-chevron-left" id="pre"></span>
				<span class="glyphicon glyphicon-chevron-right" id="next"></span>
				<button type="button" class="btn btn-info btn-xs" style="float: right;">새로고침</button>
				</div>
			</div>
	</div>
<script type="text/javascript">
   location.href="main.jsp?go=mbtimain.jsp";
</script>
</body>
</html>