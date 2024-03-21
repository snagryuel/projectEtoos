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
		<h1 id="title">개설강좌</h1>
		<div class="wrapper">
			<div class="searchArea">
				<form action= "" id="frm">
					<input type="text" name="courseName" id="courseName" maxlength="20">
					<button type="submit">검색</button>
				</form>
			</div>
			<div class="list">
				<form>
				<table>
					<tr>
						<th>선택</th>
						<th>강좌명</th>
						<th>과목</th>
						<th>맛보기</th>
						<th>수강신청</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="idx"></td>
						<td>[과목1] 강좌 제목 입니다.</td>
						<td>과목1</td>
						<td><button>맛보기</button></td>
						<td><button>수강신청</button></td>
					</tr>
				</table>
				<button>수강신청</button>
				</form>
			</div>
		</div>
	</div>
</main>
</body>
</html>