<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<link rel="stylesheet" href="/projectEtoos/css/findAccount.css" type="text/css">
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
	<h3>통합회원 계정 찾기</h3>
</div>

 <div id="content">
 	<div>
		<input type="submit" class="findId" id="findId" name="findId" value="아이디 찾기" >
		<input type="submit" class="findPwd" id="findPwd" name="findPwd" value="비밀번호 찾기" >
	</div>
</div>


<%@ include file="/common/footer.jsp" %>
<script>
document.querySelector("#findId").addEventListener("click", (e)=>{
	window.location = "FindYourInfo.do?step=2&flag=id";
})

document.querySelector("#findPwd").addEventListener("click", (e)=>{
	window.location = "FindYourInfo.do?step=2&flag=pwd";
})
</script>
</body>
</html>