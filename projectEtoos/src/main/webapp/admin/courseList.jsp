<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
			<div class="search-area">
				<form action="" id="frm" class="gird" method="get">
					<div class="sub1 select-list">
						<input type="hidden" name="sub1" id="sub1" value="">
						<p>과목</p>
						<ul>
							<li data-value="1">과목1</li>
							<li data-value="2">과목2</li>
							<li data-value="3">과목3</li>
							<li data-value="4">과목4</li>
						</ul>
					</div>
					<div class="sub2 select-list">
						<input type="hidden" name="sub2" id="sub2" value="">
						<p>세부 과목</p>
						<ul>
							<li data-value="1">과목1</li>
							<li data-value="2">과목2</li>
							<li data-value="3">과목3</li>
						</ul>
					</div>
					<div class="sub3 select-list">
						<input type="hidden" name="sub3" id="sub3" value="">
						<p>선생님</p>
						<ul>
							<li data-value="1">과목1</li>
							<li data-value="2">과목2</li>
							<li data-value="3">과목3</li>
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
					<p><button>등록하기</button></p>
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
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
						<tr>
							<td>0</td>
							<td>논리적 구조 독해</td>
							<td>장지현</td>
							<td>국어</td>
							<td>없음</td>
							<td>2024-03-20 ~ 2024-03-24</td>
							<td><button>수정</button><button>삭제</button></td>
						</tr>
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