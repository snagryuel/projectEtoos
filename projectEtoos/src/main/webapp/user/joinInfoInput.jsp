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
	        <input type="text" class="join_input_text_id" name="id" id="id" placeholder="아이디(6자 이상, 20자 이하)" maxlength="20">
	        <button>중복확인</button><br>
	        <input type="password" class="join_input_text"  name="pwd" id="pwd" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>
	        <input type="password" class="join_input_text"  name="pwd2" id="pwd2" placeholder="비밀번호 재입력" maxlength="20"><br>
	        <div id="errId" style="display: none;"></div><br>
	        <div>(필수) 개인정보</div><br>
	        <input type="text" class="join_input_text"  name="name" id="name" placeholder="이름" maxlength="20"><br>
	        <input type="email" class="join_input_text"  name="email" id="email" placeholder="이메일" maxlength="20"><br>
	        <input type="tel" class="join_input_text"  name="phone" id="phone" placeholder="핸드폰 번호" maxlength="20"><br>
			<div class="info" id="info__birth">
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
	        <input type="submit" class="completeBtn" onclick="submitOk()" value="완료" />
        
    </form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
 
<script>
function submitOk(){
    let frm = document.getElementById("frm");
    strId = frm.id.value;
    if (strId.length < 6 || strId.length > 20) {
        let errId = document.getElementById("errId");
        errId.style.display = "block";
        errId.style.color = "red";
        errId.innerHTML="<strong>아이디를 6자~20자의 영문자, 숫자만 사용 가능합니다.</strong>";
        event.preventDefault();
        strId.focus();
 
    }
    return false;
}
 
 
 </script>

</body>
</html>