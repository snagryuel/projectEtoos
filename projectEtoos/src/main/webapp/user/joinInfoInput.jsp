<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합회원</title>
<link rel="stylesheet" href="/projectEtoos/css/joinInfoInput.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="title">
		<p style="font-size:32px; font-weight:900;"><span style="color:#047f89; font-size:32px; font-weight:900;">E</span>TOOS 통합회원</p>
	</div>
	<%@ include file="/common/loginHeader.jsp" %>
</div>



<div id="content">
	<div>
		<div class="logoControl">
			<img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
		</div>
		
		<form action="/projectEtoos/user/JoinOk.do" name="frm" id="frm" method="post">
	        <input type="text" class="join_input_text_id" name="id" id="id" value="" readonly placeholder="아이디(6자 이상, 20자 이하)" maxlength="20">
	        <button class="overlap authCheck" name="overlap" id="overlap authCheck" >중복확인</button><br>

	        <input type="password" class="join_input_text"  name="pwd" id="pwd" value="" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>
	        <input type="password" class="join_input_text"  name="pwd2" id="pwd2" value="" placeholder="비밀번호 재입력" maxlength="20"><br>
	        <div id="errId" style="display: none;"></div><br>
	        <div>(필수) 개인정보</div><br>
	        
	        <input type="text" class="join_input_text"  name="name" id="name" value="" placeholder="이름" maxlength="50"><br>
	        <input type="email" class="join_input_text"  name="email" id="email" value="" placeholder="이메일" maxlength="100"><br>
	        <input type="tel" class="join_input_text"  name="phone" id="phone" value="" placeholder="휴대폰 번호" maxlength="20"><br>
	        <input type="hidden" name="gubun" value="${param.gubun}">
	        <input type="hidden" name="authYN" id="authYN" value="">
			
			<div class="info" id="info__birth">
			생년월일<br><br>
			  <select class="box" name="birthYear" id="birth-year">
			    <option selected value="">출생 연도</option>
			  </select>
			  <select class="box" name="birthMonth" id="birth-month">
			    <option selected value="">월</option>
			  </select>
			  <select class="box" name="birthDay"  id="birth-day">
			    <option selected value="">일</option>
			  </select>
			</div>
			<div>
				(선택) 개인정보<br><br>
				<input type="text" class="join_input_text" name="addr" id="addr"placeholder="주소" maxlength="20">
			</div>
	        <input type="submit" class="completeBtn" name="completeBtn" id="completeBtn" value="완료" />
        
    </form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
<script>

</script>
<script>
const rexForId = /^[0-9a-zA-Z]{6,20}$/;
const rexForPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!#])[A-Za-z\d@!#]{8,20}$/;
const rexForPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
const rexForEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let frm = document.querySelector("#frm");
frm.addEventListener("submit", function(e){
	e.preventDefault();
	
	const id = document.querySelector("#id");
	const idVal = document.querySelector("#id").value;
	const pwd = document.querySelector("#pwd");
	const pwdVal = document.querySelector("#pwd").value;
	const pwd2 = document.querySelector("#pwd2");
	const pwd2Val = document.querySelector("#pwd2").value;
	const name = document.querySelector("#name");
	const nameVal = document.querySelector("#name").value;
	const email = document.querySelector("#email");
	const emailVal = document.querySelector("#email").value;
	const phone = document.querySelector("#phone");
	const phoneVal = document.querySelector("#phone").value;
	const authYN = document.querySelector("#authYN").value;
	const year = document.querySelector("#birth-year");
	const yearVal = document.querySelector("#birth-year").value;
	const month = document.querySelector("#birth-month");
	const monthVal = document.querySelector("#birth-month").value;
	const day = document.querySelector("#birth-day");
	const dayVal = document.querySelector("#birth-day").value;
	
	let errId = document.getElementById("errId");
    errId.style.display = "block";
    errId.style.color = "red";
    
    // 아이디 관련
    if(!idVal) {
    	id.focus();
		return errId.innerHTML="<strong>아이디를 입력해주세요.</strong>";
    }
    if(!rexForId.test(idVal)) {
    	id.focus();
		return errId.innerHTML="<strong>아이디는 6~20자의 영문자, 숫자만 사용 가능합니다.</strong>";
    }
    if(authYN != "Y") {
    	id.focus();
		return errId.innerHTML="<strong>아이디 중복확인을 진행해주세요</strong>";
    }
    
    // 비밀번호 관련
    if(!pwdVal) {
    	pwd.focus();
		return errId.innerHTML="<strong>비밀번호를 입력해주세요.</strong>";
    }
    if(!rexForPwd.test(pwdVal)) {
    	pwd.focus();
    	return errId.innerHTML="<strong>8~20자의 영문자, 숫자, 특수문자(!, @, #)만 사용가능합니다.</strong>";
    }
    
    if(pwdVal != pwd2Val) {
    	pwd.focus();
		return errId.innerHTML="<strong>비밀번호가 일치하지 않습니다.</strong>";
    }
    
    // 잡다
    if(!nameVal) {
    	name.focus();
		return errId.innerHTML="<strong>이름을 입력해주세요.</strong>";
    }
    if(!emailVal) {
    	email.focus();
		return errId.innerHTML="<strong>이메일을 입력해주세요.</strong>";
    }
    if(!phoneVal) {
    	phone.focus();
		return errId.innerHTML="<strong>휴대폰을 입력해주세요.</strong>";
    }
    if(!authYN) {
    	id.focus();
    	return errId.innerHTML="<strong>아이디 중복을 확인해주세요.</strong>";
    }
    if(!yearVal) {
    	year.focus();
    	return errId.innerHTML="<strong>생년월일을 입력해주세요.</strong>";
    }
    if(!monthVal) {
    	month.focus();
    	return errId.innerHTML="<strong>생년월일을 입력해주세요.</strong>";
    }
    if(!dayVal) {
    	day.focus();
    	return errId.innerHTML="<strong>생년월일을 입력해주세요.</strong>";
    }
    frm.submit();
}, false);

/* 중복확인 */
let authCheck = document.querySelector(".authCheck");
let idNow = document.querySelector("#id");

idNow.addEventListener("click", (e)=> {
	e.preventDefault();
	let authYN = document.querySelector("#authYN");
	idNow.value = "";
	authYN.value = "";
	authPop = window.open("/projectEtoos/user/AuthChekPopup.do",'_blank', 'width=500, height=300, top=150, left=50, scrollbars=yes, location=no');
})
authCheck.addEventListener("click", (e)=> {
	e.preventDefault();
	let authYN = document.querySelector("#authYN");
	idNow.value = "";
	authYN.value = "";
	authPop = window.open("/projectEtoos/user/AuthChekPopup.do",'_blank', 'width=500, height=300, top=150, left=50, scrollbars=yes, location=no');
})



let birthYearEl = document.querySelector('#birth-year');

birthYearEl.addEventListener('focus', function () {
	let today = new Date();

 	for(var i = today.getFullYear()-50; i <= today.getFullYear(); i++) {
   	let yearOption = document.createElement('option');
   	yearOption.setAttribute('value', i);
   	yearOption.innerText = i;
    this.appendChild(yearOption);

}
}, false);


let birthMonthEl = document.querySelector('#birth-month');

birthMonthEl.addEventListener('focus', function () {

 	for(var i = 1; i <= 12; i++) {
   	let monthOption = document.createElement('option');
   	monthOption.setAttribute('value', i);
   	monthOption.innerText = i;
    this.appendChild(monthOption);

}
}, false);


let birthDayEl = document.querySelector('#birth-day');

birthDayEl.addEventListener('focus', function () {


 	for(var i = 1; i <= 31; i++) {
   	let dayOption = document.createElement('option');
   	dayOption.setAttribute('value', i);
   	dayOption.innerText = i;
    this.appendChild(dayOption);
}
}, false);

 </script>

</body>
</html>