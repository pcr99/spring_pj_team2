<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">

<script src="https://kit.fontawesome.com/c1c9e05860.js" crossorigin="anonymous"></script>
<script src="${path}/resources/js/detail.js" defer></script>
<script>
$(function(){ // 수정 페이지가 로딩되면
	
	// 게시글 작성 버튼 클릭 시 화면 이동
	$('#btnSave').click(function(){
		
		const mvName = $('#mvName').val();
		const mvContent = $('#mvContent').val();
		const mvDirector = $('#mvDirector').val();
		const mvActor= $('#mvActor').val();
		
		if(mvName == ""){
			alert("제목을 입력하세요.");
			$('#mvName').focus();
			return false;
		}
		
		else if(mvContent == ""){
			alert("줄거리를 입력하세요.");
			$('#mvContent').focus();
			return false;
		}
		
		else if(mvDirector == ""){
			alert("감독을 입력하세요.");
			$('#mvDirector').focus();
			return false;
		}
		
		else if(mvActor == ""){
			alert("배우를 입력하세요.");
			$('#mvActor').focus();
			return false;
		}
		
		document.movie_insert.action = "${path}/movie_insertAction.mv";
		document.movie_insert.submit();
	});
});
</script>
<title>관리자 - 영화 등록</title>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file ="/WEB-INF/views/common/general/header.jsp" %>
		<!-- header 끝 -->
		<!--------------------------------------------------------------------------------->
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
			<!-- 상단 중앙1 시작 -->
				<div id="section1">
					<h1 align="center">영화 등록</h1>
				</div>
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
				
				
					<!-- 우측 화면 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="movie_insert" action="movie_insertAction.mv" method="post" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<table>									
									<tr>
										<th> * 영화제목 </th>
										<td>
											<input type="text" class="input" name="mvName" id="mvName" size="40" placeholder="영화 제목 작성" required>
										</td>
									</tr>
									
									<tr>
										<th> * 영화 포스터 </th>
										<td>
											<input type="file" class="input" name="mvImg" id="mvImg" accept="image/*">
										</td>
									</tr>
									
									<tr>
										<th> * 영화 장르 </th>
										<td align="left">
											<select class="input" name="mvGenre" id="mvGenre" required>
												<option value="액션">액션</option>
												<option value="공포">공포</option>
												<option value="스릴러">스릴러</option>
												<option value="히어로">히어로</option>
												<option value="SF">SF</option>
												<option value="코미디">코미디</option>
												<option value="판타지">판타지</option>
												<option value="드라마">드라마</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th> * 줄거리</th>
										<td>
											<textarea rows="5" cols="77" name="mvContent" id="mvContent" placeholder="줄거리 작성" required></textarea>
										</td>
									</tr>
									
									<tr>
										<th> * 영화 감독 </th>
										<td>
											<input type="text" class="input" name="mvDirector" id="mvDirector" size="10" placeholder="감독 작성" required>
										</td>
									</tr>
									
									<tr>
										<th> * 출연 배우 </th>
										<td>
											<input type="text" class="input" name="mvActor" id="mvActor" size="10" placeholder="배우 작성" required>
										</td>
									</tr>
									
									<tr>
										<th> 관객수 </th>
										<td>
											<input type="text" class="input" name="mvAudience" id="mvAudience" size="10" placeholder="관객수 작성" required>
										</td>
									</tr>
									
									<tr>
										<th> 평점 </th>
										<td>
											<input type="text" class="input" name="mvGrade" id="mvGrade" size="10" placeholder="평점 작성" required>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<br>
											<div align="center">
												<input class="inputButton" type="button" id="btnSave" value="영화 등록">
												<input class="inputButton" type="reset" value="초기화">
												<input class="inputButton" type="button" value="영화 목록" onclick="window.location='ad_product_list.pd'">
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
		<!--------------------------------------------------------------------------------->
		<!-- footer 시작 -->
      		<%@ include file ="/WEB-INF/views/common/general/footer.jsp" %>
      	<!-- footer 끝 -->
		<!--------------------------------------------------------------------------------->
	</div>
</body>
</html>
