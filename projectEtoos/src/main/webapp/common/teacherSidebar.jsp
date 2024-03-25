<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<aside id="side">
	<h1><a href="#">이투스 선생님</a></h1>
	<ul>
		<c:forEach var="sub" items="${sub2List}" varStatus="status1">
			<li class="depth1 <c:if test="${param.sub1 == sub.key}">selected </c:if>">
				<div><a href="#">${sub.key}</a><span>-</span></div>
				<ul <c:if test="${param.sub1 == sub.key}"> class="on"</c:if> <c:if test="${param.sub1 != sub.key}"> class="off"</c:if>>
				<c:forEach var="sub2" items="${sub.value}">
					<c:set var="sub1sub2" value="${sub.key}-${sub2}" />
					<c:forEach var="teacher" items="${teacherList[sub1sub2]}" varStatus="status2">
							<li class="depth2 <c:if test="${param.sub1 == sub.key}">selected </c:if>"><a href="/projectEtoos/user/TeacherDetailList.do?teacherId=${teacher.id}">${teacher.name}</a></li>
					</c:forEach>
				</c:forEach>
				</ul>
			</li>
		</c:forEach>
	</ul>
</aside>
<script>
	let depth1es = document.querySelectorAll(".depth1");
	
	for(let depth1 of depth1es) {
		depth1.addEventListener("click", ()=>{
			for(let target of depth1es) {
				target.classList.remove("selected");
				target.children[1].classList.remove("on");
				target.children[1].classList.add("off");
			}
			depth1.classList.add("selected");
			depth1.children[1].classList.add("on");
			depth1.children[1].classList.remove("off");
		})
	}
</script>