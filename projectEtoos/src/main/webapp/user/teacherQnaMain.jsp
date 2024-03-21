<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">선생님 Q&A</h1>
		<div class="topDiv">
			<div class="topBtns">
				<input type="submit" class="topBtn" id="noticeHideBtn" value="공지 숨기기" >
				<input type="submit" class="topBtn" id="viewPostBtn" value="내 글 보기" >
			</div>
			
			<div class="writerDiv">
				<input type="submit" class="writerBtn" id="writerBtn" value="작성하기" >
			</div>
		</div>
		<div class="qnaBorad">
			<form>
            <table class="qnaTable" id="qnaTable">
       			<tr>
       				<th>번호</th>
       				<th>제목</th>
       				<th>작성자</th>
       				<th>조회수</th>
       				<th>작성일</th>
       			</tr>
       			
       			<tr class="notice">
       				<td class="noticeNum"><p>공지</p></td>
       				<td><a href="#">(필독)공지입니다.</a></td>
       				<td>김현수 선생님</td>
       				<td>2</td>
       				<td>2024.03.18</td>
       			</tr>
       			
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
				<p> <<  1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |  >> </p>
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

</script>
</body>
</html>