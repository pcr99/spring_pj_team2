<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹 -->
<title>글쓰기</title>
<link rel="stylesheet" href="${path}/resources/css/board/board_insert.css">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<!-- Font Awesome CDN 추가 -->
<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0-beta3/css/all.min.css">
<script>
	$(function() {	// 작성 페이지가 로딩되면
		
		// 게시글 작성화면으로 이동
		$('#btnSave').click(function() {
			
			const writer = $('#writer').val();
			const title = $('#title').val();
			const content = $('#content').val();
			
			if(writer == "") {
				alert("작성자를 입력하세요!!");
				$('#writer').focus();
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
			
			document.insertForm.action="${path}/board_insertAction.bc";
			document.insertForm.submit();
		});
	});

</script>

<title>게시판 작성 페이지</title>
</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<header>
		<%@ include file="../../common/general/header.jsp" %>
		</header>	
		<!-- header 끝 -->
		<br><br><br><br>
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center"> 게시판 작성 페이지 </h1>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->
					<!-- 좌측 메뉴 종료 -->
				
					<!-- 우측 화면 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="insertForm" method="post">
							<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
								<table>
									
									<tr>
										<th style="width: 200px" > 작성자 </th>
										<td style="width: 200px; text-align: left">
										<input type="text" class="input" name="writer"
												id="writer" size="50" value="${sessionID}"></td>
									</tr>
									<tr>
										<th style="width: 200px"> 글제목 </th>
										<td colspan="3" style="width:700px; text-align: left"> 
											<input type="text" class="input" name="title"
												id="title" size="50" placeholder="글제목 입력" required>
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
											<br>
											<div align="right">
												<input class="inputButton" type="button" value="작성" id="btnSave">
												<input class="inputButton" type="reset" value="초기화">
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