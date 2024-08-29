/**
 * 
 */
function edit(){
	document.getElementById('edit-button').onclick = function () {
    document.getElementById('passwordModal').style.display = 'block';
    document.getElementById('verify-password').value = ''; // 비밀번호 검증창 초기화
    document.getElementById('verify-password').removeAttribute('readonly');
    document.getElementById('verify-password').style.pointerEvents = 'auto';
    document.getElementById('verify-password').focus(); // 비밀번호 입력창에 포커스
    }
}


document.getElementById('closeModal').onclick = function edit() {
    document.getElementById('passwordModal').style.display = 'none';
}

window.onclick = function edit (event) {
    if (event.target == document.getElementById('passwordModal')) {
        document.getElementById('passwordModal').style.display = 'none';
    }
}

function verifyPassword() {
    var inputPassword = document.getElementById('verify-password').value;
    var actualPassword = document.getElementById('password').value;
    if (inputPassword === actualPassword) {
        document.getElementById('passwordModal').style.display = 'none';
        document.querySelectorAll('input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="password"]').forEach(function(input) {
            input.removeAttribute('readonly');
            input.style.backgroundColor = 'white';
            input.style.pointerEvents = 'auto';
        });
        document.getElementById('save-row').style.display = '';
    } else {
        alert('비밀번호가 일치하지 않습니다.');
    }
}

function save(){
	document.getElementById('save-button').onclick = function() {
    alert('정보가 변경되었습니다.');
    document.querySelectorAll('input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="password"]').forEach(function(input) {
        input.setAttribute('readonly', 'readonly');
        input.style.backgroundColor = '#f0f0f0';
        input.style.pointerEvents = 'none';
    });
    document.getElementById('save-row').style.display = 'none';
}
}

