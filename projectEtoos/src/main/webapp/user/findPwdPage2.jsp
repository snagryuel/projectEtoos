<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/projectEtoos/css/findPwdPage2.css" type="text/css">
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
	<h4>새로운 비밀번호로 변경해 주세요.</h4>
</div>

<div id="content">
	<div>
		
	<form name="frm" id="frm" action="FindInfoOk.do?flag=pwd" method="post">
       	<input type="text" name="authYN" value="${requestScope.authYN}" readonly>
       	<input type="text" name="id" value="${requestScope.id}" readonly>
        <input type="password" class="input_text"  name="pwd" id="pwd" value="" placeholder="영문 + 숫자 + 특수문자 포함 8~20자 이하" maxlength="20"><br>
        <input type="password" class="input_text"  name="pwd2" id="pwd2" value="" placeholder="비밀번호 재입력" maxlength="20"><br>
        <div id="errId" style="display: none;"></div><br>

        <input type="submit" class="completeBtn" name="completeBtn" id="completeBtn" value="확인" />
        <input type="submit" class="cancelBtn" name="cancelBtn" id="cancelBtn" value="취소" />
    </form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
 
<script>
if (${requestScope.errMsg == null ? false : true}) {
	alert("비밀번호 변경에 실패하였습니다.");
}

const rexForPwd = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@!#])[A-Za-z\d@!#]{8,20}$/;

let frm = document.querySelector("#frm");
frm.addEventListener("submit", function(e){
	e.preventDefault();
	

	const pwd = document.querySelector("#pwd");
	const pwdVal = document.querySelector("#pwd").value;
	const pwd2 = document.querySelector("#pwd2");
	const pwd2Val = document.querySelector("#pwd2").value;
	
	let errId = document.getElementById("errId");
    errId.style.display = "block";
    errId.style.color = "red";
  
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
    
    frm.submit();
}, false);




 </script>

</body>
</html>