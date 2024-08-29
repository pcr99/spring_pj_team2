<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/admin/header.css">
<link rel="stylesheet" href="${path }/resources/css/admin/boardTab.css">
<title>Insert title here</title>
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>
<div class="table">
	<form name="insertForm" action= "board_addAction.an"method="post">
	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
		<table>
			<tr>
				<th style="width: 200px" > 작성자 </th>
				<td style="width: 200px; text-align: left">${sessionID }<input type = "hidden" value = "${sessionID }" name = "adminId"> </td>
			</tr>
			<tr>
				<th style="width: 200px"> 글제목 </th>
				<td colspan="3" style="width:700px; text-align: left">
					<input type="text" class="input" name="title" id="title" size="50" placeholder="글제목 입력" required>
				</td>
			</tr>
			<tr>
				<th style="width: 200px"> 글내용 </th>
				<td colspan="3" style="text-align: left">
					<textarea rows="5" cols="90" name="content" id="content"> </textarea> 
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div align="right">
						<input class="inputButton" type="submit" value="작성">
						<input class="inputButton" type="reset" value="초기화">
					</div>
				</td>
			</tr>
		</table>										
	</form>
</div>
</body>
</html>