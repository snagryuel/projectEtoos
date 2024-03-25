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
		<h1 id="title"><img class="qnaSymbol" alt="qnaSymbol" src="/projectEtoos/img/noticeSymbol.png"/>공지사항</h1>
		
		<div class="qnaViewDiv">
			 <div class="qnaViewTable">
	           <table>
	          
				 <tr>
	                <th>${qnaNoticeView.title}</th>
	                <th>${qnaNoticeView.regDate} |</th>
	                <th>${qnaNoticeView.readCnt}</th>
	               
	            </tr>
	            <td>
	            	<c:if test="${not empty qnaNoticeView}">
                        ${qnaNoticeView.contents}
                 	</c:if>
                </td>
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
					<td>김현수T 현장강좌 개강일정 안내(24.02.27ver)</td>
				<tr>
				</table>
			</div>
		</div>
	</div>
</main>

<script>

document.querySelector("#listBtn").addEventListener("click", function(e){
	if(confirm("작성 중인 내용이 사라집니다. 목록으로 가시겠습니까??")){
		window.location = "/projectEtoos/user/teacherQnaMain.do";
	}
}, false);


</script>

</body>
</html>