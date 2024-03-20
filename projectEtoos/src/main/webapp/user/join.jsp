<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/projectEtoos/css/join.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="prevLogin">
		<a href="#"><</a>
	</div>
	<div id="headerTitle">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<a href="#"><img class="xSymbol" alt="xSymbol" src="/projectEtoos/img/xSymbol.png"/></a>
	</div>
</div>



 <div id="content">
 	<div>
		<img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
		<h2>ETOOS 이용을 위해</h2>
		<h2>ETOOS통합회원 가입이 진행됩니다.</h2><br>
		<p>회원 유형을 선택하세요.</p>
		<div class="joinGubun">
			<input type="submit" class="joinSelect" id="youngStudent" value="14세 미만 학생" >
			<input type="submit" class="joinSelect" id="student" value="학생" >
			<input type="submit" class="joinSelect" id="parents" value="학부모/일반" >
			<input type="submit" class="joinSelect" id="teacher" value="교/강사" >
		</div>
		
		<br><br>
		
		<div class="login_info">
	        이미 가입 하셨나요?<a> |</a>
	        <a id="loginNow" href="/projectEtoos/user/login.jsp">로그인하기</a><br><br>
	    </div>
	</div>
	

</div>

  <%@ include file="/common/footer.jsp" %>

</body>
</html>