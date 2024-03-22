<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
<link rel="stylesheet" href="../css/reset.css" type="text/css">
<link rel="stylesheet" href="../css/user.css" type="text/css">
</head>
<body>
	<div class="authChekDiv">
		<h2>아이디 중복 체크</h2>
		<hr>
		<form id="frm" class="authCheckForm" action="/projectEtoos/user/AuthChek.do" method="post">
			<input type="text" class="inputIdBox" name="id" id="id" <c:if test='${requestScope.authYN == "Y"}'>readonly</c:if> value="${id}">
			<input type="hidden" name="authYN" id="authYN" value="${param.authYN}" class="authYN">
			<c:if test="${ param.authYN == 'N' || param.authYN == null }"><button id="check" class="overlapBtn">중복확인</button></c:if>
		</form>
	</div>
	<div class="checkMsg">
		<c:if test="${ param.authYN == 'Y' }"><p>중복확인 완료되었습니다.<br>사용을 원하시면, 아래 [확정]을 눌러주세요.</p></c:if>
		<c:if test="${ param.authYN == 'N' }"><p>이미 사용중인 아이디 입니다. 다른 아이디로 확인해주세요</p></c:if>
		<c:if test="${ param.authYN == 'Y' }"><button id="send" class="sendBtn">확정</button></c:if>
		<c:if test="${ param.authYN == 'Y' }"><button id="reset" class="resetBtn">초기화</button></c:if>
	</div>
<script>
const rexForId = /^[0-9a-zA-Z]{6,20}$/;

let frm = document.querySelector("#frm");
frm.addEventListener("submit", (e)=>{
	e.preventDefault();
	
	let idVal = document.querySelector("#id").value;
	if (idVal != null) {
		idVal = idVal.trim();
		if(!rexForId.test(idVal)) {
			alert("아이디는 6~20자의 영문자, 숫자만 사용 가능합니다.");
			return;
		}
	} else {
		alert("아이디를 입력해주세요.");
		return;
	}
	frm.submit();
})

let send = document.querySelector("#send");
send.addEventListener("click", ()=>{
	opener.document.querySelector("#id").value = document.querySelector("#id").value;
	opener.document.querySelector("#authYN").value = document.querySelector("#authYN").value;
	window.close();
})

let reset = document.querySelector("#reset");
reset.addEventListener("click", ()=>{
	window.location = "/projectEtoos/user/authCheckPop.jsp";
})
</script>
</body>
</html>