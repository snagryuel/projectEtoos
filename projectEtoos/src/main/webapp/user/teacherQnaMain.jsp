<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<jsp:include page="../common/teacherDetailSidebar.jsp">
		<jsp:param value="2" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>


<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">선생님 Q&A</h1>
		<div class="topDiv">
			<div class="topBtns">
				<input type="submit" class="topBtn" id="noticeHideBtn" value="공지 숨기기" >
				<c:if test="${sessionScope.id != null}">
					<input type="button" class="topBtn" id="viewPostBtn" value="내 글 보기" >
				</c:if>
			
			
    			<input type="button" class="writerBtn" id="writerBtn" value="작성하기">
    		<%-- 
    			<c:set var="loginYN" value="${sessionScope.loginYN}" />
				<c:set var="id" value="${sessionScope.id}" />
				<c:set var="gubun" value="${sessionScope.gubun}" />
				<c:choose>
					<c:when test="${loginYN == 'Y'}">
						<c:choose>
							<c:when test="${ gubun != null && gubun == '1' }">
							<p><button id="writerAnswer" class="writerBtn">질문작성</button></p>
							<script>
							let writerAnswer = document.querySelector("#writerAnswer");

							writerAnswer.addEventListener("click", ()=>{
								window.location = "/projectEtoos/user/qnaAnswer.do";
							})
							</script>
							</c:when>
							<c:otherwise>
							<p><button id="writerNotice" class="writerBtn">공지작성</button></p>
							<script>
							let writerNotice = document.querySelector("#writerNotice");
	
							writerNotice.addEventListener("click", ()=>{
								window.location = window.location = "/projectEtoos/user/qnaNewNotice.do";
							})
							</script>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${loginYN != 'Y'}">
						<p><button id="NowWiterAnswer" class="writerBtn">질문작성</button></p>
						<script>
						let NowWiterAnswer = document.querySelector("#NowWiterAnswer");

						NowWiterAnswer.addEventListener("click", ()=>{
							alert("로그인 후 이용 가능합니다.");
							window.location = window.location = "/projectEtoos/user/login.do";
						})

						</script>
					</c:when>
				</c:choose> --%>
			</div>
		</div>
		<div class="qnaBoard">
			<form>
            <table class="qnaTable" id="qnaTable">
            <tr>
				<td colspan="5" style="text-align:left">전체 글 : ${totalCount} 개</td>
			</tr>
     		<tr>
   				<th>번호</th>
   				<th>제목</th>
   				<th>작성자</th>
   				<th>조회수</th>
   				<th>작성일</th>
   			</tr>
       		<tbody>
       		<c:choose>
       			<c:when test="${not empty noticeList}">
     				<c:forEach var="list" items="${noticeList}" varStatus="loop" >
		       			<tr class="notice">
		    				<td class="noticeNum"><p>공지</p></td>
		    				<td><a href="qnaNoticeView.do?boardIdx=${list.boardIdx}">${list.title}</a></td>
		    				<td>${list.teacherId}</td>
		    				<td>${list.readCnt}</td>
		    				<td>${list.regDate}</td>
		    			</tr>
    				</c:forEach>
     			</c:when>
	   			<c:otherwise>
					<tr>
						<td colspan="6">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:otherwise>
   			</c:choose>
   			
     		<c:choose>
     			<c:when test="${not empty qnaList}">
     				<c:forEach var="list" items="${qnaList}" varStatus="loop" >
		     			<tr class="qnaList">
		     				<td>${list.boardIdx}</td>
							<td><a href="view.do?boardIdx=${list=boardIdx}">${list.title}</a></td>
		    				<td>${list.registId}</td>
		    				<td>${list.readCnt}</td>
		    				<td>${list.regDate}</td>
		    				
		    			</tr>
     				</c:forEach>
     			</c:when>
     			<c:otherwise>
					<tr>
						<td colspan="6">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
   			</c:choose>
   			
    			
    			
    			<tr class="qnaList">
    				<td>20</td>
    				<td><a href="#">질문입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>19</td>
    				<td><a href="#">질문입니다.</a><img class="pwdSymbol" alt="pwdSymbol" src="/projectEtoos/img/pwdSymbol.png"/></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>18</td>
    				<td><a href="#">질문입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>


    		</table>
</form>
			
			<div class="paging">
				<ul>
					${page}
				</ul>
			</div>
			<div class="searchDiv">
				<input type="text" class="searchWord" name="searchWord" id="searchWord" value="" maxlength="20">
				<input type="button" class="searchBtn" name="searchBtn" id="searchBtn" value="검색">
			</div>
		</div>
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
<script>



document.querySelector("#writerBtn").addEventListener("click", function(e){
	e.preventDefault(); 
	window.location = "/projectEtoos/user/qnaNewNotice.do";
}, false);



let preves = document.querySelectorAll(".prev");
let nextes = document.querySelectorAll(".next");

for(let i of preves){
	i.addEventListener("click", (e) => {
		if(${(param.pageSelected != null) ? param.pageSelected : 1} == 1) {
			e.preventDefault();
			alert("첫번째 페이지 입니다.");
		} 
	})
}

for(let i of nextes){
	i.addEventListener("click", (e) => {
		if(${(param.pageSelected != null) ? param.pageSelected : 1} >= ${requestScope.totalPage}) {
			e.preventDefault();
			alert("마지막 페이지 입니다.");
		} 
	})

}




 
 

</script>
</body>
</html>