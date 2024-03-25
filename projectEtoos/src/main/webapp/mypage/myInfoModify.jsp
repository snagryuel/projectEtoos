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
<jsp:include page="../common/mypageSidebar.jsp" >
	<jsp:param value="2" name="sideNum"/>
</jsp:include>

<main>
	<div class="container">
		<div class="title">
			<h2>내 정보 수정</h2>
			<h4 id="cancelMembership">회원 탈퇴</h4><br><br>
			<hr>
		</div>
		
		<div class="content">
			<div>	
			<form name="frm" id="frm" method = "post" action = "./MypageModify.do" enctype="multipart/form-data">
			    <span>(*)이름</span><input type="text" class="input_text"  name="name" id="name" value="${result.name }" placeholder="이름" maxlength="20"><br>
			    <span>(*)휴대폰 번호</span><input type="tel" class="input_text"  name="phone" id="phone" value="${result.phone }" placeholder="휴대폰 번호" maxlength="20"><br>
			    <span>(*)이메일</span><input type="email" class="input_text"  name="email" id="email" value="${result.email }" placeholder="이메일" maxlength="100"><br>
				
				<div class="info" id="info__birth">
					<span>생년월일</span><select class="box" id="birth-year" name = "birthYear">
				      <option>출생 연도</option>
				    </select>
				    <select class="box" id="birth-month"name = "birthMonth"> 
				      <option>월</option>
				    </select>
				    <select class="box" id="birth-day" name = "birthDay">
				      <option>일</option>
				    </select>
				</div>
				
				<span>주소(선택)</span><input type="text" class="input_text" name="addr" id="addr" placeholder="주소" maxlength="20" value="${result.addr }"><br>
				<span>비밀번호</span><input type="password" class="input_text"  name="pwd1" id="pwd1" value="${result.pwd }" maxlength="20" readonly>
				<input type="submit" name="pwdChg" id="pwdChg" value="변경"><br>
				<input type="password" class="input_text"  name="pwd2" id="pwd2" value="" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>

	        	<input type="password" class="input_text"  name="pwd3" id="pwd3" value="" placeholder="비밀번호 재입력" maxlength="20">
	        	<input type="submit" name="pwdCheck" id="pwdCheck" value="확인"><br>
				
				<div id="teacherImg">
				<c:if test="${empty path||path eq 'https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg' }">
					<span>이미지 업로드</span><input name="teacherImgUp" id="teacherImgUp" type="file"><br>
				</c:if>
				<c:if test="${not empty path&&path ne 'https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg' }">
					<img alt="" src="${path }">
				</c:if>
				</div>
				<div>
					<span>선생님 소개</span><textarea name="teacherMent" id="teacherMent" maxlength="500" rows="8" cols="50" placeholder="선생님 소개를 작성해주세요.">${result.ment }</textarea>
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

</script>


</body>
</html>