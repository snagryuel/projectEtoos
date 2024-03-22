<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="/projectEtoos/css/reset.css" type="text/css">
<link rel="stylesheet" href="/projectEtoos/css/myInfoModify.css" type="text/css">
</head>

<body>
<jsp:include page="../common/header.jsp" ></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
<jsp:include page="../common/mypageSidebar.jsp" ></jsp:include>

<main>
	<div class="container">
		<div class="title">
			<h2>내 정보 수정</h2>
			<h4 id="cancelMembership">회원 탈퇴</h4><br><br>
			<hr>
		</div>
		
		<div class="content">
			<div>	
			<form name="frm" id="frm" method = "post" action = "./MypageModify.do">
			    <span>(*)이름</span><input type="text" class="input_text"  name="name" id="name" value="${result.name }" placeholder="이름" maxlength="20"><br>
			    <span>(*)휴대폰 번호</span><input type="tel" class="input_text"  name="phone" id="phone" value="${result.phone }" placeholder="휴대폰 번호" maxlength="20"><br>
			    <span>(*)이메일</span><input type="email" class="input_text"  name="email" id="email" value="${result.email }" placeholder="이메일" maxlength="100"><br>
				
				<div class="info" id="info__birth">
					<span>생년월일</span><select class="box" id="birth-year">
				      <option selected>출생 연도</option>
				    </select>
				    <select class="box" id="birth-month">
				      <option selected>월</option>
				    </select>
				    <select class="box" id="birth-day">
				      <option selected>일</option>
				    </select>
				</div>
				
				<span>주소(선택)</span><input type="text" class="input_text" name="addr" id="addr" placeholder="주소" maxlength="20" value="${result.addr }"><br>
				<span>비밀번호</span><input type="password" class="input_text"  name="pwd1" id="pwd1" value="${result.pwd }" maxlength="20" readonly>
				<input type="submit" name="pwdChg" id="pwdChg" value="변경"><br>
				<input type="password" class="input_text"  name="pwd2" id="pwd2" value="" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>

	        	<input type="password" class="input_text"  name="pwd3" id="pwd3" value="" placeholder="비밀번호 재입력" maxlength="20">
	        	<input type="submit" name="pwdCheck" id="pwdCheck" value="확인"><br>
				
				<div id="teacherImg">
				<c:if test="${empty path }">
					<span>이미지 업로드</span><input name="teacherImgUp" id="teacherImgUp" type="file">
				</c:if>
				<c:if test="${empty path }">
					<img alt="" src="${path }">
				</c:if>
				</div>
				<div>
					<span>선생님 소개</span><textarea name="teacherMent" id="teacherMent" maxlength="500" rows="8" cols="50" placeholder="선생님 소개를 작성해주세요."></textarea>
				</div>
			    <input type="submit" name="completeBtn" id="completeBtn" value="수정 완료" accept="image/*"/>
			  
				  	
			</form>
			</div>	
	
				
		</div>
	</div>
</main>

<script>

document.querySelector("#cancelMembership").addEventListener("click", function(e){
	confirm("탈퇴 하시겠습니까?");
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

</script>


</body>
</html>