<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<aside id="side">
	<h1><a href="#">전체 강좌</a></h1>
	<ul>
		<li class="depth1 selected">
			<div><a href="#">강좌 검색 및 신청</a><span>-</span></div>
		</li>
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