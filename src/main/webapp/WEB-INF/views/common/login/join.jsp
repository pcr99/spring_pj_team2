<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/WEB-INF/views/common/general/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Young-Cha</title>

<link rel="stylesheet" href="${path }/resources/css/general/header.css">
<link rel="stylesheet" href="${path }/resources/css/general/join.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/join.js"></script>

</head>
<body>

<header>
<%@ include file= "/WEB-INF/views/common/general/header.jsp" %>
</header>
    <div id="container">
        <div id="contents">
            <div id="section1">
                <h3 align="center"> 회원가입 </h3>
            </div>          
            <div id="section2">
                <div id="s2_inner">
                    <div class="join">
                        <form action="joinAction.ui"  name="joinform" id="joinform" method="post" onsubmit = "return signInCheck()">
                        <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}">
                            <table>
                                <tr>
                                    <th> *아이디 </th>
                                    <td>
                                        <input type="text" class="input" name="userid" id="userid" size="20" placeholder=" 8~16 자 이내" autofocus>
                                        <input type = "button" name = "dubChk" value = "중복확인" style = "margin-left : 10px" onclick = "confirmId()">
                                        <input type="hidden" name = "hiddenUserid" value = "0"><!-- 중복확인 check -->
                                    </td>
                                </tr>
                                <tr class="result-line-id" style="display:none;">
                                    <td><div id="result_id"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *비밀번호 </th>
                                    <td>
                                        <input type="password" class="input" name="password" id="password" size="20" placeholder="영자 + 숫자 조합으로 10~20 자 이내">
                                    </td>
                                </tr>
                                <tr class="result-line-pwd" style="display:none;">
                                    <td><div id="result_pwd"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *비밀번호확인 </th>
                                    <td>
                                        <input type="password" class="input" name="repassword" id="repassword" size="20" placeholder="-">
                                    </td>
                                </tr>
                                <tr class="result-line-repwd" style="display:none;">
                                    <td><div id="result_repwd"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *이름 </th>
                                    <td>
                                        <input type="text" class="input" name="username" id="username" size="20" placeholder="이름 작성">
                                    </td>
                                </tr>
                                <tr class="result-line-name" style="display:none;">
                                    <td><div id="result_name"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *생년월일 </th>
                                    <td>
                                        <input type="date" class="input" name="birthday" id="birthday" size="8" placeholder="-없이 생년월일 8자리">
                                    </td>
                                </tr>
                                <tr class="result-line-birth" style="display:none;">
                                    <td><div id="result_birth"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *주소 </th>
                                    <td>
                                        <input type="text" class="input" name="address" id="address" size="60" placeholder="주소 작성">
                                    </td>
                                </tr>
                                <tr class="result-line-address" style="display:none;">
                                    <td><div id="result_address"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <th> *연락처 </th>
                                    <td>
                                        <input type="text" class="input" name="hp1" size="3" style="width: 50px">
                                        -
                                        <input type="text" class="input" name="hp2" size="4" style="width: 50px">
                                        -
                                        <input type="text" class="input" name="hp3" size="4" style="width: 50px">
                                    </td>
                                </tr>

                                <tr>
                                    <th> *이메일 </th>
                                    <td>
                                        <input type="text" class="input" name="email1" id="email1" size="11" style="width: 100px">
                                        @
                                        <input type="text" class="input" name="email2" id="email2" size="11" style="width: 100px">
                                        <select class="input" name="email3" id="email3" style="width: 100px" onchange="updateEmail2()">
                                            <option value="0">직접입력</option>
                                            <option value="naver.com">네이버</option>
                                            <option value="google.com">구글</option>
                                            <option value="daum.net">다음</option>
                                            <option value="nate.com">네이트</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="result-line-email" style="display:none;">
                                    <td><div id="result_email"> 결과 출력 위치 </div></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-bottom:none">
                                        <br>
                                        <div align="right">
                                            <input type="submit" value="회원가입" class="inputButton">
                                            <input class="inputButton" type="reset" value="초기화">
                                            <input class="inputButton" type="button" value="가입취소" onclick="window.location = '${path}/login.ui'">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>          
        </div>
    </div>
</body>
</html>