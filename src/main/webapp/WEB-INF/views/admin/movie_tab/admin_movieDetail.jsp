<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/admin/header.css">
<link rel="stylesheet" href="${path }/resources/css/admin/movieTab.css">
</head>
<body>

<header>
<%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>

                <!-- 영화 수정 -->
                <div id="modifyMovieContent" class="movie-content">
                    <h3>영화 수정</h3>
                    <form action="admin_modifyAction.an"  name="modifyMovieform" id="modifyMovieform" method="post" onsubmit = "return signInCheck()" enctype="multipart/form-data">
                    <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
                        <div class="mb-3">
                            <label for="movieNo" class="form-label">영화번호</label>
                            <input type="text" class="form-control" id="mvNo" name="mvNo" value="${dto.mvNo}" placeholder="지정하지 않을 경우 자동으로 입력">
                        </div>
                        <div class="mb-3">
                            <label for="movieTitle" class="form-label">영화 제목</label>
                            <input type="text" class="form-control" id="title" name="title" value="${dto.title}" placeholder="영화 제목">
                        </div>
                        <div class="mb-3">
                            <label for="movieContent" class="form-label">영화 줄거리</label>
                            <textarea rows = "5" cols = "77" id="content" name="content" placeholder="영화 줄거리">${dto.content}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="movieDirector" class="form-label">감독</label>
                            <input type="text" class="form-control" id="director" name="director" value="${dto.director}" placeholder="감독">
                        </div>
                        <div class="mb-3">
                            <label for="movieActor" class="form-label">출연자</label>
                            <input type="text" class="form-control" id="actor" name="actor" value="${dto.actor}" placeholder="출연자">
                        </div>
                        <div class="mb-3">
                            <label for="movieImage" class="form-label">포스터</label>
                            <input type="file" class="form-control" id="poster" name="poster" value="${dto.poster}"placeholder="포스터">
                        </div>
                        <div class="mb-3">
                            <label for="movieGenre" class="form-label">장르</label>
                            <input type="text" class="form-control" id="genre" name="genre" value="${dto.genre}" placeholder="장르">
                        </div>
                        <div class="mb-3">
                            <label for="movieWatcher" class="form-label">누적관객수</label>
                            <input type="text" class="audience" id="audience" name="audience" value="${dto.audience}" placeholder="누적관객수">
                        </div>
                        <div class="mb-3">
                            <label for="movieYear" class="form-label">개봉 연도</label>
                            <input type="date" class="form-control" id="releaseDate" name="releaseDate" value="${dto.releaseDate}" placeholder="개봉 연도">
                        </div>
                        <div class="mb-3">
                            <label for="movieRate" class="form-label">평점</label>
                            <input type="text" class="form-control" id="grade" name="grade" value="${dto.grade}" placeholder="평점">
                        </div>
                        <div class="mb-3">
                            <label for="movieCountry" class="form-label">국내,외 분류</label>
                            <input type="text" class="form-control" id="country" name="country" value="${dto.country}" placeholder="국내 or 국외">
                        </div>
                        <button type="submit" class="inputbutton">확인</button>
                        <button type="button" class="returnbutton" onclick = "window.location='${path}/admin_movie.an'">뒤로</button>
                    </form>
                </div>
</body>
</html>