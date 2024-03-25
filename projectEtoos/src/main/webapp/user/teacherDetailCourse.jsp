<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
<c:choose>
	<c:when test="${param.menuGubun == 'teacher'}">
		<jsp:include page="../common/teacherDetailSidebar.jsp">
				<jsp:param value="1" name="page_gubun"/>
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="../common/courseSidebar.jsp">
				<jsp:param value="1" name="page_gubun"/>
		</jsp:include>
	</c:otherwise>
</c:choose>
<jsp:include page="../common/footer.jsp"></jsp:include>
<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">강좌 상세</h1>
		<c:choose>
			<c:when test="${viewList.courseName == null }">
				<div>
					<p>존재하지 않는 게시글 입니다.</p>
				</div>
				
				<div class="listGo">
				 	<button id="listGoBtn">목록으로</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="detailCorsDiv">
					<div class="prvwVideo">
						<!-- <video src="https://youtu.be/FxB6_qaqHlY?si=a9LUk3AtySqSu-mT"  controls width="450"  height="350" preload="auto"></video> -->
						<iframe width="100%" height="90%" src="https://www.youtube.com/embed/FxB6_qaqHlY?si=a9LUk3AtySqSu-mT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					</div>
					<div class="courseDetailDiv">
						<h1>${viewList.courseName}</h1>
						<table>
						<tr>
							<td>선생님</td>
							<td>${viewList.teacherName}</td>
						</tr>
						<tr>
							<td>과목유형</td>
							<td>${viewList.sub1} - ${viewList.sub2}</td>
						</tr>
						<tr>
							<td>수강기간</td>
							<td>${viewList.sugangStart} ~ ${ viewList.sugangEnd }</td>
						</tr>
						<tr>
							<td>강좌구성</td>
							<td>${viewList.guseong}</td>
						</tr>
						<tr>
							<td>교재</td>
							<td>${viewList.bookName}</td>
						</tr>
						</table>
						<c:choose>
							<c:when test="${viewList.state == 'N' }" >
								<p> 종료된 강의 입니다. </p>		
							</c:when>
							<c:when test="${viewList.historyYN == 'Y' }" >
								<input type="button" id="applyCancelBtn" class="applyCancelBtn" value="신청취소" onclick="applyCancel()"/>		
							</c:when>
							<c:otherwise>
								<input type="button" id="courseApplyBtn" class="courseApplyBtn" value="수강신청" onclick="apply()"/>
							</c:otherwise>
						</c:choose>		
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
							    	<td>${viewList.gangBumwi}</td>
							    </tr>
							    <tr>
							    	<td>강좌 특징<td>
							    	<td>
							    	${viewList.gangChar}
									</td>
							    </tr>
							    <tr>
							    	<td>수강 대상<td>
							    	<td>
							    	${viewList.range}
									</td>
							    </tr>
							    </table>
							    </div>
							    
							    <div class="bookInfo" >
							    	<h3>교재정보</h3>
							    	<div>
							    	<div class="bookImg">
							    		<img src="${ viewList.filePath}/${viewList.fileName}" width="100%" height="100%">
							    	</div>
							    	<div>
									    <table class="bookInfoTable" id="target3">
									    <tr>
									    	<td>주 교재명<td>
									    	<td>${viewList.bookName}</td>
									    </tr>
									    <tr>
									    	<td>교재 설명<td>
									    	<td>
									    	${viewList.bookIntro}
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
							    	<c:choose>
							    		<c:when test="${sebulist[0].courseSebuName == null}">
							    			<tr>
							    				<td colspan="2">
							    					표시할 내용이 없습니다.
							    				</td>
							    			</tr>
							    		</c:when>
							    		<c:otherwise>
							    			<c:forEach var="e" items="${sebulist}" varStatus="status">
							    				<tr>
							    					<td> ${status.count}강 ${e.courseSebuName} </td>
							    					<td> ${e.courseTime} </td>
							    				</tr>
							    			</c:forEach>
							    		</c:otherwise>
							    	</c:choose>							    
							    </table>					    
							    </div>
							    
							    </div>
<!-- 								<div class="listGo">
								 	<button id="listGoBtn">목록으로</button>
								</div> -->
						 </div>
					 </div>
					 
				</div>
			</c:otherwise>
		</c:choose>
		
		
	</div>
</main>

<script>
 
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
 
 
function applyCancel(){
	if(confirm("강좌 신청을 취소하시겠습니까?")){
		window.location = "CourseApplication.do?applyStatus=cancel&menuGubun=${param.memnuGubun}&<%=request.getQueryString()%>";
	}
}

 
function apply(){
	if(${(sessionScope.id != null) ? true : false}) {
		if (${(sessionScope.gubun != '1') ? true : false}) {
			alert("학생만 신청 가능합니다.");
		} else {
			if(confirm("강좌를 신청하시겠습니까?")){
				window.location = "CourseApplication.do?applyStatus=apply&menuGubun=${param.memnuGubun}&<%=request.getQueryString()%>";
			}
		}
	} else {
		alert("로그인 후 이용해주세요.");
		window.location = "Login.do";
	}
}

<%-- let listGoBtn = document.querySelector("#listGoBtn");
listGoBtn.addEventListener("click", ()=>{
	if (${param.menuGubun == "teacher"}) {
		window.location = "TeacherDetailList.do?<%=request.getQueryString()%>";
	} else {
		window.location = "courseList.do?courseIdx=${param.courseIdx}&pageSelected=${param.pageSelected}&sub1=${param.sub1}&sub2=${param.sub2}&sub3=${param.sub3}&menuGubun=course";
	}
	
}) --%>

// 수강신청 성공/실패 알럿
if (${(param.sucessYN != null)}) {
	if (${param.sucessYN == 'true'}) {
		alert("정상 신청되었습니다. 내역 페이지로 이동하시겠습니까?");
		window.location = "/projectEtoos/mypage/MyCourse.do";
	} else {
		alert("수강신청에 실패하였습니다.");
	}
}

//신청취소 성공/실패 알럿
if (${param.cancelSucessYN != null}) {
	if (${param.cancelSucessYN == 'true'}) {
		alert("취소되었습니다. 내역 페이지로 이동합니다.");
		window.location = "/projectEtoos/mypage/MyCourse.do";
	} else {
		alert("신청취소에 실패하였습니다.");
	}
}
</script>
</body>
</html>