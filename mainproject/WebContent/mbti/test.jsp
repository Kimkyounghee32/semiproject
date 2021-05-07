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
<link rel="stylesheet" type="text/css" href="mbtitest.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap');
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
				<h2 class="text-center mt-5" id="title" style="font-weight: bold;">
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
				<h2 id="title2"> 나도 몰랐던 카메라 취향은?</h2>
				<img id="img" class="mt-5"alt="camera" src="pola.png">
				<h2 id="camera" class="text-center mt-5">카메라이름</h2>
				<h3 id="explain" class="text-center mt-5">설명</h3>
				
                <div class="share addthis_inline_share_toolbox"></div>
			</div>
		</article>	
	</div>
	<input type="hidden" id="EI" value="0">
	<input type="hidden" id="NS" value="0">
	<script type="text/javascript">
	var num=1;
	var q= {
			1:{"title":"드디어 찾아온 주말, <br>무얼하며 휴식을 보낼건가요?",
			     "type":"EI","A":"친구들을 만나며 사진으로 기록한다 ",
			                  "B":"침대에 누워서 휴대폰 갤러리를 구경한다."},

			2:{"title":"출사 장소를 고를 때 나는? ",
			     "type":"EI","A":"무조건 내가 가고싶은 곳으로 간다!",
			                 "B":"같이 가는 사람 의견을 따른다!"},
				
			3:{"title":"낯선 곳으로 출사를 나가기로 한 당신!<br>누구와 함께 갈 것인가요?",
			      "type":"EI","A":"낯선 곳은 무서우니까~ 같이 갈 친구를 구한다!",
				         	  "B":"누구랑 가긴 누구랑 가! 무조건 혼자 간다!"},

			4:{"title":"내가 좋아하는 사진 주제는?",
			     "type":"NS","A":"사진은 추상적! 주제를 정한 후 찍는다!",
			                 "B":"자연 최고! 무조건 풍경만 찍는다!"},

			5:{"title":"취미로 사진을 택한 당신, 가장 먼저 하는 것은?",
			     "type":"NS","A":"사진 배경의 영화를 찾아본다",
			                 "B":"사진 블로그와 정보를 섭렵한다"},

			6:{"title":"사진을 설명할 때 둘 중에 포기할 수 없는 것은?",
			     "type":"NS","A":"비유적이고 암시적인 묘사",
			                 "B":"사실적이고 구체적인 설명"}
	}
	var result={
		"EN":{"camera":"폴라로이드","explain":"재능이 많고 상상력이 풍부한 당신!<br>"+
			"대인관계가 넓어 사람들에게서 에너지를 얻고<br>"+
			"창의적이며 항상 새로운 가능성을 찾고 시도하는데요,<br>"+
			"그런 당신에게 딱 맞는 카메라는 바로~<br>"+
			"즉석에서 사진을 볼 수 있는 폴라로이드입니다!","img":"pola.png"},
			
		"IN":{"camera":"필름카메라",
		"explain":"혼자하기의 달인인 당신! <br>"+
		"공상도 많이하고 혼자서 무언가 하는 것을 좋아하고 <br>"+ 
		"본인들만의 세계가 있고 이상이 있는데요, <br> "+
		"그런 당신에게 딱 맞는 카메라는 바로~<br>"+
		"혼자만의 감성에 빠질 수 있는 필름 카메라입니다!","img":"film.png"},
		
		"ES":{"camera":"DSLR","explain":"사회생활 만렙인 당신!<br>"+
			"활동적이며 행동 지향적이고<br>"+
			"붙임성이 좋은 현실주의자인데요,<br>"+
			"그런 당신에게 딱 맞는 카메라는 바로~<br>"+
			"고감도 촬영이 가능한 DSLR 입니다","img":"dslr.png"},
		
		"IS":{"camera":"미러리스","explain":"사려깊고 꼼꼼한 당신!<br>"+
			"신중하고 차분하며 사실을 통해 입증하기를  좋아하고<br>"+
			"변화를 선호하지 않으며 보존하려는 특징이 있는데요,<br>"+
			"그런 당신에게 딱 맞는 카메라는 바로~<br>"+
			"휴대하고 다니면서 일상을 기록할 수 있는 미러리스입니다!","img":"mirror.png"}
	}
	$(function(){
		$(".result").hide();
		 next();
		
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
			$("#camera").html(result[mbti]["camera"]);
			$("#explain").html(result[mbti]["explain"]);
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
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6093907a141e311e"></script>
</body>
</html>