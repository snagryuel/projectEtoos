<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ETOOS</title>
<link rel="stylesheet" href="../css/main.css" type="text/css">
</head>
<body>
	<jsp:include page="../common/header.jsp">
		<jsp:param value="0" name="page_gubun"/>
	</jsp:include>
	<main>
		<div id="visual">
			<!-- <div class="visual-controller">
			</div> -->
		</div>
		<div class="container">
			<div class="section recomended-teacher">
				<h3 class="title">추천선생님</h3>
				<div class="slide">
					<button class="prev arrow">◀</button>
					<ul>
						<c:forEach var="teacher" items="${teacherList}">
							<li>
								<div class="thum">
									<img src="${teacher.filePath}${teacher.fileName}">
								</div>
								<div class="desc">
									<span>${teacher.name}</span>
									<span>${teacher.tMent}</span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<button class="next arrow">▶</button>
				</div>
			</div>
			<div class="section recomended-course">
				<h3 class="title">추천 강좌</h3>
				<div class="slide">
					<button class="prev arrow">◀</button>
					<ul>
						<c:forEach var="course" items="${courseList}">
							<li>
								<div class="thum">
									<img src="${course.filePath}">
								</div>
								<div class="desc">
									<span>${course.coursename}</span>
									<span>${course.name}</span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<button class="next arrow">▶</button>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
	if(${(param.Err != null) ? true : false}) {
		alert("잘못된 접근입니다.");
	}
	
	</script>
</body>
</html>