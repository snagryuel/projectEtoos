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
<jsp:include page="../common/teacherDetailSidebar.jsp">
		<jsp:param value="1" name="page_gubun"/>
</jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>

<main>
	<div id="empty"></div>
	<div class="container">
		<h1 id="title">개설강좌</h1>
		<div class="wrapper">
			<div class="searchArea">
				<form action= "/projectEtoos/user/TeacherDetailList.do?" id="frm" method="get">
					<input type="text" name="courseName" id="courseName" maxlength="20">
					<input type="hidden" name="teacherId" value="${param.teacherId }"> 
					<button type="submit">검색</button>
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
									CourseList_teacher.do?courseIdx=${list.courseIdx}&<%= request.getQueryString() %>&menuGubun=teacher"					
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
<script>

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

//페이징 첫번째, 마지막 페이지 알럿
let preves = document.querySelectorAll(".prev");
let nextes = document.querySelectorAll(".next");

for(let i of preves){
	i.addEventListener("click", (e) => {
		if(${(param.pageSelected != null) ? param.pageSelected : 1} == 1) {
			e.preventDefault();
			alert("첫번째 페이지 입니다.");
		} 
	})
}

for(let i of nextes){
	i.addEventListener("click", (e) => {
		if(${(param.pageSelected != null) ? param.pageSelected : 1} >= ${requestScope.totalPage}) {
			e.preventDefault();
			alert("마지막 페이지 입니다.");
		} 
	})

}

</script>
</body>
</html>