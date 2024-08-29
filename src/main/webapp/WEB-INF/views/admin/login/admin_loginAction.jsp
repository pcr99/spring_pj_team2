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
		<c:if test="${sessionID != null }">
			<script type="text/javascript">
				window.location="${path}/admin_main.an";
			</script>
		</c:if>
		<c:if test="${sessionID == null }">
			<script type="text/javascript">
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				window.location="${path}/admin_login.an";
			</script>
		</c:if>
	</form>
</body>
</html>