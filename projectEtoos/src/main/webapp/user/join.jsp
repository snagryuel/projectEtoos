<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="/projectEtoos/css/join.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="header">
	<div id="prevLogin">
		<a href="#"><</a>
	</div>
	<div id="headerTitle">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<a href="#"><img class="x-symbol" alt="x-symbol" src="/projectEtoos/img/xSymbol.png"/></a>
	</div>
</div>



 <div id="content">
	<img class="logo" alt="logo" src="/etoos_test/img/logo.jpg">
	<div class="select">
        <input type="radio" id="select" name=""><label for="select">14세 미만 학생</label>
        <input type="radio" id="select2" name="student"><label for="select2">학생</label>
        <input type="radio" id="select3" name=""><label for="select3">학부모/일반</label>
        <input type="radio" id="select4" name=""><label for="select4">교/강사</label>
	</div>
	
	<div class="login_info">
        이미 가입 하셨나요?<a> |</a>
        <a id="loginNow" href="#">로그인하기</a><br><br>
    </div>
</div>



</body>
</html>