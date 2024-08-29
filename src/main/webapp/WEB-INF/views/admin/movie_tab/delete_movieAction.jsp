<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="modifyform" method="post">
		<c:if test="${resultCnt != 0 }">
			<script type="text/javascript">
				alert("영화가 정상적으로 삭제되었습니다.");
				window.location="${path}/admin_movie.an";
			</script>
		</c:if>
		<c:if test="${resultCnt == 0 }">
			<script type="text/javascript">
				alert("영화 삭제에 실패하였습니다.");
				window.location="${path}/admin_movie.an";
			</script>
		</c:if>
	</form>
</body>
</html>