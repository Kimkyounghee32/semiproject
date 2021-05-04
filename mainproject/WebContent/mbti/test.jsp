<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="main.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap');

#mbtipage {
	min-width: 1200px;
	max-width: 1200px;
	margin: auto;
	padding: 10px;
	height: 100vh;
}

div.mbtiimg {
	background-image: url('mbtitest.png');
	background-repeat: no-repeat;
	width: 1120px;
	height: 850px;
	margin-top: 0px;
	margin-left: 50px;
}
div.mbtiiimg{
	background-image: url('back.png');
	background-repeat: no-repeat;
	width: 1120px;
	height: 850px;
	margin-top: 0px;
	margin-left: 50px;
}

article.test {
	padding-top: 500px;
	font-family: 'Noto Serif KR';
	color: #18A8F1;
}

div.choose{
	width: 600px;
	padding-left: 350px;
	font-family: 'Noto Serif KR';
}

div.progress {
	margin-left: 250px;
	width: 60%;
	height: 20px;
}

#title{
	padding-left: 20px;
	font-size: 2.5em;
}

#img{
	width: 800px;
	height: 600px;
	margin-left: 150px;
}

#camera{
	font-family: 'Noto Serif KR';
	color: #18A8F1;
	font-size: 2.5em;
}

#explain{
	font-family: 'Noto Serif KR';
	color: #18A8F1;
}

</style>
</head>
<body>
	<div id="mbtipage">
		<div class="mbtiimg">
			<article class="test">
				<div class="progress mt-5">
					<div class="progress-bar" role="progressbar"
						style="width: calc(100/6*1%); background-color: #4B89DC;" ></div>
				</div>
				<h2 class="text-center mt-5" id="title">
					<b>문제</b>
				</h2>
				<br>
				<div class="choose">
				<input id="type" type="hidden" value="EI">
					<button id="A" type="button" class="btn btn-info btn-lg mt-5"
						style="background-color: #4B89DC; border: none; font-size: 2em;">
						</button>
					<br> <br>
					<button id="B" type="button" class="btn btn-info btn-lg mt-5"
						style="background-color: #4B89DC; border: none; font-size: 2em;">
						</button>
				</div>
			</article>
		</div>
		<article class="result">
			<div class="mbtiiimg">
				<img id="img" class="mt-5"alt="camera" src="pola.png">
				<h2 id="camera" class="text-center mt-5">카메라이름</h2>
				<h3 id="explain" class="text-center mt-5">설명</h3>
			</div>
		</article>	
	</div>
	<input type="hidden" id="EI" value="0">
	<input type="hidden" id="NS" value="0">
	<script type="text/javascript">
	var num=1;
	var q= {
		1:{"title":"낯선 곳으로 출사를 나가기로 한 당신!<br>누구와 함께 갈 것인가요?",
		"type":"EI","A":"누구랑 가긴 누구랑 가! 무조건 혼자 간다!",
		"B":"낯선 곳은 무서우니까~ 커뮤니티에서 친구를 구한다!"},
		2:{"title":"문제 2번","type":"EI","A":"E","B":"I"},
		3:{"title":"문제 3번","type":"EI","A":"E","B":"I"},
		4:{"title":"문제 4번","type":"NS","A":"N","B":"S"},
		5:{"title":"문제 5번","type":"NS","A":"N","B":"S"},
		6:{"title":"문제 6번","type":"NS","A":"N","B":"S"}
	}
	var result={
		"EN":{"camera":"폴라로이드","explain":"폴라로이드 설명","img":"pola.png"},
		"IN":{"camera":"필름카메라","explain":"필름 카메라 설명","img":"film.png"},
		"ES":{"camera":"DSLR","explain":"DSLR 설명","img":"pola.png"},
		"IS":{"camera":"미러리스","explain":"미러리스 설명","img":"pola.png"}
	}
	$(function(){
		$(".result").hide();
		
	$("#A").click(function(){
		var type=$("#type").val();
		var preValue = $("#"+type).val();
		$("#"+type).val(parseInt(preValue)+1)
		next();
	});
	$("#B").click(function(){
	next();
	});
	
	function next() {
		if(num==7){
			$(".mbtiimg").hide();
			$(".result").show();
			var mbti="";
			($("#EI").val()<2)?mbti+="I":mbti+="E";
			($("#NS").val()<2)?mbti+="S":mbti+="N";

			$("#img").attr("src",result[mbti]["img"]);
			$("#camera").html(resultp[mbti]["camera"]);
			$("#explain").html(resultp[mbti]["explain"]);
		}else{
			$(".progress-bar").attr('style','width: calc(100/6*'+num+'%)');
			$("#title").html(q[num]["title"]);
			$("#type").val(q[num]["type"]);
			$("#A").html(q[num]["A"]);
			$("#B").html(q[num]["B"]);
			num++;
		}
		
	}
	});

	</script>
</body>
</html>