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
		<h1 id="title"><img class="qnaSymbol" alt="qnaSymbol" src="/projectEtoos/img/qnaSymbol.png"/>학습 Q&A</h1>
		
		<div class="qnaViewDiv">
			 <div class="qnaViewTable">
	           <table>
	            <tr>
	                <th>문포독 기초 48p 연습문제 질문 드려요.</th>
	                <th>2024.02.27 |</th>
	                <th>조회수</th>
	               
	            </tr>
	            <tr>
					<td>4번에서 to make가 명사인지 부사인지는 어떻게 구분하나요? <br>4번 쉼표 전 문장구조를 잘 모르겠어요..</td>
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