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
		<h1 id="title"><img class="qnaSymbol" alt="qnaSymbol" src="/projectEtoos/img/qnaSymbol.png"/>학습 Q&A - 답변</h1>
		
		<div class="qnaViewDiv">
			 <div class="qnaViewTable">
	           <table>
	            <tr>
	                <th>조계헌 학생, 답변입니다.</th>
	                <th>2024.02.28 |</th>
	                <th>조회수</th>
	               
	            </tr>
	            <tr>
					<td>아까도 얘기했듯이,<br>
						문장 맨 앞에 오는 경우에는<br>
						1. 명사(주어)<br>
						2. 부사(목적)<br>
						둘 중에 하나일 가능성이 높습니다.<br>
						해당 문장의 경우 쉼표 뒤에 we라는 주어가 나오므로,<br>
						To make는 부사(목적)로 보는 게 적합할 듯합니다 ㅎㅎ<br>
					</td>
					<td colspan="3"></td>
				</tr>
	            </table>

	        </div> 

			
			<div class="qnaBtnElement">
				<input type="submit" class="listBtn" name="listBtn" id="listBtn" value="목록" />
			</div>
			
			<div class="preNextDiv">
				<table>
				<tr>
					<td>다음글</td>
					<td>동명사, 분사에 관한 질문입니다!</td>
				<tr>
				<tr>
					<td>이전글</td>
					<td>문포독 033페이지 연습문제 6번 질문드려요.</td>
				<tr>
				</table>
			</div>
		</div>
	</div>
</main>

<script>
document.querySelector("#listBtn").addEventListener("click", function(e){
	if(confirm("작성 중인 내용이 사라집니다. 목록으로 가시겠습니까??")){
		window.location = "/projectEtoos/user/teacherQnaMain.jsp";
	}
}, false);
</script>

</body>
</html>