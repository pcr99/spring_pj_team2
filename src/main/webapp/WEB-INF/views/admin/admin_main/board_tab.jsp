<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL core 라이브러리 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/admin_boardTab.js"></script>
<link rel="stylesheet" href="${path }/resources/css/admin/header.css">
<link rel="stylesheet" href="${path }/resources/css/admin/main.css">
<title>Insert title here</title>
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>
<!-- 게시판 Tab -->
        <div class="tab-pane fade" id="board-tab-pane" role="tabpanel" aria-labelledby="board-tab" tabindex="0">
        	<form class="board_table-container">
        	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
                <h3>사용자 관리</h3>
                <table class="board_table">
                	<tr class="table-top">
                		<th scope="col">선택</th>
                		<td scope="col">글번호</td>
                		<td scope="col">제목</td>
                		<td scope="col">본문</td>
                		<td scope="col">글쓴이</td>
                		<td scope="col">조회수</td>                		
                		<td scope="col">작성일</td>
                		<td scope="col">댓글수</td>
                		<td scope="col">노출여부</td>
                	</tr>
                	<c:forEach var="dto" items="${b_list}">
	                	<tr class="table-row">
	                		<th scope="row"><input type="checkbox" name="user_row" value="${dto.num}"></th>
	                		<td>${dto.num}</td>
	                		<td>${dto.title}</td>
	                		<td>${dto.content}</td>
	                		<td>${dto.writer}</td>
	                		<td>${dto.readCnt}</td>
	                		<td>${dto.regDate}</td>
	                		<td>${dto.comment_count}</td>
	                		<td>${dto.show}</td>
	                	</tr>
                	</c:forEach>
                	<tr>
                		<td colspan = "9" align = "center">
	                		<div align="center" class="center">
								<c:if test="${paging.startPage > 10}">
									<a href="${path}/admin_board.an?pageNum=${paging.prev}">[이전]</a>
								</c:if>
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="${path}/admin_board.an?pageNum=${num}">${num}</a>
								</c:forEach>
								<c:if test="${paging.endPage < paging.pageCount}">
									<a href="${path}/admin_board.an?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</div>
                		</td>
                	</tr>
                	<tr>
                		<td colspan="9" align="right">
                			<input type = "button" name = "add_board" value = "공지글 작성" onclick="window.location='${path}/add_board.an'">
                			<input type="button" name="ban" value="게시글 삭제" onclick="deleteboard()">
                		</td>
                	</tr>
                </table>
            </form>
		</div>
</body>
</html>