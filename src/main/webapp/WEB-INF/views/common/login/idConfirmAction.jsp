<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path }/resources/css/general/join.css">
<script src = "${path }/resources/js/join.js" defer></script>
<script src="https://kit.fontawesome.com/f210606706.js" crossorigin="anonymous"></script>
<title>main</title>
</head>
<body onload = "idConfirmFocus()">
	<div class = "wrap">
		<!-- contents 시작 -->
		<div id = "container">
			<div id = "contents">
				<div id = "section1">
					<h1 align = "center"> ID 중복확인 </h1>
				</div>			
				<div id = "section2">
					<div id = "s2_inner">
						<div class = "join">
							<form name = "confirmform" action = "idConfirmAction.ui" method = "post"
										onsubmit = "return idConfirmCheck()">
									<c:if test = "${checkCnt == 1}">
										<table align= "center" width = "300px">
										<tr>								
											<th colspan = "2" align = "center">
													<span> ${strUserId }는 사용할 수 없습니다.</span> 
											 </th>
										</tr>
										<tr>
											<th align = "center"> 아이디 </th>
											<td>
												<input type = "text" class = "input" name = "userid" id = "userid" size = "20" placeholder = "공백없이 20자 이내로 작성" required autofocus>
											</td>
										</tr>
										<tr>	
											<td colspan="2" style = "border-bottom:none">
												<br>
												<div align = "right">
													<input class = "inputButton" type= "submit"	value = "확인">
													<input class = "inputButton" type= "reset"	value = "초기화">
												</div>
											</td>
										</table>
									</c:if>
							<c:if test = "${checkCnt != 1}">
								<table align= "center" width = "500px">
									<tr>								
										<th colspan = "2" align = "center">
												<span> ${strUserId }는 사용할 수 있습니다.</span> 
										 </th>
									</tr>
									<tr>	
										<td colspan="2" style = "border-bottom:none">
											<br>
											<div align = "right">
												<input class = "inputButton" type= "button"	value = "확인" onclick = "setUserid('${strUserId }')">
											</div>
										</td>
									</table>	
								</c:if>
							</form>
						</div>
					</div>
				</div>			
			</div>
		</div>
		<!-- contents 끝 -->
		<!-- footer 시작 -->
		<!-- footer 끝 -->
	</div>
</body>
</html>