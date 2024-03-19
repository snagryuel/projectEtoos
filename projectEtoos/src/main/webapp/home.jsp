<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
 <link rel="stylesheet" href="./css/home.css" type="text/css">


</head>
<body>

<div id="logo" class="logo">
<a href="#">ETOOS</a>
</div>


<div class="header" id="header">
	<ul class="tab_navi" id="tab_navi">
		<li><a href="#">선생님</a></li>
		<li><a href="#">전체강좌</a></li>	
		<!--검색바  -->
		<li>
		<input type="text" name="search_word" id="search_word" value="" maxlength="20" />
		<!-- &nbsp;<input type="button" name="btn_search" id="btn_search" value="검색" /> -->
		</li>
		<li><button id="login">로그인</button></li>
		<li><button id="join">회원가입</button></li>
	</ul>
</div>


<div class="teacher" id="teacher">
	<div>
		<p>선생님</p>
	</div>

	<div class="kor" id="kor">
		<p>국어</p>
		<ul>
			<li><a href="#">김민정</a></li>
			<li><a href="#">신영균</a></li>
			<li><a href="#">그믐달</a></li>
			<li><a href="#">방동진</a></li>
			<li><a href="#">정온</a></li>
		</ul>
	</div>
	
	<div class="eng" id="eng">
		<p>영어</p>
		<ul>
			<li><a href="#">주혜연</a></li>
			<li><a href="#">김범구</a></li>
			<li><a href="#">권조이</a></li>
			<li><a href="#">그레이스</a></li>
			<li><a href="#">오채은</a></li>
		</ul>
	</div>

	<div class="mat" id="mat">
		<p>수학</p>
		<ul>
			<li><a href="#">정승세</a></li>
			<li><a href="#">강윤구</a></li>
			<li><a href="#">한정윤</a></li>
			<li><a href="#">이하영</a></li>
			<li><a href="#">차현우</a></li>
		</ul>
	</div>

	<div class="soc" id="soc">
		<p>사탐</p>
		
		<div class="norSoc" id="norSoc">
			<p>일반사회</p>
			<ul>
				<li><a href="#">이지영</a></li>
				<li><a href="#">김현수</a></li>
				<li><a href="#">양호승</a></li>
			</ul>
		</div>
		
		<div class="yunli" id="yunli">
			<p>윤리</p>
			<ul>
				<li><a href="#">이지영</a></li>
				<li><a href="#">김현수</a></li>
			</ul>
		</div>
		
		<div class="jiri" id="jiri">
			<p>지리</p>
			<ul>
				<li><a href="#">이남승</a></li>
				<li><a href="#">이도</a></li>
			</ul>
		</div>
		
		<div class="yucsa" id="yucsa">
			<p>역사</p>
			<ul>
				<li><a href="#">박윤석</a></li>
			</ul>
		</div>
		
		<div class="totSoc" id="totSoc">
			<p>통합사회</p>
			<ul>
				<li><a href="#">이지영</a></li>
				<li><a href="#">양호승</a></li>
			</ul>
		</div>
	</div>
	
	<div class="sci" id="sci">
		<p>과탐</p>
		<div class="mulli" id="mulli">
			<p>물리학</p>
			<ul>
				<li><a href="#">이규철</a></li>
				<li><a href="#">박정호</a></li>
			</ul>
		</div>
		<div class="jigu" id="jigu">
			<p>지구과학</p>
			<ul>
				<li><a href="#">안성진</a></li>
				<li><a href="#">최선묵</a></li>
			</ul>
		</div>
		<div class="hwahac" id="hwahac">
			<p>화학</p>
			<ul>
				<li><a href="#">양진석</a></li>
				<li><a href="#">양서현</a></li>
			</ul>
		</div>
		<div class="sangmyun" id="sangmyun">
			<p>생명과학</p>
			<ul>
				<li><a href="#">이승후</a></li>
				<li><a href="#">박기웅</a></li>
			</ul>
		</div>
		<div class="totSci" id="totSci">
			<p>통합과학</p>
			<ul>
				<li><a href="#">이승후</a></li>
				<li><a href="#">박정호</a></li>
				<li><a href="#">김필훈</a></li>
			</ul>
		</div>
	</div>
	
	<div class="etc" id="etc">
		<p>제2외/한문</p>
		<div class="jp" id="jp">
			<p>일본어</p>
			<ul>
				<li><a href="#">진나라</a></li>
			</ul>
		</div>
		<div class="ar" id="ar">
			<p>아랍어</p>
			<ul>
				<li><a href="#">하지숙</a></li>
			</ul>
		</div>
		<div class="ch" id="ch">
			<p>중국어</p>
			<ul>
				<li><a href="#">이승우</a></li>
			</ul>
		</div>
		<div class="sp" id="sp">
			<p>스페인어</p>
			<ul>
				<li><a href="#">이영훈</a></li>
			</ul>
		</div>
		<div class="fr" id="fr">
			<p>프랑스어</p>
			<ul>
				<li><a href="#">조혜빈</a></li>
			</ul>
		</div>
		<div class="ge" id="ge">
			<p>독일어</p>
			<ul>
				<li><a href="#">이혜진</a></li>
			</ul>
		</div>
		<div class="vi" id="vi">
			<p>베트남어</p>
			<ul>
				<li><a href="#">최고아라</a></li>
			</ul>
		</div>
		<div class="han" id="han">
			<p>한문</p>
			<ul>
				<li><a href="#">박한신</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="main" id="main">

	
</div>



<div class="footer" id="footer">



</div>

<script>
function showCategory() {
	document.getElementById("imageList").style.display = "block";
}

function hideCategory() {
    document.getElementById("imageList").style.display = "none";
}
</script>

</body>
</html>