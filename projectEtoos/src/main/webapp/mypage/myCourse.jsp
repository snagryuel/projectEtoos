<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="/projectEtoos/css/reset.css" type="text/css">
<link rel="stylesheet" href="/projectEtoos/css/mypage.css" type="text/css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/footer.jsp" %>
<jsp:include page="../common/mypageSidebar.jsp" >
	<jsp:param value="1" name="sideNum"/>
</jsp:include>
	<main>
		<div class="container">
			<div class="title">
				<h2>내 강좌 보기</h2>
				<hr>
			</div>
			<div class="course">
				<table>
				<tr>
					<td><img src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg"/></td>
					<td class="courseName">천재교육의 천재적인 강좌</td>
					<td class="courseView"><button>강좌보기</button></td>
				</table>
			</div>
			<hr>
			<hr>
		</div>
	</main>
</body>
</html>