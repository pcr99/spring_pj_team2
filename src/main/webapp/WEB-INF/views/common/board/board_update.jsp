<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기</title>
<link rel="stylesheet" href="${path }/resources/css/board/board_detailAction.css">
<link rel="stylesheet" href="${path }/resources/css/general/header.css">
<!-- Font Awesome CDN 추가 -->
<script src="https://kit.fontawesome.com/b435fbc087.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0-beta3/css/all.min.css">
</head>
<script>
$(function() {	
		
		// 게시글 목록버튼 클릭시 컨트롤러의 목록으로 이동
		$('#btnList').click(function() {
			location.href="${path}/board_list.bc";
		});
	
		
		$('#btnEdit').click(function() {
			alert('수정');
			document.detailForm.action="${path}/board_updateAction.bc";
			document.detailForm.submit();
		});
	
		$('#btnDelete').click(function() {
			if(confirm("삭제하시겠습니까?")) {
				document.detailForm.action="${path}/board_deleteAction.bc";
				document.detailForm.submit();
			}
		});
	});
</script>
<body>
<header>
<%@ include file="/WEB-INF/views/common/general/header.jsp"%>
</header>
	<h1>글 수정 페이지</h1>
	<br>

	<!-- 글쓰기 폼 시작 -->
	<div id="right">
		<div class="table_div">
			<form name="detailForm" method="post">
			<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
				<table>
					<tr>
						<th style="width: 200px">글번호<input type="hidden" name="num" value="${dto.num}"></th>
						<td style="width: 200px; text-align: center">${dto.num}</td>
					</tr>
					<tr>
						<th style="width: 200px">작성자</th>
						<td style="width: 200px; text-align: center">	${dto.writer}</td>
					</tr>

					<tr>
						<th style="width: 200px">글제목</th>
						<td >
						<input style="width: 200px" type="text" class="input" name="title"
						id="title" size="100" value="${dto.title}" required autofocus>
						</td>
					</tr>

					<tr>
						<th style="width: 200px">글내용</th>
						<td >
						<textarea rows="5" cols="90" name="content" id="content">
						${dto.content}
						</textarea>
						</td>
					</tr>

					<tr>
						<th style="width: 200px">작성일</th>
						<td colspan="3" style="text-align: center">${dto.regDate}</td>
					</tr>

					<tr>
						<td colspan="4">
								<!-- input이 없으므로 -->
								<input class="inputButton" type="button" value="수정" id="btnEdit"> 
								<input class="inputButton"
									type="button" value="목록" id="btnList">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
</body>
</html>
