<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
<link rel="stylesheet" href="../css/admin.css" type="text/css">
<title>Admin</title>
</head>
<body>
	<jsp:include page="./sideBar.jsp">
		<jsp:param value="3" name="page_gubun"/>
	</jsp:include>
	<main>
		<div class="container">
			<h1 id="title">강좌 조회</h1>
			<div class="search-area">
				<form action="" id="frm" class="gird" method="post">
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
					<p>총 000건</p>
					<p><button><a href="./courseRegister.jsp">등록하기</a></button></p>
				</div>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>강의명</th>
							<th>강사명</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>수강기간</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var = "list" items="${courseList }">
						<tr>
							<td>0</td>
							<td>${list.coursename }</td>
							<td>${list.name }</td>
							<td>${list.sub1 }</td>
							<td>${list.sub2 }</td>
							<td>${list.sugangStart } ~ ${list.sugangEnd }</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="paging">
					<ul>
						<li><a href="">◀</a></li>
						<li><a href="" class="selected">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">▶</a></li>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/common/footer.jsp" %>
	<script type="text/javascript" src="../js/logincheck.js" ></script> 
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
		})
		
	</script>
</body>
</html>