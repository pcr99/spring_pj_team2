<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>Young-Cha</title>
<script type="text/javascript">
$(function() {
	if("${msg}" != "") alert("${msg}");
});
</script>
<link rel="stylesheet" href="${path }/resources/css/general/header.css">
<link rel="stylesheet" href="${path }/resources/css/general/loginContents.css">
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
	<div class="container">
    	<form name= "signIn" action="login_Action.ui" method="post">
    	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
        	<fieldset>
            	<legend>로그인</legend>
            	<table>
                	<tr>
                    	<th><label for="id">아이디</label></th>
                    	<td><input type="text" id="userId" name="userId" size="30" placeholder="공백없이 아이디 10자이상 입력하시오" autofocus required></td>
                	</tr>
	                <tr>
	                    <th><label for="pwd">비밀번호</label></th>
	                    <td><input type="password" id="userPwd" name="userPwd" size="30" placeholder="영문자 숫자 10자 이상 입력" required></td>
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
	                	<td colspan = "2">
	                		<div class = "login-manage">
								<div class="join"><a href = "${path}/join.ui">회원가입</a></div>
								<div class="find-id-pwd"><a href = "${path}/find_id_pwd.ui">아이디/비밀번호 찾기</a></div>
							</div>
	                	</td>
	                </tr>
				</table>
        	</fieldset>
    	</form>
	</div>
</body>
</html>