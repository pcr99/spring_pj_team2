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
<link rel="stylesheet" href="${path}/resources/css/board/board_edit.css">

<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/customer/main.js" defer></script>

<script>
	$(function() {	// 수정 페이지가 로딩되면
		
		// 게시글 목록버튼 클릭시 컨트롤러의 목록으로 이동
		$('#btnList').click(function() {
			location.href="${path}/board_list.bc";
		});
	
		// 게시글 수정화면으로 이동
		$('#btnEdit').click(function() {
			
			const password = $('#password').val();
			const title = $('#title').val();
			const content = $('#content').val();
			
			if(password == "") {
				alert("비밀번호를 입력하세요!!");
				$('#password').focus();
				return false;
			}
			
			if(title == "") {
				alert("게시글 제목을 입력하세요!!");
				$('#title').focus();
				return false;
			}
			
			if(content == "") {
				alert("게시글 내용을 입력하세요!!");
				$('#content').focus();
				return false;
			}
			
			document.editForm.action="${path}/board_updateAction.bc";
			document.editForm.submit();
		});
	
		// 게시글 삭제화면으로 이동
		$('#btnDelete').click(function() {
			if(confirm("삭제하시겠습니까?")) {
				document.editForm.action="${path}/board_deleteAction.bc";
				document.editForm.submit();
			}
		});
	});

</script>

<title>게시판 수정 삭제페이지</title>
</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="../../common/general/header.jsp" %>
			
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center"> 게시판 수정 삭제페이지 </h1>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->
					<!-- 좌측 메뉴 종료 -->
				
					<!-- 우측 화면 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="editForm" method="post">
								<table>
									<tr>
										<th style="width: 200px"> 글번호 </th>
										<td style="width: 200px; text-align: center"> ${dto.num} </td>
										
										<th style="width: 200px"> 조회수 </th>
										<td style="width: 200px; text-align: center"> ${dto.readCnt} </td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 작성자 </th>
										<td style="width: 200px; text-align: center"> ${dto.writer} </td>
										
										<th style="width: 200px"> 비밀번호 </th>
										<td style="width: 200px; text-align: center"> 
											<input style="width: 200px" type="password" class="input" name="password"
												id="password" size="30" placeholder="비밀번호 입력" required autofocus>
										</td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 글제목 </th>
										<td colspan="3" style="text-align: center"> 
											<input type="text" class="input" name="title"
												id="title" size="50" placeholder="글제목 입력" value="${dto.title}" required>
										</td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 글내용 </th>
										<td colspan="3" style="text-align: center">
											<textarea rows="5" cols="93" name="content" id="content"> ${dto.content} </textarea> 
										</td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 작성일 </th>
										<td colspan="3" style="text-align: center"> ${dto.regDate} </td>
									</tr>
									
									<tr>
										<td colspan="4">
											<br>
											<div align="right">
												<!-- 게시글번호 hidden 추가 -->
												<input type="hidden" name="hidden_num" value="${dto.num}"> <!-- input이 없으므로 -->
												<input class="inputButton" type="button" value="수정" id="btnEdit">
												<input class="inputButton" type="button" value="삭제" id="btnDelete">
												<input class="inputButton" type="button" value="목록" id="btnList">
											</div>
										</td>
									</tr>
									
									
								</table>										
							</form>
						</div>
					</div>
					<!-- 우측 화면 종료 -->
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 시작 -->
		<%@ include file="../../common/general/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>