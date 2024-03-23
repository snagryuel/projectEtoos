<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/user.css" type="text/css">
<style>
main .container .search-area {
	height : auto;
}
main .container .gird {
	width : 100%;
	height : 100%;
	display : grid;
	grid-template-columns : 30% 30% 30%;
	gap : 5%;
	grid-template-areas : "sub1 sub2 sub3" ". buttones .";
	padding : 20px;
	box-sizing : border-box;
}
main .container .search-area form .select-list {
	border : 1px solid #ababab;
	background : #fff;
	height : auto;
	white-space:nowrap;
	display : flex-inline;
	flex-direction: column;
}

main .container .search-area .select-list p {
	white-space:nowrap;
	background : #000;
	color : #fff;
	padding : 10px;
}
main .container .search-area .select-list ul {
	height : 170px;
	white-space:nowrap;
	overflow-y: auto;
	white-space:pre;
	display : flex;
	flex-direction: column;
}

main .container .search-area .select-list ul li{
	padding : 10px;
	border-top : 1px solid #ababab;
}
main .container .search-area .select-list ul li:last-child {
	border-bottom : 1px solid #ababab;
}
main .container .search-area .select-list ul li:hover {
	color : #fff;
	background : #597c85;
}

main .container .search-area .select-list ul li.selected {
	color : #fff;
	background : #597c85;
}

main .container .search-area .buttones {
	grid-area : buttones;
	text-align : center;
	padding : 10px 0;
}
main .container .search-area .buttones button, div.list div.list-top button {
	padding : 10px 20px;
	background : #fff;
	border : 1px solid #ababab;
	box-sizing : border-box;
	font-size : 15px;
}

div.list div.list-top {
	display : flex;
	justify-content: space-between;
}
</style>
<title>Course</title>
</head>
<body>
<jsp:include page="../common/header.jsp">
		<jsp:param value="2" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/courseSidebar.jsp">
		<jsp:param value="1" name="page_gubun"/>
</jsp:include>
<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">강좌 검색</h1>
		<div class="wrapper">
			<div class="search-area">
				<form action="" id="frm" class="gird" method="get">
					<div class="sub1 select-list">
						<input type="hidden" name="sub1" id="sub1" value="${sub1 }">
						<p>과목</p>
						<ul>
						<c:forEach var = "list" items = "${SubList1 }">
							<li data-value="${list }" <c:if test="${sub1 eq list }">class = "selected"</c:if>>${list }</li>
						</c:forEach>
						</ul>
					</div>
					<div class="sub2 select-list">
						<input type="hidden" name="sub2" id="sub2" value="${sub2 }">
						<p>세부 과목</p>
						<ul>
							<c:forEach var = "list" items = "${SubList2 }">
								<li data-value="${list }" <c:if test="${sub2 eq list }">class = "selected"</c:if>>${list }</li>
							</c:forEach>
						</ul>
					</div>
					<div class="sub3 select-list">
						<input type="hidden" name="sub3" id="sub3" value="${sub3 }">
						<p>선생님</p>
						<ul>
							<c:forEach var = "list" items = "${teacherList }">
								<li data-value="${list.id }"<c:if test="${sub3 eq list.id }">class = "selected"</c:if>>${list.name }</li>
							</c:forEach>
						</ul>
					</div>
					<div class="buttones">
						<button type="submit" class="search">검색</button>
						<button class="reset">초기화</button>
					</div>
				</form>
			</div>
			<div class="list">
				<div class="list-top">
					<p>총 ${totalCount}건</p>
				</div>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>강좌명</th>
							<th>강사명</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>수강기간</th>
							<th>맛보기</th>
							<th>수강신청</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${totalCount != null && totalCount != 0}">
							<c:set var="i" value="${totalCount - (((param.pageSelected != null ? param.pageSelected : 1)-1) * 10)}" />
							<c:forEach var = "list" items="${courseList}">
								<c:set var="thisUrl">
									CourseList_course.do?courseIdx=${list.courseIdx}&pageSelected=${(param.pageSelected != null) ? param.pageSelected : 1 }&sub1=${param.sub1}&sub2=${param.sub2}&sub3=${param.sub3}&menuGubun=course"					
								</c:set>
								<tr>
									<td><a href="${thisUrl}">${i}</a></td>
									<td><a href="${thisUrl}">${list.coursename }</a></td>
									<td><a href="${thisUrl}">${list.name }</a></td>
									<td><a href="${thisUrl}">${list.sub1 }</a></td>
									<td><a href="${thisUrl}">${list.sub2 }</a></td>
									<td><a href="${thisUrl}">${list.sugangStart } ~ ${list.sugangEnd }</a></td>
									<td><button data-idx="${list.courseIdx}" class="sample">맛보기</button></td>
									<td>
									<c:choose>
										<c:when test="${list.state == 'N' }">
											종료
										</c:when>
										<c:when test="${list.historyYN == 'Y' }">
											<button data-courseIdx="${list.courseIdx}" class="applyCancelBtn" onclick="applyCancel(this)">신청취소</button>
										</c:when>
										<c:otherwise>
											<button data-courseIdx="${list.courseIdx}" class="courseApplyBtn" onclick="apply(this)">수강신청</button>
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								<c:set var="i" value="${i - 1}"/>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">표시할 내용이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="paging">
					<ul>
						${page}
					</ul>
				</div>
			</div>
		</div>
	</div>
</main>
<jsp:include page="../common/footer.jsp" />
<script>
	// 과목 선택 클릭 이벤트
	let selectList1 = document.querySelectorAll(".sub1 > ul > li");
	let selectList2 = document.querySelectorAll(".sub2 > ul > li");
	let selectList3 = document.querySelectorAll(".sub3 > ul > li");
	
	let value1 = document.querySelector("#sub1");
	let value2 = document.querySelector("#sub2");
	let value3 = document.querySelector("#sub3");
	
	
	for (let i of selectList1) {
		i.addEventListener("click", () => {
			for(let j of selectList1) {
				j.classList.remove("selected");
				sub1.value = "";
				value2.value = "";
				value3.value = "";
			}
			for(let j of selectList2) {
				j.classList.remove("selected");
			}
			for(let j of selectList3) {
				j.classList.remove("selected");
			}
			value1.value = i.dataset.value;
			console.log(value1.value);
			i.classList.add("selected");
		})
	}
	
	for (let i of selectList2) {
		i.addEventListener("click", () => {
			for(let j of selectList2) {
				j.classList.remove("selected");
				value2.value = "";
				value3.value = "";
			}
			for(let j of selectList3) {
				j.classList.remove("selected");
			}
			value2.value = i.dataset.value;
			i.classList.add("selected");
		})
	}
	
	for (let i of selectList3) {
		i.addEventListener("click", () => {
			for(let j of selectList3) {
				j.classList.remove("selected");
				value3.value = "";
			}
			value3.value = i.dataset.value;
			i.classList.add("selected");
		})
	}
	
	// 초기화
	let reset = document.querySelector(".reset");
	reset.addEventListener("click", ()=> {
		for (let i of selectList1) {i.classList.remove("selected");}
		for (let i of selectList2) {i.classList.remove("selected");}
		for (let i of selectList3) {i.classList.remove("selected");}
		value1.value = "";
		value2.value = "";
		value3.value = "";
	})
	
	// 강좌 취소
	function applyCancel(item){
		if(confirm("강좌 신청을 취소하시겠습니까?")){
			window.location = "CourseApplication.do?"+"applyStatus=cancel&"+"<%=request.getQueryString()%>&courseIdx="+item.dataset.courseidx;
		}
	}
	
	// 강좌 신청
	function apply(item){
		if(${(sessionScope.id != null) ? true : false}) {
			if (${(sessionScope.gubun != '1') ? true : false}) {
				alert("학생만 신청 가능합니다.");
			} else {
				if(confirm("강좌를 신청하시겠습니까?")){
					window.location = "CourseApplication.do?"+"applyStatus=apply&"+"<%=request.getQueryString()%>"+"&courseIdx="+item.dataset.courseidx;
				}
			}
		} else {
			alert("로그인 후 이용해주세요.");
			window.location = "Login.do";
		}
	}
	
	// ${(sessionScope.id != null) ? true : false}
	
	// 맛보기
	let samples = document.querySelectorAll(".sample");
	
	for (let i of samples) {
		i.addEventListener("click", ()=>{
			window.open("/projectEtoos/user/SamplePopup.do?courseIdx="+i.dataset.idx,'_blank', 'width=500, height=300, top=150, left=50, scrollbars=yes, location=no');
		})
	}
	
	// 수강신청 성공/실패 알럿
	if (${(param.sucessYN != null)}) {
		if (${param.sucessYN == 'true'}) {
			if (confirm("정상 신청되었습니다. 내역 페이지로 이동하시겠습니까?")) {
				window.location = "/projectEtoos/mypage/MyCourse.do";
			}
		} else {
			alert("수강신청에 실패하였습니다.");
		}
	}
	
	//신청취소 성공/실패 알럿
	if (${param.cancelSucessYN != null}) {
		if (${param.cancelSucessYN == 'true'}) {
			if (confirm("취소되었습니다. 내역 페이지로 이동하시겠습니까?")) {
				window.location = "/projectEtoos/mypage/MyCourse.do";
			}
		} else {
			alert("신청취소에 실패하였습니다.");
		}
	}
	
</script>
</body>
</html>