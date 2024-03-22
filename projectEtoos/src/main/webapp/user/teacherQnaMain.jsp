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
					<input type="submit" class="topBtn" id="viewPostBtn" value="내 글 보기" >
				</c:if>
			</div>
			
			<div class="writerDiv">
				<input type="submit" class="writerBtn" id="writerBtn" value="작성하기" >
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
		    				<td><a href="#">${list.title}</a></td>
		    				<td>${list.id}</td>
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
     			<c:when test="${not empty QnaList}">
     				<c:forEach var="list" items="${QnaList}" varStatus="loop" >
		     			<tr class="qnaList">
		    				<td>${(params.totalCount - (params.pageNo -1)*params.pageSize)}</td>
							<td><a href="view.do?boardIdx=${list=boardIdx}">${list.title}</a></td>
		    				<td>${list.id}</td>
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
    			<tr class="qnaList">
    				<td>17</td>
    				<td><a href="#">질문입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>16</td>
    				<td><a href="#">질문입니다.</a><img class="pwdSymbol" alt="pwdSymbol" src="/projectEtoos/img/pwdSymbol.png"/></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>15</td>
    				<td>ㄴ<span>답변</span><a href="#">&nbsp;답변입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>14</td>
    				<td><a href="#">질문입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>13</td>
    				<td><a href="#">질문입니다.</a></td>
    				<td>이름</td>
    				<td>0</td>
    				<td>2024.03.21</td>
    			</tr>
    			<tr class="qnaList">
    				<td>12</td>
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