
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/search.css" type="text/css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/user.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">

<%
String searchWord = request.getParameter("search_word");
if (searchWord == null) {
	searchWord = "";
}
%>

</head>
<body>
	<jsp:include page="../common/header.jsp">
		<jsp:param value="0" name="page_gubun" />
	</jsp:include>
	<main>
		<div class="container center">
			<div class="wrapper">
				<div class="gumsaekbar">
					<form name=form id="searchForm" method="get"
						action="/projectEtoos/search/searchMain.do">
						<ul>
							<li><input type="text" onkeyup="enterkey(event)"
								name="search_word" id="search_word" value="" maxlength="20" />
							</li>
						</ul>
					</form>
				</div>
				<div class="gumsaekGyelGwa">
					<p id="gyeolGwadata"><%=searchWord%>
						에 대한 검색결과 ${resultCount}
						<!-- 이 부분 아직 안될 것 -->

					</p>
				</div>
			</div>
			<div class="tap">
				<ul>

					<li class="selected-tab"><span><a
							href="./searchMain.do?search_word=${keyword }">전체</a></span></li>
					<li><span><a
							href="./searchMain.do?bbs=teacher&search_word=${keyword }">선생님</a></span></li>
					<li><span><a
							href="./searchMain.do?bbs=course&search_word=${keyword }">강좌</a></span></li>
					<li><span><a
							href="./searchMain.do?bbs=notice&search_word=${keyword }">공지사항</a></span></li>

				</ul>
			</div>
			<!-- 선생님 목록결과 -->
			<c:if test="${bbs eq 'teacher' || empty bbs}">
				<div class="contents_teacherlist" id="teacherList">
					<div class="tsection">
						<p id="title_g">
							선생님 <span class="teacherCount"></span>
							<script>
					var ele = document.getElementById('sch_t');
					var eleCount = ele.childElementCount;
					console.log(eleCount);
					</script>
						</p>

						<c:if test="${not empty searchResults1}">
							<c:forEach var="result" items="${searchResults1}">

								<div>
									<ul class="search_teacher sch_ul">
										<li class="sch_t" id="sch_t">
											<div class="sch_c teacher_img">
												<div class="img">
													<img
														src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
														alt="">
												</div>
											</div>
											<div class="sch_c">
												<span class="sch_tis">선생소개소개소개소개</span>
												<div class="sch_ti">
													<strong>"${result.sub1}"</strong> &nbsp; <font
														style="color: #b16e61">${result.name}</font> 선생님
													&nbsp;&nbsp;
												</div>
											</div>
										</li>
									</ul>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${empty searchResults1}">
							<p><%=searchWord%>
								검색결과가 존재하지 않습니다
							</p>
						</c:if>

					</div>
				</div>
			</c:if>
			<!-- 강좌 목록결과 -->
			<c:if test="${bbs eq 'course' || empty bbs}">

				<div class="courseList" id="courseList">
					<div class="coursesection">
						<div class="listTitle">

							<p id="title_g">
								강의
								<button type="button" class="gumsaekdeo">더보기</button>

							</p>

							<c:if test="${not empty searchResults3}">
								<c:forEach var="result" items="${searchResults3}">

									<div>
										<ul class="search_teacher sch_ul">
											<li class="sch_t">
												<div class="sch_c teacher_img">
													<div class="img">
														<img
															src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
															alt="">
													</div>
													<p class="imgTName">${result.name}선생님</p>

												</div>
												<div class="sch_c">
													<span class="sch_tis">${result.tMent}</span>
													<div class="sch_ti">
														<strong>"${result.courseName}" </strong>

													</div>
												</div>
											</li>

										</ul>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty searchResults3}">
								<p><%=searchWord%>
									검색결과가 존재하지 않습니다
								</p>
							</c:if>

						</div>
					</div>
				</div>
			</c:if>
			<!-- 공지 목록결과 -->
			<c:if test="${bbs eq 'notice' || empty bbs}">

				<div class="gonjiList" id="gonjiList">
					<div class="coursesection">
						<div class="listTitle">

							<p id="title_g">
								공지사항
								<button type="button" class="gumsaekdeo">더보기</button>

							</p>

							<c:if test="${not empty searchResults2}">
								<c:forEach var="result" items="${searchResults2}">
									<div>
										<ul class="search_teacher sch_ul">
											<li class="sch_t">
												<div class="sch_c teacher_img">
													<div class="img">
														<img
															src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
															alt="">
													</div>
													<p class="imgTName">${result.name}선생님</p>
												</div>
												<div class="sch_c">
													<div class="sch_ti">
														<strong>${result.title}</strong>

													</div>
													<br> <span class="sch_tis">기초가 부족한 고1 학생들을 위해</span>
												</div>
											</li>
										</ul>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty searchResults2}">
								<p><%=searchWord%>
									검색결과가 존재하지 않습니다
								</p>
							</c:if>

						</div>
					</div>
			</c:if>
			<!-- 공지 끝 -->

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
			
			function enterkey(event) {
			    if (event.keyCode === 13) {
			        event.preventDefault(); // 기본 동작 방지
			        document.getElementById("searchForm").submit();
			    }
			}
			
	
			
			document.addEventListener('DOMContentLoaded', (event) => {
			    // 선생님 섹션의 li 요소 수 계산 및 표시
			    const teacherCount = document.querySelectorAll('.teacherSection > li').length;
			    document.getElementById('teacherCount').textContent = `(${teacherCount})`;

			    // 강좌 섹션의 li 요소 수 계산 및 표시
			    const courseCount = document.querySelectorAll('.courseSection > li').length;
			    document.getElementById('courseCount').textContent = `(${courseCount})`;

			    // 공지사항 섹션의 li 요소 수 계산 및 표시
			    const noticeCount = document.querySelectorAll('.noticeSection > li').length;
			    document.getElementById('noticeCount').textContent = `(${noticeCount})`;
			});
			</script>






	</script>
</body>
</html>