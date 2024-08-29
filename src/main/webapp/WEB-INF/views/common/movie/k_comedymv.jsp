<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/movie/movieList.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<title>국내영화</title>
<script src="${path}/resources/js/movieList.js"></script>
</head>
<body>

<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
<br><br><br><br>
<main>
	<section class="content-row">
		<h2>코미디 영화</h2>
		<br>
		<div class="select-container">
			<div class="genre-select">
				<select id="genreSelect" onchange="changeGenre(this.value)">
					<option value="${path}/k_mvList.mo">전체 장르</option>
					<option value="${path}/k_horrormv.mo">공포</option>
					<option value="${path}/k_comedymv.mo">코미디</option>
					<option value="${path}/k_actionmv.mo">액션/스릴러</option>
				</select>
			</div>
        	<br><br><br><br>
        	<div class="sort-select">
        		<select id="sortOrder" onchange="sortMovies(this.value)">
        			<option value="title">가나다순 정렬</option>
                    <option value="reverse">가다나 역순 정렬</option>
                </select>
       		</div>
        </div>
		<div id="movie-cards" class="content-cards">
        	<c:forEach var="dto" items="${list}">
            <div class="content-card">
                <a href = "${path}/movie_detailAction.mv?mvNo=${dto.mvNo}">
	                <img src="${dto.poster}" alt="${dto.title}">
	            </a>
                <div class="card-title"> ${dto.title} </div>
            </div>
            </c:forEach>
        </div>
	</section>
</main>


<footer>
<%@ include file= "/WEB-INF/views/common/general/footer.jsp" %>
</footer>

</body>
</html>