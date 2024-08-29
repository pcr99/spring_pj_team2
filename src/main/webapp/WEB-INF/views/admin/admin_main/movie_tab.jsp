<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/resources/js/admin_movieTab.js"></script>
<link rel="stylesheet" href="${path }/resources/css/admin/header.css">
<link rel="stylesheet" href="${path }/resources/css/admin/main.css">
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>
 <!-- 영화 관리 Tab -->
        <div class="tab-pane fade show active" id="movie-tab-pane" role="tabpanel" aria-labelledby="movie-tab" tabindex="0">
        	<form class="user_table-container">
        	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
                <h3>영화 목록 관리</h3>
                <table class = "user_table">
                	<tr class = "table-top">
                		<th scope = "col">선택</th>
                		<td scope = "col">영화번호</td>
                		<td scope = "col">제목</td>
                		<td scope = "col">감독</td>
                		<td scope = "col">출연진</td>
                		<td scope = "col">장르</td>
                		<td scope = "col">개봉일</td>
                		<td scope = "col">누적관객수</td>
                		<td width = "200px" scope = "col">줄거리</td>
                		<td scope = "col">평점</td>
                		<td scope = "col">포스터</td>
                		<td scope = "col">분류</td>
                	</tr>
                	<c:forEach var="dto" items="${m_list}">
                	<tr class = "table-row">
                		<th scope = "row"><input type = "checkbox" name = "user_row" value = "${dto.mvNo}"></th>
                		<td>${dto.mvNo}</td>
                		<td>${dto.title}</td>
                		<td>${dto.director}</td>
                		<td>${dto.actor}</td>
                		<td>${dto.genre}</td>
                		<td>${dto.releaseDate}</td>
                		<td>${dto.audience}</td>
                		<td><textarea>${dto.content}</textarea></td>
                		<td>${dto.grade}</td>
                		<td><img src="${dto.poster}"></td>
                		<td>${dto.country}</td>
                	</tr>
                	</c:forEach>
                	<tr>
                		<td colspan = "12" align = "center">
	                		<div align="center" class="center">
								<c:if test="${paging.startPage > 10}">
									<a href="${path}/admin_movie.an?pageNum=${paging.prev}">[이전]</a>
								</c:if>
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="${path}/admin_movie.an?pageNum=${num}">${num}</a>
								</c:forEach>
								<c:if test="${paging.endPage < paging.pageCount}">
									<a href="${path}/admin_movie.an?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</div>
                		</td>
                	</tr>
                	<tr>
                		<td colspan = "12" align = "right">
                			<input type = "button" name = "insert" value = "영화등록" onclick="window.location='${path}/add_movie.an'">
                			<input type = "button" name = "modify" value = "영화수정" onclick="modifyMovie()">
                			<input type = "button" name = "delete" value = "영화삭제" onclick="deleteMovie()">
                		</td>
                	</tr>
                </table>
            </form>
		</div>
</body>
</html>