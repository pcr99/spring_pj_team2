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
	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
		<c:if test="${resultCnt != 0 }">
			<script type="text/javascript">
				alert("차단에 성공하였습니다.");
				window.location="${path}/admin_manage.an";
			</script>
		</c:if>
		<c:if test="${resultCnt == 0 }">
			<script type="text/javascript">
				alert("차단에 실패하였습니다.");
				window.location="${path}/admin_manage.an";
			</script>
		</c:if>
	</form>
</body>
</html>