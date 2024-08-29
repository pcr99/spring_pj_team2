<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-header</title>
</head>
<body>
    <div class="logo-container">
        <a href="${path}/main.mv"><img src="${path}/resources/items/logo.png" alt="로고" class="logo-image"></a>
    </div>
    <div class="nav_menu">
        <ul class="menuList" id="myTab" role="tablist">
        	<li>${sessionID}님</li>
        	<li><a href="${path}/admin_main.an">관리자 메인 페이지</a></li>
            <li><a href="${path}/admin_movie.an">영화 관리 페이지</a></li>
            <li><a href="${path}/admin_board.an">게시판 관리 페이지</a></li>
            <li><a href="${path}/admin_manage.an">사용자 관리 페이지</a></li>
        </ul>
    </div>
</body>
</html>