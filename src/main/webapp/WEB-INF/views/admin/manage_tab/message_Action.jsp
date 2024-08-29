<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${path}/resources/js/admin_manageTab.js" defer></script>
<title>Insert title here</title>
</head>
<body>
	<form name="modifyform" method="post">
	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
		<c:if test="${resultCnt != 0 }">
			<script type="text/javascript">
				alert("쪽지를 성공적으로 전달하였습니다.");
				window.location="${path}/admin_manage.an";
			</script>
		</c:if>
		<c:if test="${resultCnt == 1 }">
			<script type="text/javascript">
				alert("쪽지 전송 실패");
				window.location="${path}/admin_manage.an";
			</script>
		</c:if>
	</form>
</body>
</html>