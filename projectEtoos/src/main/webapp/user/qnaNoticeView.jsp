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
		<h1 id="title"><img class="qnaSymbol" alt="qnaSymbol" src="/projectEtoos/img/noticeSymbol.png"/>공지사항</h1>
		
		<div class="qnaViewDiv">
			 <div class="qnaViewTable">
	           <table>
	            <tr>
	                <th>[공지] 2025 Euphoria : EBS 수능특강 개강 취소 안내</th>
	                <th>2024.03.11 |</th>
	                <th>조회수</th>
	               
	            </tr>
	            <tr>
					<td>안녕하세요, 이투스입니다.<br>
						전년도 높은 내신 적중률로 많은 사랑을 받았던<br>
						Euphoria : EBS 수능특강 변형 강좌가<br>
						2025시즌에는 개강이 취소 되었음을 안내 드립니다.<br>
						학업 계획에 차질을 주게 된 점 양해 부탁 드리며,<br>
						유포리아의 공백을 더 양질의 컨텐츠로 효과적인 수능 대비가 가능할 수 있도록 하겠습니다.<br><br>
						감사합니다.
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
					<td>[2025 수능 대비] 여러분 다들 반갑습니다!!ㅎㅎ</td>
				<tr>
				<tr>
					<td>이전글</td>
					<td>김현수T 현장강의 개강일정 안내(24.02.27ver)</td>
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