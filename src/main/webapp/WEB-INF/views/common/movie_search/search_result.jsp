<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>검색 결과</title>
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<link rel="stylesheet" href="${path}/resources/css/general/search.css">
<script type="text/javascript">
    function validateSearch() {
        var searchKeyword = document.getElementById('searchKeyword').value.trim();
        if (searchKeyword === '') {
            alert("검색어를 입력해주세요.");
            return false; 
        }
        return true; 
    }

</script>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/common/general/header.jsp"%>
</header>

<div class="search-result">
    <h2>검색 결과</h2>

    
    <c:choose>
        <c:when test="${not empty searchResult}">
            <ul>
                <c:forEach var="movie" items="${searchResult}">
                    <li style="display: inline-block; padding: 0; margin: 0;">
                        <a href="${path}/movie_detailAction.mv?mvNo=${movie.mvNo}">
                            <img src="${movie.poster}" alt="${movie.title}" class="movie-poster">
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <c:if test="${empty searchResult}">
                <p class="no-result">검색 결과가 없습니다.</p>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

<footer>
    <%@ include file="/WEB-INF/views/common/general/footer.jsp"%>
</footer>

</body>
</html>
