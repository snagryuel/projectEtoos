<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
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
		<jsp:param value="1" name="page_gubun"/>
	</jsp:include>
	<main>
		<div class="container">
			<h1 id="title">회원 조회</h1>
			<div class="search-area">
				<form id="frm">
					<input type="text" name="name" id="name" value="${name }" maxlength="20">
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
							<th>생년월일</th>
							<th>가입일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "member" items="${memberList }">
							<tr>
								<td>0</td>
								<td>${member.name }</td>
								<td>${member.id }</td>
								<td>${member.birth }</td>
								<td>${member.joinday }</td>
								<td><button onclick="memberdelete('${member.id}');">삭제</button></td>
							</tr>
						</c:forEach>
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
	<c:if test="${loginYN ne 'Y'}">
		<script type="text/javascript" src="../js/logincheck.js" ></script>
	</c:if> 
	<script>
		function memberdelete(id){
			if(confirm("정말로 삭제하시겠습니까?")){
				window.location = "/projectEtoos/memberDelete.do?id="+id;
			}
		}
	</script>
</body>
</html>