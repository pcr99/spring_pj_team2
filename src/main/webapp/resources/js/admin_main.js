/**
 * 
 */
 
 document.addEventListener('DOMContentLoaded', function() { 													//addEventListener : 이벤트발생 함수 ,  DOMContentLoaded : 브라우저가 HTML을 전부 읽고 DOM 트리를 완성하는 즉시 발생합니다. 이미지 파일(<img>)이나 스타일시트 등의 기타 자원은 기다리지 않습니다.
    const movieRadioButtons = document.querySelectorAll('input[name="movieAction"]');         //querySelectorAll : () 내 해당하는 속성들을 전부 선택하는 함수
    const movieContents = document.querySelectorAll('.movie-content');
    const boardRadioButtons = document.querySelectorAll('input[name="boardAction"]');
    const boardContents = document.querySelectorAll('.board-content');
    
    movieRadioButtons.forEach(radio => {
        radio.addEventListener('change', function() {																			//radio 의 속성이 'change' 될 떄, 
            movieContents.forEach(content => content.style.display = 'none');									//movieContent의 display를 none으로 바꿔 숨김
            const selectedContent = document.getElementById(this.id + 'Content');							//tab에서 선택한 id와 컨텐츠를 selectedContent 상수에 담는다
            if (selectedContent) selectedContent.style.display = 'block';												// selectedContent의 display를 표시로 변경
        });
    });

    boardRadioButtons.forEach(radio => {
        radio.addEventListener('change', function() {
            boardContents.forEach(content => content.style.display = 'none');
            const selectedContent = document.getElementById(this.id + 'Content');
            if (selectedContent) selectedContent.style.display = 'block';
        });
    });
});