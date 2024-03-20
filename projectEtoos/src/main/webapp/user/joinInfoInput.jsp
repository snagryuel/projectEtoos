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
	<div id="prevLogin">
		<a href="#"><</a>
	</div>
	<div id="title">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<a href="#"><img class="xSymbol" alt="xSymbol" src="/projectEtoos/img/xSymbol.png"/></a>
	</div>
</div>



<div id="content">
	<div>
		<div class="logoControl">
			<img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
		</div>
		
		<form name="frm" id="frm">
	        <input type="text" class="join_input_text_id" name="id" id="id" value="" placeholder="아이디(6자 이상, 20자 이하)" maxlength="20">
	        <button class="overlap">중복확인</button><br>
	        <input type="password" class="join_input_text"  name="pwd" id="pwd" value="" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>
	        <input type="password" class="join_input_text"  name="pwd2" id="pwd2" value="" placeholder="비밀번호 재입력" maxlength="20"><br>
	        <div id="errId" style="display: none;"></div><br>
	        <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
	        <div>(필수) 개인정보</div><br>
	        <input type="text" class="join_input_text"  name="name" id="name" value="" placeholder="이름" maxlength="20"><br>
	        <input type="email" class="join_input_text"  name="email" id="email" value="" placeholder="이메일" maxlength="100"><br>
	        <input type="tel" class="join_input_text"  name="phone" id="phone" value="" placeholder="핸드폰 번호" maxlength="20"><br>
			<div class="info" id="info__birth">
			생년월일<br><br>
			  <select class="box" id="birth-year">
			    <option selected>출생 연도</option>
			  </select>
			  <select class="box" id="birth-month">
			    <option selected>월</option>
			  </select>
			  <select class="box" id="birth-day">
			    <option selected>일</option>
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

document.querySelector("#completeBtn").addEventListener("click", function(e){
	const id = document.querySelector("#id");
	const pwd = document.querySelector("#pwd");
	
	
	if(id.value.length < 6 || id.value.length > 20) {
        let errId = document.getElementById("errId");
        errId.style.display = "block";
        errId.style.color = "red";
		e.preventDefault();
		id.focus();
		return errId.innerHTML="<strong>아이디는 6~20자의 영문자, 숫자만 사용 가능합니다.</strong>";
	}
	
	if(pwd.value.length < 8 || pwd.value.length > 20) {
        let errId = document.getElementById("errId");
        errId.style.display = "block";
        errId.style.color = "red";
		e.preventDefault();
		pwd.focus();
		return errId.innerHTML="<strong>비밀번호를 8~20자의 영문자, 숫자, 특수문자(!, @, #)만 사용가능합니다.</strong>";
	}
	
	else{
		location.href = "joinInfoInput.jsp";
	}
}, false);


let birthYearEl = document.querySelector('#birth-year');
isYearOptionExisted = false;

birthYearEl.addEventListener('focus', function () {

	if(!isYearOptionExisted) {
 	isYearOptionExisted = true;
 	
 	for(var i = 1940; i <= 2023; i++) {
   	let yearOption = document.createElement('option');
   	yearOption.setAttribute('value', i);
   	yearOption.innerText = i;
    this.appendChild(yearOption);
    
 }
}
},  false );


let birthMonthEl = document.querySelector('#birth-month');
isMonthOptionExisted = false;

birthMonthEl.addEventListener('focus', function () {

	if(!isMonthOptionExisted) {
	isMonthOptionExisted = true;
 	
 	for(var i = 1; i <= 12; i++) {
   	let monthOption = document.createElement('option');
   	monthOption.setAttribute('value', i);
   	monthOption.innerText = i;
    this.appendChild(monthOption);
 }
}
});


let birthDayEl = document.querySelector('#birth-day');
isDayOptionExisted = false;

birthDayEl.addEventListener('focus', function () {

	if(!isDayOptionExisted) {
	isDayOptionExisted = true;
 	
 	for(var i = 1; i <= 12; i++) {
   	let dayOption = document.createElement('option');
   	dayOption.setAttribute('value', i);
   	dayOption.innerText = i;
    this.appendChild(dayOption);
 }
}
});

 </script>

</body>
</html>