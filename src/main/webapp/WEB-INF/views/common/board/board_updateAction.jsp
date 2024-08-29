<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>
<!-- Font Awesome CDN 추가 -->
<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0-beta3/css/all.min.css">
</head>
<body>
	<header>
        <%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
	</header>
   <form name="modifyform" method="post">
		<c:if test="${updateCnt != 0 }">
			<script type="text/javascript">
				alert("수정 성공");
				window.location="${path}/board_list.bc";
			</script>
		</c:if>
		<c:if test="${updateCnt == 0 }">
			<script type="text/javascript">
				alert("수정 실패!");
				window.location="${path}/board_list.bc";
			</script>
		</c:if>
	</form>

</body>
</html>
