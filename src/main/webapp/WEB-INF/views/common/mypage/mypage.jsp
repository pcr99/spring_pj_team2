<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<link rel="stylesheet" href="${path}/resources/css/general/mypage.css">
<script type="text/javascript">
$(function(){
	$('#delete-button').click(function(){
		location.href ="${path}/deleteInfo.ui";
	});
});

$(document).ready(function() {
    // 페이지 로드 시 모든 입력 필드를 비활성화
    $('input[type="text"], input[type="email"], input[type="tel"], input[type="date"]').prop('disabled', true);

    $('#edit-button').click(function(event) {
        event.preventDefault(); // 폼 제출을 막습니다 (AJAX로 처리할 때 필요)
        // 입력 필드를 활성화
        $('input[type="text"], input[type="email"], input[type="tel"], input[type="date"]').prop('disabled', false);
        $(this).val('저장'); // 버튼 텍스트를 '저장'으로 변경
        $(this).off('click'); // 클릭 이벤트 핸들러를 제거하여 중복 클릭 방지

        // 폼 제출 이벤트 핸들러 추가 (필요에 따라 구현)
        $('#userForm').submit();
    });
});
</script>
    <title>마이페이지 - 내 정보 관리</title>
</head>
<body>

<header>
<%@ include file ="/WEB-INF/views/common/general/header.jsp" %>
</header>

<div class="container">
    <fieldset>
        <legend>${user.userName}님 정보</legend>
        <form id="userForm" action="${path}/mypage_update.ui" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="hidden" id="userno" name="userno" value="${dto.userNo}">
            <table>
                <tr>
                    <th><label for="userid">아이디</label></th>
                    <td><input type="text" id="userid" name="userid" value="${user.userId}" readonly></td>
                </tr>
                
                <tr>
                    <th><label for="username">이름</label></th>
                    <td><input type="text" id="username" name="username" value="${user.userName}" ></td>
                </tr>
                <tr>
                    <th><label for="email">이메일</label></th>
                    <td><input type="email" id="email" name="email" value="${user.email}"></td>
                </tr>
                
                <tr>
                    <th><label for="phone">주소</label></th>
                    <td><input type="tel" id="phone" name="phone" value="${user.hp}"></td>
                </tr>
                
                <tr>
                    <th><label for="address">전화번호</label></th>
                    <td><input type="text" id="address" name="address" value="${user.address}"></td>
                </tr>
                
                <tr>
                    <th><label for="birthdate">생년월일</label></th>
                    <td><input type="date" id="birthday" name="birthday" value="${user.birth}"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: center;" class="ss">
                        <input type="submit" id="edit-button" value="정보 수정">
                        <input type="button" id="delete-button" value="회원 탈퇴">
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
</div>

<footer>
<%@ include file ="/WEB-INF/views/common/general/footer.jsp" %>
</footer>


<c:if test="${empty user}">
    사용자 정보를 불러올 수 없습니다.
</c:if>

</body>
</html>
