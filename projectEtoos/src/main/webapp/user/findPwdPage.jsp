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
		<form name="frm" id="frm" action="FindInfoOk.do?flag=pwd" method="post">
			<input type="text" class="input_text"  name="id" id="id" value="${requestScope.id}" placeholder="아이디" maxlength="20">
	        <input type="text" class="input_text"  name="name" id="name" value="${requestScope.name}" placeholder="이름" maxlength="20"><br>
	        
	     
			<div class="info" id="info__birth">
				생년월일<br><br>
			    <select class="box" id="birth-year" name="birthYear">
			      <option value="">출생 연도</option>
			    </select>
			    <select class="box" id="birth-month" name="birthMonth">
			      <option value="">월</option>
			    </select>
			    <select class="box" id="birth-day" name="birthDay">
			      <option value="">일</option>
			    </select>
			</div>
			
	        <input type="tel" class="input_text"  name="phone" id="phone" value="${requestScope.phone}" placeholder="휴대폰 번호" maxlength="20"><br>
			
	        <input type="submit" class="completeBtn" name="completeBtn" id="completeBtn" value="확인" />
	        <input type="button" class="cancelBtn" name="cancelBtn" id="cancelBtn" value="취소" />
        
    </form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
 
<script>
// 날짜 갖고오기
window.onload = ()=> {
	let birthYearEl = document.querySelector('#birth-year');
	let birthMonthEl = document.querySelector('#birth-month');
	let birthDayEl = document.querySelector('#birth-day');
	
	let today = new Date();

 	for(var i = today.getFullYear()-50; i <= today.getFullYear(); i++) {
   	let yearOption = document.createElement('option');
   	yearOption.setAttribute('value', i);
   	if(i == ${requestScope.birthYear == null ? 0 : requestScope.birthYear}) {
   		yearOption.setAttribute('selected', true);
   	}
   	yearOption.innerText = i;
   	birthYearEl.appendChild(yearOption);
 	}
    
    for(var i = 1; i <= 12; i++) {
       	let monthOption = document.createElement('option');
       	monthOption.setAttribute('value', i);
       	if(i == ${requestScope.birthMonth == null ? 0 : requestScope.birthMonth}) {
       		monthOption.setAttribute('selected', true);
       	}
       	monthOption.innerText = i;
       	birthMonthEl.appendChild(monthOption);
    }
    
    for(var i = 1; i <= 31; i++) {
       	let dayOption = document.createElement('option');
       	dayOption.setAttribute('value', i);
       	if(i == ${requestScope.birthDay == null ? 0 : requestScope.birthDay}) {
       		dayOption.setAttribute('selected', true);
       	}
       	dayOption.innerText = i;
       	birthDayEl.appendChild(dayOption);
    } 
}

// 정보 일치 알럿
if (${requestScope.errMsg == null ? false : true}) {
	alert("입력하신 정보와 일치하는 정보가 없습니다.");
}

// 값 입력여부 체크
let frm = document.querySelector("#frm");
frm.addEventListener("submit", (e)=>{
	e.preventDefault();
	
	const id = document.querySelector("#id");
	const idVal = document.querySelector("#id").value;
	const name = document.querySelector("#name");
	const nameVal = document.querySelector("#name").value;
	const phone = document.querySelector("#phone");
	const phoneVal = document.querySelector("#phone").value;
	const year = document.querySelector("#birth-year");
	const yearVal = document.querySelector("#birth-year").value;
	const month = document.querySelector("#birth-month");
	const monthVal = document.querySelector("#birth-month").value;
	const day = document.querySelector("#birth-day");
	const dayVal = document.querySelector("#birth-day").value;
	
	
    if(!nameVal) {
    	name.focus();
    	alert("이름을 입력해주세요.");
		return;
    }
    if(!idVal) {
		id.focus();
    	alert("아이디를 입력해주세요.");
		return;
    }
    if(!yearVal) {
    	year.focus();
    	alert("생년월일을 입력해주세요");
		return;
    }
    if(!monthVal) {
    	month.focus();
    	alert("생년월일을 입력해주세요");
		return;
    }
    if(!dayVal) {
    	day.focus();
    	alert("생년월일을 입력해주세요");
		return;
    }
    if(!phoneVal) {
    	phone.focus();
    	alert("휴대폰 번호를 입력해주세요.");
		return;
    }
    frm.submit();
});

// 뒤로 가기
let cancelBtn = document.querySelector("#cancelBtn");
cancelBtn.addEventListener("click", (e)=>{
	window.location.replace("./FindYourInfo.do?step=1");
});

 </script>

</body>
</html>