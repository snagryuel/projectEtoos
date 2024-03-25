<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
			<div class="titleElement">
				<span>${qnaNoticeView.title}</span><input type="text" class="qnaTitle" name="qnaTitle" id="qnaTitle" value=""  maxlength="30">
				<hr>
			</div>
			
			<div class="qnaContElement">
				<textarea name="qnaContent" id="qnaContent" maxlength="1000"  rows="20" cols="80"></textarea>
			</div>
			
			<div class="qnaBtnElement">
				<input type="submit" class="saveBtn" name="saveBtn" id="saveBtn" value="저장" />
				<input type="submit" class="listBtn" name="listBtn" id="listBtn" value="목록" />
			</div>
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
	
	
}, false);

document.querySelector("#listBtn").addEventListener("click", function(e){
	if(confirm("작성 중인 내용이 사라집니다. 목록으로 가시겠습니까??")){
		window.location = "/projectEtoos/user/teacherQnaMain.jsp";
	}
}, false);
</script>

</body>
</html>