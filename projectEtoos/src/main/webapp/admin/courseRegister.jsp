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
			<h1 id="title">강좌 관리</h1>
			<form id="frm" method = "post" action = "/projectEtoos/admin/CourseRegisterOk.do">
				<table>
					<caption>기본정보</caption>
					<tr>
						<th>강좌명</th>
						<td><input type="text" name="courseName" id="courseName" maxlength="100" value = "${courseList.courseName }"></td>
					</tr>
					<tr>
						<th>선생님</th>
						<td>
							<select name="teacher">
								<option value="">선택</option>
								<c:forEach var = "teacher" items = "${teacherList }" >
									<option value="${teacher.id }">${teacher.name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강기간</th>
						<td><input type="date" name="sugangStart" id="sugangStart" value="${courseList.sugangStart }"> ~ <input type="date" name="sugangEnd" id="sugangEnd" value = "${courseList.sugangEnd }"></td>
					</tr>
					<tr>
						<th>강좌구성</th>
						<td><input type="text" name="guseong" id="guseong" maxlength="20" value="${courseList.guseong }"></td>
					</tr>
					<tr>
						<th>미리보기 영상</th>
						<td><input type="file" name="videoFIle" id="videoFIle" accept="video/*"></td>
					</tr>
				</table>
				<table>
					<caption>강좌정보</caption>
					<tr>
						<th>강좌범위</th>
						<td><textarea name="gangBumwi" id="gangBumwi" cols="100" rows="5">${courseList.gangBumwi }</textarea></td>
					</tr>
					<tr>
						<th>강좌특징</th>
						<td><textarea name="gangChar" id="gangChar" cols="100" rows="5">${courseList.gangChar }</textarea></td>
					</tr>
					<tr>
						<th>수강대상</th>
						<td><input type="text" name="range" id="range" maxlength="20" value = "${courseList.range }">
						<input type="hidden" name="courseIdx" id="courseIdx" value = "${idx }"></td>
					</tr>
				</table>
				<table>
					<caption>교재정보</caption>
					<tr>
						<th>책 이미지</th>
						<td><input type="file" name="bookFile" id="bookFile" accept="image/*"></td>
					</tr>
					<tr>
						<th>교재명</th>
						<td><input type="text" name="bookName" id="bookName" maxlength="20" value = "${courseList.bookName }"></td>
					</tr>
					<tr>
						<th>교재설명</th>
						<td><textarea name="bookIntro" id="bookIntro" cols="100" rows="5" >${courseList.bookIntro }</textarea></td>
					</tr>
				</table>
				<table id="sebu">
					<caption>강좌구성</caption>
					<c:if test="${not empty sesbuList }">
						<c:forEach var="list" items="${sesbuList }" varStatus="status">
							<tr data-idx="${status.count }">
								<th class="idx" rowspan="2">${status.count }</th>
								<th>세부 강좌명</th>
								<td><input type="text" name="courseSebuName" id="courseSebuName${status.count }" maxlength="20" value = "${list.courseSebuName }"></td>
							</tr>
							<tr data-idx="${status.count }">
								<th>강좌시간</th>
								<td><input type="text" name="courseTime" id="courseTime${status.count }" maxlength="20" value = "${list.courseTime }">
								<input type="hidden" name="sebuIdx" id="sebuIdx${status.count }"value = "${list.sebuIdx }"/></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty sesbuList }">
						<tr data-idx="1">
								<th class="idx" rowspan="2">1</th>
								<th>세부 강좌명</th>
								<td><input type="text" name="courseSebuName" id="courseSebuName1" maxlength="20" value = ""></td>
							</tr>
							<tr data-idx="1">
								<th>강좌시간</th>
								<td><input type="text" name="courseTime" id="courseTime1" maxlength="20" value = "">
								<input type="hidden" name="sebuIdx" id="sebuIdx1"value = ""/></td>
							</tr>
					</c:if>
				</table>
				<div class="btn_manager">
					<button id="btn_add">강좌 명 추가</button>
				<button id="btn_del">삭제</button>
				</div>		
				<div class="buttones">
					<button>취소</button>
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</main>
	<c:if test="${loginYN ne 'Y'}">
		<script type="text/javascript" src="../js/logincheck.js" ></script>
	</c:if> 
	<c:if test="${success eq 'Y'}">
		<script>
			alert("수정에 성공하였습니다.");
		</script>
	</c:if>
	<script>
	// 세부 강좌 추가 로직
	let btn_add = document.querySelector("#btn_add");
	btn_add.addEventListener("click", (e)=> {
		e.preventDefault();
		let sebu = document.querySelector("#sebu");
		
		let rows = document.querySelectorAll("#sebu .idx");
		let row = rows.length + 1;
		
		let tr1 = document.createElement("tr");
		tr1.setAttribute("data-idx",row);
		let tr2 = document.createElement("tr");
		tr2.setAttribute("data-idx",row);
		tr1.innerHTML = "<th class='idx' rowspan='2'>" + row + "</th><th>세부 강좌명</th><td><input type='text' name='courseSebuName' id='courseSebuName" + row + "' maxlength='20'></td>";
		tr2.innerHTML = "<th>강좌시간</th><td><input type='text' name='courseTime' id='courseTime" + row + "' maxlength='20'></td>";
		sebu.append(tr1);
		sebu.append(tr2);
	})
	
	let btn_dele = document.querySelector("#btn_del");
	
	
	btn_dele.addEventListener("click", (e) => {
		e.preventDefault();
		let tres = document.querySelectorAll("#sebu tr");
		let target = tres.length;
		if(target <= 2) {
			alert("첫번째 세부강좌를 삭제하실 수 없습니다.");
			return;
		}
		tres[target-1].remove();
		tres[target-2].remove();
	})
	</script>
</body>
</html>