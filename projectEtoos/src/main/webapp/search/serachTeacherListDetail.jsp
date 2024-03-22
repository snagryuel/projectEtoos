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
					<form name=form id="searchForm" method="post"
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

					</p>
				</div>
			</div>
			<div class="tap">
					<ul>
						<li class="selected-tap"><span><a href="/projectEtoos/search/searchMain.jsp">전체</a></span></li>
						<li><span><a href="/projectEtoos/search/serachTeacherListDetail.jsp">선생님</a></span></li>
						<li><span><a href="/projectEtoos/search/searchCourseListDetail.jsp">강좌</a></span></li>
						<li><span><a href="/projectEtoos/search/searchNotiListDetail.jsp">공지사항</a></span></li>
					</ul>
				</div>
	

			<div class="contents_teacherlist" id="teacherList">
				<div class="tsection">
					<p id="title_g">선생님</p>

					<c:if test="${not empty searchResults}">
						<c:forEach var="result" items="${searchResults}">

							<div>
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
					<c:if test="${empty searchResults}">
						<p><%=searchWord%>
							검색결과가 존재하지 않습니다
						</p>
					</c:if>

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