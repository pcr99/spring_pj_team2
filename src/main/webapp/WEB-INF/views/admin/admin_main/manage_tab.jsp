<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리 TAB</title>
<script type="text/javascript" src="${path}/resources/js/admin_manageTab.js"></script>
<link rel="stylesheet" href="${path }/resources/css/admin/header.css">
<link rel="stylesheet" href="${path }/resources/css/admin/main.css">
<script type="text/javascript">

</script>
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/admin/admin_main/header.jsp" %>
</header>
 <!-- 사용자 관리 Tab -->
        <div class="tab-pane fade" id="user-tab-pane" role="tabpanel" aria-labelledby="user-tab" tabindex="0">
        	<form class="user_table-container">
        	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
			    <h3>사용자 관리</h3>
			    <table class="user_table">
			        <tr class="table-top">
			            <th scope="col">선택</th>
			            <td scope="col">사용자번호</td>
			            <td scope="col">아이디</td>
			            <td scope="col">비밀번호</td>
			            <td scope="col">이름</td>
			            <td scope="col">전화번호</td>
			            <td scope="col">주소</td>
			            <td scope="col">이메일</td>
			            <td scope="col">생년월일</td>
			            <td scope="col">가입일자</td>
			            <td scope="col">차단여부(로그인 가능여부)</td>
			        </tr>
			        <c:forEach var="dto" items="${u_list}">
			            <tr class="table-row">
			                <th scope="row"><input type="checkbox" name="user_row" value="${dto.userId}"></th>
			                <td>${dto.userNo}</td>
			                <td>${dto.userId}</td>
			                <td>---</td>
			                <td>${dto.userName}</td>
			                <td>${dto.hp}</td>
			                <td>${dto.address}</td>
			                <td>${dto.email}</td>
			                <td>${dto.birth}</td>
			                <td>${dto.createDate}</td>
			                <td>${dto.show}</td>
			            </tr>
			        </c:forEach>
			        <tr>
                		<td colspan = "11" align = "center">
	                		<div align="center" class="center">
								<c:if test="${paging.startPage > 10}">
									<a href="${path}/admin_manage.an?pageNum=${paging.prev}">[이전]</a>
								</c:if>
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="${path}/admin_manage.an?pageNum=${num}">${num}</a>
								</c:forEach>
								<c:if test="${paging.endPage < paging.pageCount}">
									<a href="${path}/admin_manage.an?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</div>
                		</td>
                	</tr>
			        <tr>
			            <td colspan="11" align="right">
			                <input type="button" name="message" value="쪽지" onclick="messageUser()">
			                <input type="button" name="ban" value="사용자 차단" onclick="blockUser()">
			                <input type="button" name="unban" value="차단 해제" onclick="unblockUser()">
			            </td>
			        </tr>
			    </table>
			</form>

		</div>
</body>
</html>