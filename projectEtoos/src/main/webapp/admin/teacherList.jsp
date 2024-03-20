<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
<link rel="stylesheet" href="../css/admin.css" type="text/css">
<title>Admin</title>
</head>
<body>
	<jsp:include page="./sideBar.jsp">
		<jsp:param value="2" name="page_gubun"/>
	</jsp:include>
	<main>
		<div class="container">
			<div class="search-area">
				<form id="frm">
					<input type="text" name="name" id="name" value="" maxlength="20">
					<button type="submit">검색</button>
				</form>
			</div>
			<div class="list">
				<p>총 000건</p>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>이름</th>
							<th>아이디</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>생년월일</th>
							<th>가입일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>장지현</td>
							<td>Geehyun</td>
							<td>국어</td>
							<td></td>
							<td>1996-10-17</td>
							<td>2024-03-20</td>
							<td><button>삭제</button></td>
						</tr>
					</tbody>
				</table>
				<div class="paging">
					<ul>
						<li><a href="">◀</a></li>
						<li><a href="" class="selected">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">▶</a></li>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/common/footer.jsp" %>
</body>
</html>