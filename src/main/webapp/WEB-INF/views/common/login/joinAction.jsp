<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/common/header.css">
<link rel="stylesheet" href="${path }/resources/css/common/join.css">
<title>Insert title here</title>
</head>
<body>
	<div class = "wrap">
		<!-- header 시작 -->
		<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
		<!-- header 끝 -->
		<!-- contents 시작 -->
		
		<c:if test="${insertCnt == 1 }">
			<script type = "text/javascript">
				alert("회원가입 성공!!");
				window.location = '${path}/login.ui';
			</script>
		</c:if>
		<c:if test="${insertCnt != 1 }">
			<script type = "text/javascript">
				alert("회원가입 실패!!");
				window.location = '${path}/join.ui';
			</script>
		</c:if>
	</div>
</body>
</html>