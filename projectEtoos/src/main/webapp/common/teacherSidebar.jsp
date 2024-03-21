<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<aside id="side">
	<h1><a href="#">이투스 선생님</a></h1>
	<ul>
		<li class="depth1 selected">
			<div><a href="#">국어영역</a><span>-</span></div>
			<ul class="on">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
				<li class="depth2"><a href="#">선생님3</a></li>
				<li class="depth2"><a href="#">선생님4</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">수학영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">영어영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">사회탐구영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">과학탐구영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">한국사영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
		</li>
		<li class="depth1">
			<div><a href="#">제2외국어영역</a><span>+</span></div>
			<ul class="off">
				<li class="depth2"><a href="#">선생님1</a></li>
				<li class="depth2"><a href="#">선생님2</a></li>
			</ul>
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