<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/customer/main.js" defer></script>

<title>댓글 목록</title>
</head>
<body>

	<!-- 우측 화면 시작 -->
	<div id="right">
		<div class="table">
			<form name="boardList">
				<table border="1" width="1000px">
					<tr>
						<th style="width: 10%"> 작성자 </th>
						<th style="width: 15%"> 글내용 </th>
						<th style="width: 10%"> 작성일 </th>										
					</tr>
					<!-- 댓글이 있으면 -->
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.writer}</td>									
							<td>${dto.content}</td>									
							<td>${dto.regDate}</td>									
						</tr>
					</c:forEach>
				</table>	
			</form>
		</div>
	</div>
	<!-- 우측 화면 종료 -->

</body>
</html>
