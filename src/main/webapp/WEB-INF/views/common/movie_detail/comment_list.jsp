<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/detail.css">
<script src="https://kit.fontawesome.com/c1c9e05860.js" crossorigin="anonymous"></script>
<title> 댓글목록 </title>
</head>
<body>
    <div id="right">
        <div class="table_div">
            <form name="boardList" action="${path}/comment_delete.mv">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <table width="1000px">
                    <tr>
                        <th style="width: 10%"> 번호 </th>
                        <th style="width: 10%"> 감상평 </th>
                        <th style="width: 10%"> 별점 </th>
                        <th style="width: 10%"> 등록일 </th>
                    </tr>
                    <c:forEach var="dto" items="${list}">
                    <tr>
                        <td>${dto.comment_num}</td>
                        <td>${dto.review}</td>
                        <td>${dto.rating}</td>
                        <td>${dto.regDate}</td>
                        <td>
                            <input type="hidden" name="comment_num" value="${dto.comment_num}">
                            <input type="hidden" name="mvNo" value="${dto.mvNo}">
                            <input type="password" name="password" placeholder="비밀번호">
                            <button id="submit">삭제</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
