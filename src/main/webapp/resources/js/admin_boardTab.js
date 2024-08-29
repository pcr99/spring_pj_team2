/**
 * 
 */


function deleteboard() {
     const selectedBoard = document.querySelectorAll('input[name="user_row"]:checked');
     if (selectedBoard.length === 0) {
         alert('게시글을 선택하세요.');
         return false;
     }

     let boards = [];
     for (let i = 0; i < selectedBoard.length; i++) {
    	 boards.push(selectedBoard[i].value); // 배열에 값 추가
     }

     // 선택된 사용자 ID를 URL 파라미터로 변환
     const userIdsParam = boards.map(no => `boardNo=${encodeURIComponent(no)}`).join('&');

     // 서버로 이동할 URL 생성
     const url = `delete_board.an?${userIdsParam}`;

     // 생성된 URL로 이동
     window.location.href = url;
}
