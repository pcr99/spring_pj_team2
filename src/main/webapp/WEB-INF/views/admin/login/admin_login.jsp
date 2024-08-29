<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>Young-Cha</title>
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path }/resources/css/general/loginContents.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
<div class="container">
    <form action="admin_loginAction.ui" method="post">
    <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
        <fieldset>
            <legend>관리자 로그인</legend>
            <table>
                <tr>
                    <th><label for="id">아이디</label></th>
                    <td><input type="text" id="id" name="adminId" size="30" placeholder="공백없이 아이디 10자이상 입력하시오" autofocus required></td>
                </tr>
                <tr>
                    <th><label for="pwd">비밀번호</label></th>
                    <td><input type="password" id="pwd" name="adminPwd" size="30" placeholder="영문자 숫자 10자 이상 입력" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class = "submit-buttons">
                            <input type="submit" value="로그인">
                            <input type="reset" value="초기화">
                        </div>
                    </td>
                </tr> 
                <tr>
                	<td colspan = "2"> 로그인 관련 문제발생시 서버관리자에게 문의바람.
                	</td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>