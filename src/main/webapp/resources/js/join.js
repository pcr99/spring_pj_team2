/**
 * 
 */
$(function() {
});
let reg_password = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,20}$/;	//비밀번호 판별을 위한 정규식 문자+숫자로 구성된 10~20 자 비밀번호
    $(function() {
        $("#userid,#password, #repassword, #username, #birthday, #address, #email1, #email2").keyup(function() {
			if (!$("#userid").val()) {
                $("#result_id").html("아이디를 입력하세요!");
                $(".result-line-id").css("display", "block");
                return false; //동작 중지
            }
            else if ($("#userid").val().length <= 8 || $("#userid").val().length >16) {
                $("#result_id").html("아이디는 8~16글자이내여야합니다..");
                $(".result-line-id").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-id").css("display", "none");
            }
            // 비밀번호 입력 확인
            if (!$("#password").val()) {
                $("#result_pwd").html("비밀번호를 입력하세요!");
                $(".result-line-pwd").css("display", "block");
                return false; //동작 중지
            }
            else if ($("#password").val().length <= 9 || $("#password").val().length >21) {
                $("#result_pwd").html("비밀번호는 숫자+문자로 10~20자 사이로 입력하세요.");
                $(".result-line-pwd").css("display", "block");
                return false; //동작 중지
            }
            else if (!reg_password.test($("#password").val())) {
                $("#result_pwd").html("비밀번호는 숫자+문자(대문자포함)로 10~20자 사이로 입력하세요.");
                $(".result-line-pwd").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-pwd").css("display", "none");
            }
            // 비밀번호 확인 입력 확인
            if (!$("#repassword").val()) {
                $("#result_repwd").html("비밀번호 확인을 입력하세요!");
                $(".result-line-repwd").css("display", "block");
                $("#repassword").focus();
                return false; //동작 중지
            }
            else if ($("#repassword").val() != $("#password").val()) {
                $("#result_repwd").html("비밀번호와 일치하지 않습니다.");
                $(".result-line-repwd").css("display", "block");
                $("#repassword").focus();
                return false; //동작 중지
            }
            else{
                $(".result-line-repwd").css("display", "none");
            }
            // 이름 입력 확인
            if (!$("#username").val()) {
                $("#result_name").html("이름을 입력하세요!");
                $(".result-line-name").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-name").css("display", "none");
            }
            // 생년월일 입력 확인
            if (!$("#birthday").val()) {
                $("#result_birth").html("생년월일을 입력하세요!");
                $(".result-line-birth").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-birth").css("display", "none");
            }
            // 주소 입력 확인
            if (!$("#address").val()) {
                $("#result_address").html("주소를 입력하세요!");
                $(".result-line-address").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-address").css("display", "none");
            }
            // 이메일 입력 확인
            if (!$("#email1").val() || !$("#email2").val()) {
                $("#result_email").html("이메일을 입력하세요!");
                $(".result-line-email").css("display", "block");
                return false; //동작 중지
            }
            else{
                $(".result-line-email").css("display", "none");
            }
        });
    });
function confirmId() {
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	// http://localhost/jsp
	let url = "/html_pj_team2/idConfirmAction.ui?userid="+document.joinform.userid.value;
	window.open(url, "confirm", "menubar=no, width=500, height=300");
}

function setUserid(userid) {
	//alert('id 가능~~');
	//alert(userid);
	opener.document.joinform.userid.value = userid;
	opener.document.joinform.hiddenUserid.value = "1";
	self.close();
}

 function signInCheck() {
	// 2-1. 중복확인
	// <input type = "hidden" name = "hiddenUserid" value = "0">
	if(document.joinform.hiddenUserid.value == "0") {
		alert("중복 확인 하세요!!");
		document.joinform.dubChk.focus();
		return false;
	}
}

function updateEmail2() {
        const email3 = $("#email3").val();
        if (email3 !== "0") {
            $("#email2").val(email3);
            $("#email2").prop("readonly", true);
        } else {
            $("#email2").val("");
            $("#email2").prop("readonly", false);
        }
}

function idConfirmCheck() {
	if(!document.joinform.userid.value) {
		alert("아이디를 입력하세요!!");
		document.joinform.userid.focus();
		return false;
	}
	else if($("#userid").val().length <= 7 || $("#userid").val().length > 17) {
                alert("아이디는 8자 이상 16자 이하여야합니다!");
				document.joinform.userid.focus();
                return false; //동작 중지
   }
}