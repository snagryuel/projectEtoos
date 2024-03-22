<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 완료</title>
<link rel="stylesheet" href="/projectEtoos/css/pwdFindComplete.css" type="text/css">
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
	<h4>새로운 비밀번호로 변경이 완료되었습니다.</h4>
</div>


 <div id="content">
 	<div>
		<input type="submit" class="loginGo" id="loginGo" name="loginGo"  value="로그인하러 가기" >
	</div>
</div>


<%@ include file="/common/footer.jsp" %>

<script>
document.querySelector("#loginGo").addEventListener("click", function(e){
	location.href = "Login.do";	
}, false);

</script>

</body>
</html>