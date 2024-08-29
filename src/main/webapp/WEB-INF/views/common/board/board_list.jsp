<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/board/board_list.css">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<title>게시판 목록</title>
</head>
<body>
<!-- header 시작 -->
<header>
<%@ include file="/WEB-INF/views/common/general/header.jsp" %>
</header>	
<!-- header 끝 -->
	<div class="wrap">
		<span class="right">
    		<input type="text" id="search">
    		<input type="button" name="search" class="gradient" value="검색">
		</span>
		<!-- 컨텐츠 시작 -->
		<h1>게시판</h1>

		<span class="right" style="margin-right: 80px;">
    <label>
        <input type="checkbox" id="hideNotices" onclick="toggleNotices()"> 공지 숨기기
    </label>
    <label for="displayCountSelect"></label>
    <select id="displayCountSelect" onchange="updateDisplayCount()">
        <option value="5">5개씩</option>
        <option value="10">10개씩</option>
        <option value="15">15개씩</option>
        <option value="20">20개씩</option>
    </select>
</span>

<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>일시</th>
        <th>조회수</th>
    </tr>
    
    <c:forEach var="dto" items="${list}">
	    <tr class="post">
	        <td class="center">${dto.num}</td>
	        <td class="left"><a href="${path}/board_detailAction.bc?num=${dto.num}">${dto.title}</a></td>
	        <td class="center">${dto.writer}</td>
	        <td class="center">${dto.regDate}</td>
	        <td class="center">${dto.readCnt}</td>   
	    </tr>
    </c:forEach>
</table>
<br>
<div align="center" class="center">
  <c:if test="${paging.startPage > 10}">
    <a href="${path}/board_list.bc?pageNum=${paging.prev}">[이전]</a>
  </c:if>
  <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
    <a href="${path}/board_list.bc?pageNum=${num}">${num}</a>
  </c:forEach>
  <c:if test="${paging.endPage < paging.pageCount}">
    <a href="${path}/board_list.bc?pageNum=${paging.next}">[다음]</a>
  </c:if>
</div>

<span class="right">
    <input type="button" value="목록" class="greylist" onclick="location.href='${path}/board_list.bc'">
    <input type="button" value="글쓰기" class="gradient" onclick="location.href='${path}/board_insert.bc'">
</span>

<script>
    function toggleNotices() {	//체크 삼항연산자
        var checkBox = document.getElementById("hideNotices");
        var notices = document.getElementsByClassName("notice");
        for (var i = 0; i < notices.length; i++) {
            notices[i].style.display = checkBox.checked ? "none" : "table-row";
        }
    }

    function setPostDisplay(limit) { //화면 최대개수
        var rows = document.getElementsByClassName("post");
        for (var i = 0; i < rows.length; i++) {
            rows[i].style.display = i < limit ? "table-row" : "none";
        }
    }

    function updateDisplayCount() {	// 값의 따른 업데이트
        var select = document.getElementById("displayCountSelect");
        var limit = parseInt(select.value);
        setPostDisplay(limit);
    }
</script>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/common/general/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
	
	
</body>
