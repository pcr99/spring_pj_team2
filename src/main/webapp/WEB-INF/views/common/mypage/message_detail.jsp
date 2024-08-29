<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/general/header.css">
<link rel="stylesheet" href="${path }/resources/css/general/message.css">
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
	<form class="wrap" name="detailForm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table>
			<tr>
				<th style="width: 200px"> 번호 </th>
				<td style="width: 200px; text-align: center"> ${dto.messageNo} </td>
			</tr>
			<tr>
				<th style="width: 200px"> 글제목 </th>
				<td colspan="3" style="text-align: center"> ${dto.messageTitle}  </td>
			</tr>
			<tr>
				<th style="width: 200px"> 글내용 </th>
				<td colspan="3" style="text-align: center"> ${dto.messageContent} </td>
			</tr>
			<tr>
				<td colspan="4">
					<br>
					<div align="right">
						<!-- 게시글번호 hidden 추가 -->
						<input class="inputButton" type="button" value="목록" id="btnList">
					</div>
				</td>
			</tr>
	</table>	
<footer>
<%@ include file= "/WEB-INF/views/common/general/footer.jsp" %>
</footer>
</form>
</body>
</html>