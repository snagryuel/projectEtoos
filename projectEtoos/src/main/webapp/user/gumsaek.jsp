<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/gumsaek.css" type="text/css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/user.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">

</head>
<body>
	<jsp:include page="../common/header.jsp">
		<jsp:param value="0" name="page_gubun" />
	</jsp:include>

	<main>

		<div class="container center">
			<div class="wrapper">
				<div class="gumsaekbar">
					<ul>
						<li><input type="text" name="search_word" id="search_word"
							value="" maxlength="20" /></li>
					</ul>
				</div>

				<div class="gumsaekGyelGwa">
					<p id="gyeolGwadata">ㅇㅇㅇ 에 대한 검색결과 00건</p>
				</div>
			</div>

			<div class="tap">
				<ul>
					<li class="selected-tap"><span>전체</span></li>
					<li><span>선생님</span></li>
					<li><span>강좌</span></li>
					<li><span>공지사항</span></li>
				</ul>
			</div>


			<div class="contents_teacherlist">
				<div class="tsection">
					<p id="title_g">선생님</p>
					
					<ul class="search_teacher sch_ul">
						<li class="sch_t">
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
									<strong>수학</strong> &nbsp; <font style="color: #b16e61">정승제</font>
									선생님 &nbsp;&nbsp;
								</div>
							</div>
						</li>

					</ul>


				</div>

				<!-- 강좌 예정 틀 -->
				<div class="courseList">
					<div class="coursesection">
					<div class="listTitle">
						<p id="title_g">강좌 <button type="button" class= "gumsaekdeo">더보기</button>
						
						</p>

						<ul class="search_teacher sch_ul">
							<li class="sch_t">
								<div class="sch_c teacher_img">
									<div class="img">
										<img
											src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
											alt="">
									</div>
									<p class="imgTName">정승제 선생님</p>

								</div>
								<div class="sch_c">
									<span class="sch_tis">기초가 부족한 고1 학생들을 위해</span>
									<div class="sch_ti">
										<strong>수학의 기초 (예비고 1학생을 위한) </strong>

									</div>
								</div>
							</li>

						</ul>
				</div>
						
						
						<ul class="search_teacher sch_ul">
							<li class="sch_t">
								<div class="sch_c teacher_img">
									<div class="img">
										<img
											src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
											alt="">
									</div>
									<p class="imgTName">정승제 선생님</p>

								</div>
								<div class="sch_c">
									<span class="sch_tis">기초가 부족한 고1 학생들을 위해</span>
									<div class="sch_ti">
										<strong>수학의 기초 (예비고 1학생을 위한) </strong>

									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
				
				<!-- ------------------------------- -->
				
				
				<!-- 공지 예정 틀 -->
				<div class="gonjiList">
					<div class="coursesection">
					<div class="listTitle">
						<p id="title_g">공지 <button type="button" class= "gumsaekdeo">더보기</button>
						
						</p>
						<ul class="search_teacher sch_ul">
							<li class="sch_t">
								<div class="sch_c teacher_img">
									<div class="img">
										<img
											src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
											alt="">
									</div>
									<p class="imgTName">정승제 선생님</p>

								</div>
								<div class="sch_c">
									<div class="sch_ti">
										<strong>안내말씀 드립니다.</strong>

									</div>
									<br> <span class="sch_tis">기초가 부족한 고1 학생들을 위해</span>
								</div>
							</li>
						</ul>

						<ul class="search_teacher sch_ul">
							<li class="sch_t">
								<div class="sch_c teacher_img">
									<div class="img">
										<img
											src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
											alt="">
									</div>
									<p class="imgTName">정승제 선생님</p>

								</div>
								<div class="sch_c">
									<div class="sch_ti">
										<strong>안내말씀 드립니다.</strong>

									</div>
									<br> <span class="sch_tis">기초가 부족한 고1 학생들을 위해</span>
								</div>
							</li>
						</ul>
							</div>
					</div>
				</div>
<!-- ------------------------------- -->

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