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
<title>국외영화</title>
</head>
<body>

	<header>
	<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
	</header>
<br><br><br><br>
<main>
	<section class="content-row">
		<h2>국외영화</h2>
		<br>
		<div class="genre-buttons">
			<button class="genre-btn" onclick="window.location='${path}/f_mvList.mo'">전체</button>
			<button class="genre-btn" onclick="window.location='${path}/f_sfmv.mo'">SF</button>
			<button class="genre-btn" onclick="window.location='${path}/f_heromv.mo'">히어로</button>
			<button class="genre-btn" onclick="window.location='${path}/f_actionmv.mo'">액션/스릴러</button>
		</div>
		<div class="sort-buttons">
			<button class="sort-btn" data-order="title" onclick="sortMovies('title')">제목순 정렬</button>
			<button class="sort-btn" data-order="reverse" onclick="sortMovies('reverse')">역제목순 정렬</button>
		</div>
		<div id="movie-cards" class="content-cards">
        	<c:forEach var="dto" items="${list}">
            <div class="content-card">
                <a href="window.location='${path}/movie_detailAction.mv?mvNo=${dto.mvNo}'"><img src="${dto.poster}" alt="${dto.title}"></a>
                <div class="card-title"> ${dto.title} </div>
                <button class="add-to-collection-btn" onclick="addToCollection('${dto.title}', '${dto.poster}')">+</button>
            </div>
            </c:forEach>
        </div>
	</section>
</main>

<footer>
	<%@ include file= "/WEB-INF/views/common/general/footer.jsp" %>
</footer>

<script>
// Your JavaScript code
// Array to store selected movies
let myCollection = JSON.parse(localStorage.getItem('myCollection')) || [];

// Function to add movie to collection
function addToCollection(title, posterUrl) {
    // Check if the movie is already in the collection
    const exists = myCollection.some(movie => movie.title === title);
    
    if (!exists) {
        myCollection.push({ title, posterUrl });
        localStorage.setItem('myCollection', JSON.stringify(myCollection));
        alert(`${title}을(를) 컬렉션에 추가했습니다!`);
    } else {
        alert(`${title}은(는) 이미 컬렉션에 있습니다.`);
    }
}

function sortMovies(order) {
    const container = document.getElementById('movie-cards');
    let cards = Array.from(container.getElementsByClassName('content-card'));
    
    if (order === 'title') {
        cards.sort((a, b) => {
            const titleA = a.querySelector('.card-title').textContent.trim();
            const titleB = b.querySelector('.card-title').textContent.trim();
            return titleA.localeCompare(titleB);
        });
    } else if (order === 'reverse') {
        cards.sort((a, b) => {
            const titleA = a.querySelector('.card-title').textContent.trim();
            const titleB = b.querySelector('.card-title').textContent.trim();
            return titleB.localeCompare(titleA);
        });
    }
    
    container.innerHTML = '';
    cards.forEach(card => container.appendChild(card));
}
</script>

</body>
</html>
