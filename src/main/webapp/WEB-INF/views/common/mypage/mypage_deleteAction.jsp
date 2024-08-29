<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">
<link rel="stylesheet" href="${path}/resources/css/general/mypage.css">

<script src="https://kit.fontawesome.com/c1c9e05860.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/customer/main.js" defer></script>
<title>관리자 - 상품수정</title>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<!-- header 끝 -->
		<!--------------------------------------------------------------------------------->
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
		
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
				
				
					    <!-- 우측 화면 시작 -->
               <c:if test="${deleteCnt == 1}">
                  <script type="text/javascript">
                     setTimeout(function() {
                        alert("탈퇴 성공");
                        window.location="${path}/main.mv";
                     },1000); 
                  </script>
               </c:if>
               
               <c:if test="${deleteCnt != 1}">
                  <script type="text/javascript">
                     setTimeout(function() {
                        alert("탈퇴 실패");
                        window.location="${path}/mypage.ui";
                     },1000); 
                  </script>
               </c:if>
               <!-- 우측 화면 종료 -->
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		<!--------------------------------------------------------------------------------->
		<!-- footer 시작 -->
      	<!-- footer 끝 -->
		<!--------------------------------------------------------------------------------->
	</div>
</body>
</html>