<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
		<div class="wrapper line">
		<div class="tap">
			<ul>
				<c:forEach var="sub1" items="${sub1List}" varStatus="status">
					<li <c:if test="${param.sub1 == sub1}"> class="selected-tap" </c:if>><span data-sub1="${sub1}" onclick="clickAndShow(this)">${sub1}</span></li>
				</c:forEach>
			</ul>
		</div>
		<div class="contents">
			<c:set var="cnt" value="1" />
			<c:forEach var="teacherList" items="${teacherList}" varStatus="status">
				<c:if test="${teacherList.value != '[]'}">
					<c:set var="front">
						${fn:substring(teacherList.key,0,fn:indexOf(teacherList.key,'-'))}
					</c:set>
					<c:set var="back">
						${fn:substring(teacherList.key,fn:indexOf(teacherList.key,'-')+1, fn:length(teacherList.key))}
					</c:set>
					<div class="section <c:if test="${param.sub1 == front}"> onSecion </c:if>">
						<p class="title">${(back != "없음") ? back : ''}</p>
						<div class="list">
							<c:forEach var="teacher" items="${teacherList.value}">
								<article data-id="${teacher.id}" onclick="geDetailTeacher(this)">
									<span>${teacher.tMent}</span>
									<span>${teacher.name}</span>
									<div class="thum">
											<img src="..${teacher.filePath}${teacher.fileName}">
									</div>
								</article>
							</c:forEach>
						</div>
					</div>
					<c:set var="cnt" value="${cnt + 1}"/>
				</c:if>
			</c:forEach>
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
			li2.classList.remove("selected-tap");
		}
		li.classList.add("selected-tap");
	})
}

function clickAndShow(element) {
	window.location = "/projectEtoos/user/TeacherList.do?sub1="+element.dataset.sub1;
}

function geDetailTeacher(element) {
	window.location = "/projectEtoos/user/TeacherDetailList.do?teacherId="+element.dataset.id;
}
</script>
</body>
</html>