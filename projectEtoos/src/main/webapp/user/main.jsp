<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200457/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200481/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200457/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200481/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
					</ul>
					<button class="next arrow">▶</button>
				</div>
			</div>
			<div class="section recomended-course">
				<h3 class="title">추천 강좌</h3>
				<div class="slide">
					<button class="prev arrow">◀</button>
					<ul>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200457/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200481/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200457/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200505/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
						<li>
							<div class="thum">
								<img src="https://img.etoos.com/teacher/teacher/200481/m300x300.png">
							</div>
							<div class="desc">
								<span>제목</span>
								<span>내용</span>
							</div>
						</li>
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