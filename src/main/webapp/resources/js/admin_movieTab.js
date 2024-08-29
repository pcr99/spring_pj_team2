/**
 * 
 */


function modifyMovie() {
    const selectedMovies = document.querySelectorAll('input[name="user_row"]:checked');
    if (selectedMovies.length === 0) {
        alert('수정할 영화를 선택하세요.');
        return false;
    }
    if (selectedMovies.length > 1) {
        alert('하나의 영화만 선택할 수 있습니다.');
        return false;
    }

    // 선택된 첫 번째 요소의 값을 가져옴
    let movie = selectedMovies[0].value;

    // 서버로 이동할 URL 생성
    const url = `admin_movieDetail.an?movieNo=${movie}`;

    // 생성된 URL로 이동
    window.location.href = url;
}

function deleteMovie() {
    const selectedMovies = document.querySelectorAll('input[name="user_row"]:checked');
    if (selectedMovies.length === 0) {
        alert('삭제할 영화를 선택하세요.');
        return false;
    }

    // 선택된 첫 번째 요소의 값을 가져옴
    let movie = selectedMovies[0].value;

    // 서버로 이동할 URL 생성
    const url = `admin_deleteMovie.an?movieNo=${movie}`;

    // 생성된 URL로 이동
    window.location.href = url;
}
