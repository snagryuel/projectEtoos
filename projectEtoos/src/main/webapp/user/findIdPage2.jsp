<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/projectEtoos/css/findIdPage2.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="title">
		<p style="font-size:32px; font-weight:900;"><span style="color:#047f89; font-size:32px; font-weight:900;">E</span>TOOS 통합회원</p>
	</div>
	
	<%@ include file="/common/loginHeader.jsp" %>
</div>


<div id="hTag">
	<h3>아이디 찾기</h3><br>
	<h4>회원님의 정보를 확인해주세요</h4>
</div>


<div id="content">

	<div>
		<!-- 아이디 출력 -->
		<div id="idView">
			<p>${requestScope.id}</p>
		</div>
		<form name="frm" id="frm">
	        <input type="button" class="loginBtn" name="loginBtn" id="loginBtn" value="로그인하러 가기" />
	        <input type="button" class="pwdFindBtn" name="pwdFindBtn" id="pwdFindBtn" value="비밀번호 찾기" /> 
    	</form>

	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
<script>
let loginBtn = document.querySelector("#loginBtn");
let pwdFindBtn = document.querySelector("#pwdFindBtn");

loginBtn.addEventListener("click", ()=>{
	window.location = "Login.do";
})

pwdFindBtn.addEventListener("click", ()=>{
	window.location = "FindYourInfo.do?step=2&flag=pwd";
})
</script> 

</body>
</html>