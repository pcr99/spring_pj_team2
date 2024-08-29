<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 목록</title>
    <link rel="stylesheet" href="${path}/resources/css/general/header.css">
    <link rel="stylesheet" href="${path}/resources/css/general/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/general/contents.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="/WEB-INF/views/common/general/header.jsp" />
        <div id="container">
            <div id="contents">
                <h1>영화 목록</h1>
                <c:forEach var="movie" items="${movieList}">
                    <div class="movie-item">
                        <a href="${path}/movie_detail?id=${movie.movieId}">
                            <img src="${path}${movie.mvImg}" alt="${movie.mvName}">
                        </a>
                        <p>${movie.mvName}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/common/general/footer.jsp" />
    </div>
</body>
</html>
