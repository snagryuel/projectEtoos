<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<aside id="side">
	<h1 class="thum"><p></p><img src="${filePath}"></h1>
	<h1><a href="#">${teacherInfo.name}</a></h1>
	<ul>
		<li class="depth1 selected">
			<div>개설강좌(00)</div>
		</li>
		<li class="depth1">
			<div>선생님 Q&A</div>
		</li>
	</ul>
</aside>
<script>
	let depth1es = document.querySelectorAll(".depth1");
	
	for(let depth1 of depth1es) {
		depth1.addEventListener("click", ()=>{
			for(let target of depth1es) {
				target.classList.remove("selected");
			}
			depth1.classList.add("selected");

		})
	}
</script>