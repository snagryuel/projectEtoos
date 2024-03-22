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

<div id=titleContents>
	<div id="title">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<%@ include file="/common/loginHeader.jsp" %>
	</div>
</div>

 <div id="content">
 	<div>
        <img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
        <form id="frm" name="frm" action = "LoginOk.do" method="post">
            <input type="text" name="id" id="id" class="login_input_text"  placeholder="아이디"><br>
            <input type="password" name="pwd" id="pwd" class="login_input_text" placeholder="비밀번호"><br>
            <div id="errId" style="display: none;"></div><br>
            <input type="submit" class="login_input_btn" value="Login" onclick="loginOk()" >
        </form>
        <div class="find_info"><br>
            <a id="find_id" href="FindYourInfo.do?step=1&flag=">계정 찾기</a><a> |</a>
            <a id="joinPage" href="Join.do">회원가입</a>
        </div>
  	</div>
  </div>
  
  <%@ include file="/common/footer.jsp" %>

  
  

  
 <script>
 let errId = document.getElementById("errId");
 errId.style.display = "block";
 errId.style.color = "red";
 
 if (${(param.errMsg != null)? true : false}){
	 errId.innerHTML="<strong>존재하지 않는 회원 입니다.</strong>";
 }
  
function loginOk() {
	let frm = document.getElementById("frm");
	
	
    
	strId = frm.id.value;
    if (strId.length == "") {
        errId.innerHTML="<strong>아이디를 입력하세요</strong>";
        event.preventDefault();
        document.getElementById("id").focus();
        return;
    }
 
     strPwd = frm.pwd.value;
     if (strPwd == "") {
         errId.innerHTML="<strong>비밀번호를 입력하세요</strong>";
         event.preventDefault();
         document.getElementById("id").focus();
         return;
     }
}
 
</script>
</body>

</html>