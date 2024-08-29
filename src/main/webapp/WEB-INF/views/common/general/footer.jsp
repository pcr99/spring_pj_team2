<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<title>footer</title>
</head>
<body>
		<div class = "footer_info">
			<div class = "footer_link">
				<ul>
					<li><a href = "https://ictedu.co.kr/index_new.php?main_page=home">회사소개</a></li>
					<li><a href = "https://ictedu.co.kr/index_new.php?main_page=notice&place=">이용약관</a></li>
					<li><a href = "#">개인정보 처리방침</a></li>
					<li><a href = "${path}/admin_main.an">관리자페이지</a></li>
				</ul>
			</div>
			<div class = "footer_info_customer">
				<h3>고객센터 02-1234-5678</h3>
				<p>
					평일  9:30~18:20 (공휴일 및 주말 휴무)<br>
					점심시간 13:20 ~ 14:20
				</p>
			</div>
			<div class = "footer_info_company">
				<span>법인명 : Team2</span>
				<span>팀장 : 박민창</span>
				<span>사업자 소재지 : 서울시 마포구 신수동</span>
			</div>
		</div>	
</body>
</html>