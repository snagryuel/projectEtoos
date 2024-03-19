<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="./css/common.css" type="text/css">
<link rel="stylesheet" href="./css/reset.css" type="text/css">

<div id="header">
	<div class="container">
		<div class="nav">
			<h1><a href="#"><img src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg"></a></h1>
			<ul>
				<li><a href="#" id="teacher">선생님</a></li>
				<li><a href="#" id="course">전체강좌</a></li>	
				<!--검색바  -->
				<li>
				<input type="text" name="search_word" id="search_word" value="" maxlength="20" />
				<!-- &nbsp;<input type="button" name="btn_search" id="btn_search" value="검색" /> -->
				</li>
				<li><button id="login">로그인</button></li>
				<li><button id="join">회원가입</button></li>
			</ul>
		</div>
		<div class="menu_teacher off">
			<div class="sub">
				<p>선생님</p>
			</div>
		
			<div class="sub">
				<p>국어</p>
				<ul>
					<li><a href="#">김민정</a></li>
					<li><a href="#">신영균</a></li>
					<li><a href="#">그믐달</a></li>
					<li><a href="#">방동진</a></li>
					<li><a href="#">정온</a></li>
				</ul>
			</div>
			
			<div class="sub">
				<p>영어</p>
				<ul>
					<li><a href="#">주혜연</a></li>
					<li><a href="#">김범구</a></li>
					<li><a href="#">권조이</a></li>
					<li><a href="#">그레이스</a></li>
					<li><a href="#">오채은</a></li>
				</ul>
			</div>
		
			<div class="sub">
				<p>수학</p>
				<ul>
					<li><a href="#">정승세</a></li>
					<li><a href="#">강윤구</a></li>
					<li><a href="#">한정윤</a></li>
					<li><a href="#">이하영</a></li>
					<li><a href="#">차현우</a></li>
				</ul>
			</div>
		
			<div class="sub">
				<p>사탐</p>
				
				<div class="sub2">
					<p>일반사회</p>
					<ul>
						<li><a href="#">이지영</a></li>
						<li><a href="#">김현수</a></li>
						<li><a href="#">양호승</a></li>
					</ul>
				</div>
				
				<div class="sub2">
					<p>윤리</p>
					<ul>
						<li><a href="#">이지영</a></li>
						<li><a href="#">김현수</a></li>
					</ul>
				</div>
				
				<div class="sub2">
					<p>지리</p>
					<ul>
						<li><a href="#">이남승</a></li>
						<li><a href="#">이도</a></li>
					</ul>
				</div>
				
				<div class="sub2">
					<p>역사</p>
					<ul>
						<li><a href="#">박윤석</a></li>
					</ul>
				</div>
				
				<div class="sub2">
					<p>통합사회</p>
					<ul>
						<li><a href="#">이지영</a></li>
						<li><a href="#">양호승</a></li>
					</ul>
				</div>
			</div>
			
			<div class="sub">
				<p>과탐</p>
				<div class="sub2">
					<p>물리학</p>
					<ul>
						<li><a href="#">이규철</a></li>
						<li><a href="#">박정호</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>지구과학</p>
					<ul>
						<li><a href="#">안성진</a></li>
						<li><a href="#">최선묵</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>화학</p>
					<ul>
						<li><a href="#">양진석</a></li>
						<li><a href="#">양서현</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>생명과학</p>
					<ul>
						<li><a href="#">이승후</a></li>
						<li><a href="#">박기웅</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>통합과학</p>
					<ul>
						<li><a href="#">이승후</a></li>
						<li><a href="#">박정호</a></li>
						<li><a href="#">김필훈</a></li>
					</ul>
				</div>
			</div>
			
			<div class="sub">
				<p>제2외/한문</p>
				<div class="sub2">
					<p>일본어</p>
					<ul>
						<li><a href="#">진나라</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>아랍어</p>
					<ul>
						<li><a href="#">하지숙</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>중국어</p>
					<ul>
						<li><a href="#">이승우</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>스페인어</p>
					<ul>
						<li><a href="#">이영훈</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>프랑스어</p>
					<ul>
						<li><a href="#">조혜빈</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>독일어</p>
					<ul>
						<li><a href="#">이혜진</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>베트남어</p>
					<ul>
						<li><a href="#">최고아라</a></li>
					</ul>
				</div>
				<div class="sub2">
					<p>한문</p>
					<ul>
						<li><a href="#">박한신</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
let teacher = document.querySelector("#teacher");
let course = document.querySelector("#course");
let sub_teacher = document.querySelector("#header .menu_teacher");
let sub_course = document.querySelector("#header .menu_teacher");

function showOfHide(menu) {
	menu.classList.toggle("off");
}

teacher.addEventListener("mouseover", (e)=>{e.preventDefault();showOfHide(sub_teacher);});
sub_teacher.addEventListener("mouseleave", (e)=>{e.preventDefault();showOfHide(sub_teacher);});

</script>