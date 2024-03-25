<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ETOOS</title>
<link rel="stylesheet" href="../css/main.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
				<div class="slide swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="teacher" items="${teacherList}">
							<li class="swiper-slide">
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
				</div>
			</div>
			<div class="section recomended-course">
				<h3 class="title">추천 강좌</h3>
				<div class="slide swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach var="course" items="${courseList}">
							<li class="swiper-slide">
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
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
	if(${(param.Err != null) ? true : false}) {
		alert("잘못된 접근입니다.");
	}
	
	const mySwiper = new Swiper('.swiper-container', {
		direction: 'horizontal',
		slidesPerView: 3,
	 scrollbar: {
		    el: '.swiper-scrollbar',
		    hide: true
		  }
	});
	</script>
</body>
</html>