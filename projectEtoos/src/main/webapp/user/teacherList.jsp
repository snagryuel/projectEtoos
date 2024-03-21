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
<jsp:include page="../common/teacherSidebar.jsp">
		<jsp:param value="1" name="page_gubun"/>
</jsp:include>
<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">선생님</h1>
		<div class="wrapper">
		<div class="tap">
			<ul>
				<li class="selected-tap"><span>국어</span></li>
				<li><span>수학</span></li>
				<li><span>영어</span></li>
				<li><span>사회탐구</span></li>
				<li><span>과학탐구</span></li>
				<li><span>한국사</span></li>
				<li><span>제2외국어</span></li>
			</ul>
		</div>
		<div class="contents">
			<div class="section">
				<p class="title">세부과목 명</p>
				<div class="list">
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article><article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
					<article>
						<span>선생님 멘트 입니다.</span>
						<span>선생님1</span>
						<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
						</div>
					</article>
				</div>
			</div>
		</div>
		</div>
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
<script>
let lies = document.querySelectorAll(".tap > ul > li");
for (let li of lies) {
	li.addEventListener("click", ()=>{
		for (let li2 of lies) {
			console.log(li2);
			li2.classList.remove("selected-tap");
		}
		li.classList.add("selected-tap");
	})
}
</script>
</body>
</html>