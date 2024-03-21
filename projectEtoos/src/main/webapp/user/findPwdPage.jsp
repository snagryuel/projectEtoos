<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/projectEtoos/css/findPwdPage.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="title">
		<p>ETOOS 통합회원</p>
	</div>
	<%@ include file="/common/loginHeader.jsp" %>
</div>


<div id="hTag">
	<h3>비밀번호 찾기</h3><br>
	<h4>가입 시 등록한 회원 정보를 입력해 주세요.</h4>
</div>


<div id="content">
	<div>
		<form name="frm" id="frm">
			<input type="text" class="input_text"  name="id" id="id" value="" placeholder="아이디" maxlength="20">
	        <input type="text" class="input_text"  name="name" id="name" value="" placeholder="이름" maxlength="20"><br>
	        
	     
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
			
	        <input type="tel" class="input_text"  name="phone" id="phone" value="" placeholder="휴대폰 번호" maxlength="20"><br>
			<div id="errId" style="display: none;"></div><br>
			
	        <input type="submit" class="completeBtn" name="completeBtn" id="completeBtn" value="확인" />
	        <input type="submit" class="cancelBtn" name="cancelBtn" id="cancelBtn" value="취소" />
        
    </form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
 
<script>

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
}, false);


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
}, false);


let birthDayEl = document.querySelector('#birth-day');
isDayOptionExisted = false;

birthDayEl.addEventListener('focus', function () {

	if(!isDayOptionExisted) {
	isDayOptionExisted = true;
 	
 	for(var i = 1; i <= 31; i++) {
   	let dayOption = document.createElement('option');
   	dayOption.setAttribute('value', i);
   	dayOption.innerText = i;
    this.appendChild(dayOption);
 }
}
}, false);


document.querySelector("#cancelBtn").addEventListener("click", function(e){
	e.preventDefault();
	location.href = "findAccount.jsp";
}, false);

 </script>

</body>
</html>