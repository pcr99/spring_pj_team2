<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/resources/css/general/header.css">
    <link rel="stylesheet" href="${path}/resources/css/general/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/general/mypages.css">
    <title>마이페이지 - 내 정보 관리</title>
  
</head>
<body>

<header>
<%@ include file ="/WEB-INF/views/common/general/header.jsp" %>
</header>
<div class="container">
    <fieldset>
        <legend> ${user.userName}님 정보</legend>
        <form id="userForm" action="${path}/mypage_updateAction.ui" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <table>
            <tr>
                <th><label for="username">아이디</label></th>
                <td><input type="text" id="userid" name="userid" value="${user.userId}" readonly></td>
            </tr>
            
            <tr>
                    <th><label for="username">이름</label></th>
                    <td><input type="text" id="username" name="username" value="${user.userName}" ></td>
                </tr>
            <tr>
                <th><label for="email">이메일</label></th>
                <td><input type="text" id="email" name="email" value="${user.email}" ></td>
            </tr>
            
            <tr>
                    <th><label for="phone">주소</label></th>
                    <td><input type="tel" id="hp" name="hp" value="${user.hp}"></td>
                </tr>
                
                <tr>
                    <th><label for="address">전화번호</label></th>
                    <td><input type="text" id="address" name="address" value="${user.address}"></td>
                </tr>
            <tr>
                <th><label for="birthdate">생년월일</label></th>
                <td><input type="date" id="birthday" name="birthday" value="${user.birth}" ></td>
            </tr>
            
            <tr>
                <td colspan="2" style="text-align: center;" class="ss">
                    <input type="submit" id="edit-button" value="수정완료">
                </td>
            </tr>
            
        </table>
        </form>
    </fieldset>
</div>

<%@ include file ="/WEB-INF/views/common/general/footer.jsp" %>

<c:if test="${empty user}">
    사용자 정보를 불러올 수 없습니다.
</c:if>

</body>
</html>
