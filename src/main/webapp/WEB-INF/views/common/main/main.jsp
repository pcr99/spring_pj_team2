<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<title>Young-Cha</title>
<!-- script -->
<script type="text/javascript" src="${path}/resources/js/detail.js"></script>
<script type="text/javascript" src="${path}/resources/js/main.js"></script>
<!-- /script -->
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
<main>
	<section class="hero">
        <div class="hero-content-wrapper">
        <c:forEach var ="dto" items ="${p_list}" >
            <div class="hero-content">
            	<a href = "${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
                <img src="${dto.poster}">
                </a>
            </div>
            </c:forEach>
        </div>
        <div class="slider-nav">
            <button id="prev">이전</button>
            <button id="next">다음</button>
        </div>
	</section>
	
<div class="container">
        <section class="content-row">
            <h2>인기 영화</h2>
            <div class="content-cards">
                <c:forEach var="dto" items="${p_list}">
                    <div class="content-card">
                        <a href="${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
                            <img src="${dto.poster}">
                        </a>
                        <div class="card-title">${dto.title}</div>
                    </div>
                </c:forEach>
            </div>
        </section>

    <div class="scroll-container">
        <section class="content-row">
            <h2>최신 영화</h2>
            <div class="content-cards">
                <c:forEach var="dto" items="${l_list}">
                    <div class="content-card">
                        <a href="${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
                            <img src="${dto.poster}">
                        </a>
                        <div class="card-title">${dto.title}</div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>

        <section class="content-row">
            <h2>국내 영화</h2>
            <div class="content-cards">
                <c:forEach var="dto" items="${d_list}">
                    <div class="content-card">
                        <a href="${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
                            <img src="${dto.poster}">
                        </a>
                        <div class="card-title">${dto.title}</div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <section class="content-row">
            <h2>국외 영화</h2>
            <div class="content-cards">
                <c:forEach var="dto" items="${g_list}">
                    <div class="content-card">
                        <a href="${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
                            <img src="${dto.poster}">
                        </a>
                        <div class="card-title">${dto.title}</div>
                    </div>
                </c:forEach>
            </div>
        </section>
</div>
</main>
<footer>
<%@ include file= "/WEB-INF/views/common/general/footer.jsp" %>
</footer>

</body>
</html>