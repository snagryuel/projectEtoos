<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="/projectEtoos/css/login.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="header">
	<div id="headerTitle">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<a href="#"><img class="x-symbol" alt="x-symbol" src="/projectEtoos/img/xSymbol.png"/></a>
	</div>
</div>

 <div id="content">
        <img class="logo" alt="logo" src="/projectEtoos/img/logo.jpg">
        <form id="frm" name="frm">
            <input type="text" name="id" id="id" class="login_input_text"  placeholder="아이디"><br>
            <input type="password" name="pwd" id="pwd" class="login_input_text" placeholder="비밀번호"><br>
            <div id="errId" style="display: none;"></div>
            <input type="submit" class="login_input_btn" value="Login" onclick="loginOk()" >
        </form>
        <div class="find_info"><br>
            <a id="find_id" href="#">아이디 찾기</a><a> |</a>
            <a id="find_password" href="#">비밀번호 찾기</a>
        </div>
  </div>
  
  <script>
  
function loginOk() {
	let frm = document.getElementById("frm");
	let errId = document.getElementById("errId");
	
	strId = frm.id.value;
    if (strId.length == "") {
        
        errId.style.display = "block";
        errId.style.color = "red";
        errId.innerHTML="<strong>아이디를 입력하세요</strong>";
        event.preventDefault();
        document.getElementById("id").focus();
        
        return false;
        event.preventDefault();

    }
 
     strPwd = frm.pwd.value;
     if (strPwd == "") {
         errId.style.display = "block";
         errId.style.color = "red";
         errId.innerHTML="<strong>비밀번호를 입력하세요</strong>";
         event.preventDefault();
         document.getElementById("id").focus();
         
         return false;
         
       	 //if(strId != "실제 아이디")  {
         //errId.style.display = "block";
         //errId.style.color = "red";
         //errId.innerHTML = "<strong>아이디가 존재하지 않습니다.</strong>";
         //event.preventDefault();
       	 //}
       
       	 //if(strPwd != "실제 비밀번호")  {
         //비밀번호가 일치하지 않는 경우
         //errId.innerHTML = "<strong>비밀번호가 일치하지 않습니다.</strong>";
         //event.preventDefault();
         //}
     }
     

}
 
</script>

</body>
</html>