/**
 * 
 */

function unblockUser() {
    const unblock = document.querySelectorAll('input[name="user_row"]:checked');

    if (unblock.length === 0) {
        alert('사용자를 선택하세요.');
        return false;
    }

    let userIds = [];
    for (let i = 0; i < unblock.length; i++) {
        userIds.push(unblock[i].value); // 배열에 값 추가
    }

    // 선택된 사용자 ID를 URL 파라미터로 변환
    const userIdsParam = userIds.map(id => `userIds=${encodeURIComponent(id)}`).join('&');

    // 서버로 이동할 URL 생성
    const url = `unblockUser.an?${userIdsParam}`;

    // 생성된 URL로 이동
    window.location.href = url;
}

function blockUser() {
    const block = document.querySelectorAll('input[name="user_row"]:checked');

    if (block.length === 0) {
        alert('사용자를 선택하세요.');
        return false;
    }

    let userIds = [];
    for (let i = 0; i < block.length; i++) {
        userIds.push(block[i].value); // 배열에 값 추가
    }

    // 선택된 사용자 ID를 URL 파라미터로 변환
    const userIdsParam = userIds.map(id => `userIds=${encodeURIComponent(id)}`).join('&');

    // 서버로 이동할 URL 생성
    const url = `blockUser.an?${userIdsParam}`;

    // 생성된 URL로 이동
    window.location.href = url;
}

function messageUser() {
    const message = document.querySelectorAll('input[name="user_row"]:checked');

    if (message.length === 0) {
        alert('사용자를 선택하세요.');
        return false;
    }

    let userIds = [];
    for (let i = 0; i < message.length; i++) {
        userIds.push(message[i].value); // 배열에 값 추가
    }

    // 선택된 사용자 ID를 URL 파라미터로 변환
    const userNosParam = userIds.map(id => `userNos=${encodeURIComponent(id)}`).join('&');

    // 서버로 이동할 URL 생성
    const url = `messagingUser.an?${userNosParam}`;

    // 생성된 URL로 이동
    window.location.href = url;
}
