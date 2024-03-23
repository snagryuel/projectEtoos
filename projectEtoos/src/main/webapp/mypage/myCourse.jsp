<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="/projectEtoos/css/reset.css" type="text/css">
<link rel="stylesheet" href="/projectEtoos/css/user.css" type="text/css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/footer.jsp" %>
<jsp:include page="../common/mypageSidebar.jsp" >
	<jsp:param value="1" name="sideNum"/>
</jsp:include>
	<main>
		<div id="empty"></div>
		<div class="container">
			<h1 id="title">내 강좌 보기</h1>
			<div class="wrapper">
				<table style="width : 100%;">
					<tr>
						<th></th>
						<th>강좌 명</th>
						<th>선생님</th>
						<th>과목</th>
						<th>신청일</th>
						<th>강좌보기</th>
					</tr>
				<c:choose>
					<c:when test="${list[0].courseIdx != null}">
						<c:forEach var="e" items="${list}" varStatus="status">
							<tr>
								<td><img src="${e.filePath}/${e.fileName}" width="100" height="100"/></td>
								<td>${e.courseName}</td>
								<td>${e.teacherName}</td>
								<td>${e.sub1} - ${e.sub2}</td>
								<td>${e.applicationDate}</td> 
								<td><button data-courseidx="${e.courseIdx}" class="goCourseBtn" onclick="goCourseView(this)">강좌보기</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">신청한 내역이 없습니다.</td>
						<tr>
					</c:otherwise>
				</c:choose>				
				</table>
			</div>
		</div>
	</main>
	<script>
		function goCourseView(item) {
			window.location = "/projectEtoos/user/CourseList_course.do?courseIdx="+item.dataset.courseidx;
		}
	</script>
</body>
</html>