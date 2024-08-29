<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>
<title>header</title>
</head>
<body>
<% String authority = (String)request.getAttribute("authority"); %>
    <div class="headerBody">
        <div class="logo-container">
            <a href="${path}/main.mv"><img src="${path}/resources/items/logo.png" alt="로고" class="logo-image"></a>
        </div>
        <div class="nav-content">
            <ul>
                <c:if test="${sessionScope.sessionID ne null}">
                   <li>${sessionID} </li>
                   <li><a href="${path}/messageCheck.ui"><i class="fa-solid fa-envelope">쪽지함</i></a></li>
                    <li><a href="${path}/main.mv">홈</a></li>
                    <li id="myPageLink"><a href="${path}/mypage.ui">마이페이지</a></li>
                    <li><a href="${path}/k_mvList.mo">국내영화</a></li>
                    <li><a href="${path}/f_mvList.mo">국외영화</a></li>
                    <li><a href="${path}/board_list.bc">게시판</a></li>
                    <li><a href="${path}/logout.ui">로그아웃</a></li>
                </c:if>
	            <c:if test="${sessionScope.sessionID eq null}">
	                    <li><a href="${path}/main.mv">홈</a></li>
	                    <li><a href="${path}/login.ui">로그인</a></li>
	                    <li><a href="${path}/login.ui">국내영화</a></li>
	                    <li><a href="${path}/login.ui">국외영화</a></li>
	                    <li><a href="${path}/login.ui">게시판</a></li>
	            </c:if>
	            <% if(authority == "ROLE_ADMIN") { %>
	            	<li><a href="${path}/admin_main.an">관리자 페이지</a></li>
	            <%} %>
                <li>
                    <form id="searchForm" action="${path}/movie_search.mv" method="post">
                    	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
                        <input type="text" name="keyword" placeholder="영화 제목을 입력하세요">
                        <input type="submit" value="검색">
                    </form>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        function validateForm(event) {
            var keyword = document.getElementsByName('keyword')[0].value;
            if (keyword.trim() === '') {
                alert('영화 제목을 입력하세요.');
                event.preventDefault(); // 폼 제출을 막습니다.
            }
        }

        window.onload = function() {
            var form = document.getElementById('searchForm');
            form.onsubmit = validateForm;
        }
    </script>
</body>
</html>
