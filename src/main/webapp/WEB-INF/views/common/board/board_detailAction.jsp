<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!-- JSTL core 라이브러리 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/board/board_detailAction.css">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<script>
	$(function() {   // 상세페이지가 로딩되면
		// 댓글목록 자동호출
		comment_list();
		// 댓글쓰기 버튼 클릭(1)
		$('#btnCommentSave').click(function() {
			comment_add();
		});
		// 게시글 수정 버튼 클릭시 게시글 수정 화면으로 이동(컨트롤러의 패스워드 체크 후)
		$('#btnEdit').click(function() {
			if(confirm("수정하시겠습니까?")) {
					document.detailForm.action="${path}/board_update.bc";
			        document.detailForm.submit();
		    } 
		});
		// 게시글 삭제화면으로 이동
		$('#btnDelete').click(function() {
		    if(confirm("삭제하시겠습니까?")) {
		        document.detailForm.action="${path}/board_deleteAction.bc";
		        document.detailForm.submit();
		    } 
		});
		// 게시글 목록버튼 클릭시 컨트롤러의 목록으로 이동
		$('#btnList').click(function() {
			location.href="${path}/board_list.bc";
		});
	});
	// 댓글쓰기 버튼 클릭
	function comment_add() {  //(2)
		//alert('comment_add()');
		// 게시글번호, 댓글작성, 댓글내용을 파라미터로 넘김
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url: '${path}/comment_insert.bc',  // 컨트롤러로 이동(3)
			type: 'POST',
			beforeSend: function(xhr){
	             xhr.setRequestHeader(header, token);
	         },
			data: {
				"board_num" : ${dto.num},   
				//key: value => 댓글번호: 게시글번호
				"writer" : $('#writer').val(),
				"content" : $('#content').val()
				},
			success: function() {  // 콜백함수(6) => 댓글쓰기가 완료되면 서버에서 콜백함수 호출
				$('#writer').val("");
				$('#content').val("");
				comment_list();   // 댓글목록 새로고침(7)
			},
			error: function(){
				alert('comment_add() 오류');
			}
		});
	}
	
	// 자동으로 댓글목록 호출
	function comment_list() {  // (8)
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		// alert("comment_list()");
		$.ajax({
			url: '${path}/comment_list.bc',   // 컨트롤러로 이동(9)
		 	type: 'POST',
		 	data: 'board_num=${dto.num}',
		 	beforeSend: function(xhr){
	             xhr.setRequestHeader(header, token);
	         },
		 	// 서버에서 콜백함수 호출 : result는 comment_list.jsp(컨트롤러에서 넘긴)
		 	success: function(result) {  // (13)
		 		// div id가 commentList자리에 리스트페이지 출력
		 		$('#commentList').html(result);
		 	},
		 	error: function() {
		 		alert('comment_list() 오류');
		 	}
		});
	}
</script>
<title>게시판 상세페이지</title>
</head>
<body>
<!-- header 시작 -->
<header>
	<%@ include file="/WEB-INF/views/common/general/header.jsp"%>
</header>
<!-- header 끝 -->
	<div class="wrap">
		<br>
		<br>
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center"> 게시판 상세페이지 </h1>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->
					<!-- 좌측 메뉴 종료 -->
				
					<!-- 우측 화면 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="detailForm" method="post">
							<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
								<table>
									<tr>
										<th style="width: 200px"> 글번호 </th>
										<td style="width: 200px; text-align: center"> ${dto.num} </td>
										
										<th style="width: 200px"> 조회수 </th>
										<td style="width: 200px; text-align: center"> ${dto.readCnt} </td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 작성자 </th>
										<td style="width: 200px; text-align: center" name = "writer" value = "${dto.writer}"> ${dto.writer} </td>
										
									</tr>
									
									<tr>
										<th style="width: 200px"> 글제목 </th>
										<td colspan="3" style="text-align: center"> ${dto.title}  </td>
									</tr>
									
									<tr>
										<th style="width: 200px"> 글내용 </th>
										<td colspan="3" style="text-align: center"> ${dto.content} </td>
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
												<input type="hidden" name="hidden_num" value="${dto.num}">  <!-- input이 없으므로 -->
												<input class="inputButton" type="button" value="수정" id="btnEdit">
												<input class="inputButton" type="button" value="삭제" id="btnDelete">
												<input class="inputButton" type="button" value="목록" id="btnList">
											</div>
										</td>
									</tr>
								</table>	
								
								<br><br>
								
								<!-- 댓글 목록 코드 -->
								<div id="commentList" align="center">
									<!-- 댓글목록-->
								</div>
								
								<br><br>
								
								<!-- 댓글 입력 코드 -->
								<table>
									<tr>
										<th style="width: 300px"> 댓글작성자 </th>
										<td style="width: 200px; text-align: left">
											<input style="width: 250px" type="text" class="input"
												name="writer" id="writer" size="30" placeholder="작성자 입력">
										</td>
										
										<th style="width: 40px" rowspan="2" align="right"> 
											<center><input type="button" class="inputButton" value="작성" id="btnCommentSave"></center> 
										</th>
									</tr>
									
									<tr>
										<th style="width: 300px"> 글내용 </th>
										<td style="width: 170px; text-align: center">
											<textarea rows="5" cols="93" name="content" id="content" placeholder="글내용 입력"></textarea> 
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
	</div> <!-- 컨텐츠 끝 --> <!-- footer 시작 --> 
	<footer>
		<%@ include file="/WEB-INF/views/common/general/footer.jsp"%>
	</footer> <!-- footer 끝 -->

</body>
</html>
