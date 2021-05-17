<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<body>
			<div id="loginpage" class="container-fluid">
				<jsp:include page="/login/login.jsp" />
			</div>
			<div class="logodiv2">
			<div class="logodiv">
				<jsp:include page="logo.jsp" />
				
			</div>
			</div>
			<div id="search">
				<input type="text" placeholder="검색어를 입력해주세요" />
				<button type="button" class="btn btn-primary btn-sm">검색</button>
			</div>
			
			
</body>
</html>