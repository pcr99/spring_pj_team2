<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 작성</title>
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<style type="text/css">
/* 전체적인 스타일 */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #141414;
    color: #fff;
    padding-top: 100px; /* 헤더 높이만큼 상단 여백 추가 */
}

/* 헤더 스타일 */
header {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100px; /* 헤더의 높이를 지정 */
    background-color: #333;
    z-index: 1000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 컨테이너 스타일 */
form {
    width: 80%;
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #1f1f1f;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    text-align: left;
    padding: 12px;
    border-bottom: 1px solid #444;
}

th {
    background-color: #333;
    font-weight: bold;
    color: #fff;
    width: 30%;
}

td {
    background-color: #2c2c2c;
}

/* 입력 필드 스타일 */
.input, textarea {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #B1AEB7;
    border-radius: 4px;
    background-color: #2c2c2c;
    color: #fff;
    box-sizing: border-box;
    transition: border-color 0.3s;
}

.input:focus, textarea:focus {
    border-color: #66afe9;
    outline: none;
}

/* 버튼 스타일 */
input[type="submit"] {
    background: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 15px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* 체크박스 스타일 */
input[type="checkbox"] {
    margin-right: 10px;
}

/* 메시지 작성 제목 스타일 */
h1 {
    text-align: center;
    color: #fff;
    margin-bottom: 20px;
}
</style>
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
<form name="messageform" action="message_Action.an" method="post">
<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
    <table>
    	<%
    	String[] userIds = request.getParameterValues("userNos");
        if (userIds != null) {
            for (String userId : userIds) {
                 %>
            <tr>
            <td>
                <input type="checkbox" name="user_row" value="<%=userId %>" checked><%=userId %>
            </td>
            </tr>
    <% }
        }
    	%>
        <tr>                                
            <th> *쪽지제목 </th>
            <td>
                <input type="text" class="input" name="messageTitle" size="20" required autofocus>
            </td>
        </tr>
        <tr>                                
            <th> *쪽지 내용 </th>
            <td>
                <textarea rows="5" cols="60" id="content" name="content"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="submit" name="message" value="보내기">
            </td>
        </tr>
    </table>
</form>
</body>
</html>