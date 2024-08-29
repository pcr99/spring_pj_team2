<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link rel="stylesheet" href="${path }/resources/css/general/header.css">
<link rel="stylesheet" href="${path }/resources/css/general/message.css">
</head>
<body>
<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
	<div class="wrap">
		<!-- 컨텐츠 시작 -->
		<h1>쪽지함</h1>
		<table>
		    <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>내용</th>
		    </tr>
		    <c:forEach var="dto" items="${list}">
			    <tr class="post">
			        <td class="center">${dto.messageNo}</td>
			        <td class="left"><a href="${path}/message_detailCheck.ui?messageNo=${dto.messageNo}">${dto.messageTitle}</a></td>
			        <td class="center">${dto.messageContent}</td>   
			    </tr>
		    </c:forEach>
		</table>
	</div>
	
<footer>
<%@ include file= "/WEB-INF/views/common/general/footer.jsp" %>
</footer>
</body>
</html>