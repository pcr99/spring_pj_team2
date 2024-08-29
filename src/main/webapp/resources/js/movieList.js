/**
 * 
 */
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

document.addEventListener('DOMContentLoaded', function() {
    // genreSelect 셀렉트 박스의 옵션들을 가져옵니다
    const genreSelect = document.getElementById('genreSelect');
    
    // genreSelect의 onchange 이벤트를 등록합니다
    genreSelect.addEventListener('change', function() {
        const selectedGenre = genreSelect.value;
        if (selectedGenre) {
            window.location.href = selectedGenre; // 선택한 장르 페이지로 이동
        }
    });

    // 현재 페이지의 URL을 가져옵니다
    const currentUrl = window.location.href;
    
    // genreSelect 셀렉트 박스의 옵션들을 순회하며 현재 페이지의 장르에 해당하는 옵션을 선택합니다
    for (let i = 0; i < genreSelect.options.length; i++) {
        const optionValue = genreSelect.options[i].value;
        if (currentUrl.endsWith(optionValue.substring(optionValue.lastIndexOf('/') + 1))) {
            genreSelect.selectedIndex = i;
            break;
        }
    }
});