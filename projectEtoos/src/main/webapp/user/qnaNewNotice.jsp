<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Teacher</title>
<link rel="stylesheet" href="../css/user.css" type="text/css">
</head>

<body>
<jsp:include page="../common/header.jsp">
		<jsp:param value="1" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/teacherDetailSidebar.jsp">
		<jsp:param value="2" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title"><img class="noticeSymbol" alt="noticeSymbol" src="/projectEtoos/img/noticeSymbol.png"/>공지사항</h1>
		
		<div class="qnaDiv">
			<form id="frmNoticeRegist" method="post" action="/projectEtoos/user/qnaNewNotice.do">
				<div class="titleElement">
					<span>제목</span><input type="text" class="qnaTitle" name="title" id="qnaTitle" value=""  maxlength="30">
					<hr>
				</div>
				
				<div class="qnaContElement">
					<textarea name="contents" id="qnaContent" maxlength="1000"  rows="20" cols="80"></textarea>
				</div>
				
				<div class="qnaBtnElement">
					<input type="submit" class="saveBtn" name="saveBtn" id="saveBtn" value="저장" form="frmRegist"/>
					<input type="submit" class="listBtn" name="listBtn" id="listBtn" value="목록" form="frmRegist"/>
				</div>
			</form>
		</div>
	</div>
</main>
<script>

document.querySelector("#saveBtn").addEventListener("click", function(e){
	const qnaTitle = document.querySelector("#qnaTitle");
	const qnaContent = document.querySelector("#qnaContent");
	
	if(qnaTitle.value.length == "") {
		e.preventDefault();
		qnaTitle.focus();
		return alert("제목을 입력하세요.");
	}
	
	if(qnaContent.value.length == "") {
		e.preventDefault();
		qnaTitle.focus();
		return alert("내용을 입력하세요.");
	}
	
	const frmNoticeRegist = document.querySelector("#frmNoticeRegist");
	frmNoticeRegist.submit();
	
}, false);

document.querySelector("#listBtn").addEventListener("click", function(e){
	if(confirm("작성 중인 내용이 사라집니다. 목록으로 가시겠습니까??")){
		window.location = "/projectEtoos/user/teacherQnaMain.do";
	}
}, false);


document.querySelector("#frmNoticeRegist").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 동작(페이지 이동)을 막습니다.
    
    var action = this.getAttribute("action"); // form의 action 속성 값을 가져옵니다.
    console.log("Form action 경로:", action); // 콘솔에 action 경로를 출력합니다.
    
    // 여기서 다른 작업을 수행하거나 서버로 form 데이터를 전송할 수 있습니다.
    // 예를 들어, fetch API를 사용하여 서버로 데이터를 전송할 수 있습니다.
});
</script>

</body>
</html>