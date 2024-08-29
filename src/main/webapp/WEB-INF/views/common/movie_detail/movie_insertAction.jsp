<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">

<script src="https://kit.fontawesome.com/c1c9e05860.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/detail.js" defer></script>
<title>관리자 - 영화 등록</title>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file ="/WEB-INF/views/common/general/header.jsp" %>
		<!-- header 끝 -->
		<!--------------------------------------------------------------------------------->
		<!-- 컨텐츠 시작 -->
		<c:if test="${insertCnt == 1 }">
						<script type="text/javascript">
							setTimeout(function(){
								alert("영화등록 성공");
								window.location="${path}/main.mv"
							},1000);
						
						</script>
					</c:if>
					
					<c:if test="${insertCnt != 1 }">
						<script type="text/javascript">
							setTimeout(function(){
								alert("영화등록 실패");
								window.location="${path}/movie_insert.mv"
							},1000);
						
						</script>
					</c:if>
		<!-- 컨텐츠 끝 -->
		<!--------------------------------------------------------------------------------->
		<!-- footer 시작 -->
      		<%@ include file ="/WEB-INF/views/common/general/footer.jsp" %>
      	<!-- footer 끝 -->
		<!--------------------------------------------------------------------------------->
	</div>
</body>
</html>
