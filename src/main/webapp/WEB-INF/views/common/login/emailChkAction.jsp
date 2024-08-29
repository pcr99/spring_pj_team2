<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/main.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<!-- (3-3-2). 자바스크립트 소스 연결 -->
<!-- defer : 모든 html 파일을 로딩할때까지 html이 브라우저에 표시가 안되는 것을 방지 -->
<script src="${path}/resources/js/customer/main.js" defer></script>
<title>emailChkAction</title>

</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/general/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<!-- 서비스에서 넘어온 값을 받는다. -->
		
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("이메일인증 성공!!");
				window.location='login.ui';
			</script>
		</c:if>	
		
		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
				alert("이메일인증 실패!!");
				window.location='login.ui';
			</script>
	    </c:if>	
		
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/common/general/footer.jsp" %>
		<!-- footer 끝 -->
	</div>	
	
</body>
</html>    