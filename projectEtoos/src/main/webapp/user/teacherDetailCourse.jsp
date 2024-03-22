<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
<jsp:include page="../common/teacherDetailSidebar.jsp">
		<jsp:param value="1" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>

<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">강좌 상세</h1>
		<div class="detailCorsDiv">
			<div class="prvwVideo">
				<video src=""  controls width="450"  height="350" preload="auto"></video>
			</div>
			<div class="courseDetailDiv">
				<h1>강좌 제목</h1>
				<table>
				<tr>
					<td>선생님</td>
					<td>김현수</td>
				</tr>
				<tr>
					<td>강좌유형</td>
					<td>수능(문제풀이)</td>
				</tr>
				<tr>
					<td>수강기간</td>
					<td>120일</td>
				</tr>
				<tr>
					<td>강좌구성</td>
					<td>30분씩 총 20강</td>
				</tr>
				<tr>
					<td>교재</td>
					<td>강좌교재 (주교재 1권)</td>
				</tr>
				</table>
				
				<input type="submit" name="courseApplyBtn" id="courseApplyBtn" class="courseApplyBtn" value="수강신청" />
			  
			 </div>
			 
			 <div class="courseDetailConDiv">
			 		<!-- 탭 버튼 영역 -->
					<ul class="courseTab">
					    <li class="tabItem active" id="totalTab">
					      <p>전체</p>
					    </li>
					    <li class="tabItem" id="courseTab">
					      <p>강좌정보</p>
					    </li>
					    <li class="tabItem" id="bookTab">
					      <p>교재정보</p>
					    </li>
					    <li class="tabItem" id="configureTab">
					      <p>강좌구성</p>
					    </li>
					  </ul>
					  
					  <!-- 탭 내용 영역 -->
					  <div class="tabContentWrap" id="target1">
					    <div class="tabcontent active" >
					    <h3>강좌정보</h3>
					    
					    <div>
					    <table class="courseInfoTable" id="target2">
					    <tr>
					    	<td>강좌 범위<td>
					    	<td>교재 전 범위</td>
					    </tr>
					    <tr>
					    	<td>강좌 특징<td>
					    	<td>
					    	2주 만에 끝내는 수능 어법 문제 풀이 <br>
					    	: 절대평가 시대에 어법 공부에 시간을 끄는 것은 현명하지 못하다. 
							평가원 출제 패턴을 짧고 굵게 정리해, 수능 어법(29번) 문항을 확실히 가져가자!
							</td>
					    </tr>
					    <tr>
					    	<td>수강 대상<td>
					    	<td>
					    	- 수능 어법(29번) 문항을 대비하고자 하는 학생<br>
							- 어법 문제 풀이를 빠르게 정리하고 싶은 학생
							</td>
					    </tr>
					    </table>
					    </div>
					    
					    <div class="bookInfo" >
					    	<h3>교재정보</h3>
					    	<div>
					    	<div class="bookImg"></div>
					    	<div>
							    <table class="bookInfoTable" id="target3">
							    <tr>
							    	<td>주 교재명<td>
							    	<td>Oracle : 평가원 실전 어법</td>
							    </tr>
							    <tr>
							    	<td>교재 설명<td>
							    	<td>
							    	1. 4개의 대단원, 17개의 출제 포인트로 수능 어법 문제 풀이 정리<br>
									2. [기출문장 변형하기]를 통한 출제 포인트 체화<br>
									3. 최근 10년간의 출제 양상 정리<br>
									4. [기출 라이브러리] - 최근 10개년 기출 문제 전부 수록<br>
									</td>
							    </tr>
							    </table>
						    </div>
						    </div>
					    </div>
					    
					    <div class="courseConfigure" >
					    	<h3>강좌구성</h3>
					    <table class="courseConfiTable" id="target4">
					    	<tr>
					    		<th>강좌명</th>
					    		<th>강좌시간</th>
					    	</tr>
					    	<tr>
					    		<td>01강 [출제 Point 1] 동사 vs 준동사</td>
					    		<td>30분</td>
					    	</tr>
					    	<tr>
					    		<td>02강 [출제 Point 2] 동사의 수일치</td>
					    		<td>27분</td>
					    	</tr>
					    	<tr>
					    		<td>03강 [출제 Point 3] 능동 vs 수동</td>
					    		<td>35분</td>
					    	</tr>
					    	<tr>
					    		<td>04강 [출제 Point 4] 병렬구조</td>
					    		<td>22분</td>
					    	</tr>
					    	<tr>
					    		<td>05강 [출제 Point 5] 대동사</td>
					    		<td>17분</td>
					    	</tr>
					    	<tr>
					    		<td>06강 [출제 Point 6] 전치사 + 동명사</td>
					    		<td>18분</td>
					    	</tr>
					    
					    </table>
					    
					    
					    </div>
					    
					    </div>
	
				 </div>
			 </div>
		</div>
		
	</div>
</main>

<script>

/* 로그인 정보 있을때.. 확인필요..
document.querySelector("#courseApplyBtn").addEventListener("click", function(e){
	let signIn = "";
	if (signIn == ""){
		confirm("로그인 후 이용해주세요.");
		location.href="/login.jsp";
	} else {
		location.href="/projectEtoos/user/teacherDetailCourse.jsp";
	}
	
	if (signIn != null ){
		confirm("강좌를 신청하시겠습니까?"){
		window.location = "/projectEtoos/mypage/myCourse.jsp";
		}
	}
}, false);
 */
 
 //메뉴 탭 스크롤
let totalTab = document.querySelector("#totalTab");
 totalTab.addEventListener("click", (e)=> {
	let target1 = document.querySelector("#target1");
	e.preventDefault();
	window.scrollTo({top:target1.getBoundingClientRect().top, behavior: 'smooth'});
 });
 
let courseTab = document.querySelector("#courseTab");
courseTab.addEventListener("click", (e)=> {
	let target2 = document.querySelector("#target2");
	e.preventDefault();
	window.scrollTo({top:target2.getBoundingClientRect().top, behavior: 'smooth'});
 });
 
let bookTab = document.querySelector("#bookTab");
bookTab.addEventListener("click", (e)=> {
	let target3 = document.querySelector("#target3");
	e.preventDefault();
	window.scrollTo({top:target3.getBoundingClientRect().top, behavior: 'smooth'});
 });

 let configureTab = document.querySelector("#configureTab");
 configureTab.addEventListener("click", (e)=> {
	let target4 = document.querySelector("#target4");
	e.preventDefault();
	window.scrollTo({top:target4.getBoundingClientRect().top, behavior: 'smooth'});
 });

 
document.querySelector("#courseApplyBtn").addEventListener("click", function(e){
	if(confirm("강좌를 신청하시겠습니까?")){
		window.location = "/projectEtoos/mypage/myCourse.jsp";
	}
}, false);

</script>

</body>
</html>