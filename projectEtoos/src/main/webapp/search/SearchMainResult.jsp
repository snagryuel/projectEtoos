
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/search.css" type="text/css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
<link rel="stylesheet" href="../css/user.css" type="text/css">
<link rel="stylesheet" href="../css/main.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">

<%
String searchWord = request.getParameter("search_word");
if (searchWord == null || searchWord.trim().isEmpty()) {
    searchWord = "전체검색";
}
%>

</head>
<body>
    <jsp:include page="../common/header.jsp">
        <jsp:param value="0" name="page_gubun" />
    </jsp:include>
    <main>
        <div class="container center">
            <div class="wrapper">
                <div class="gumsaekbar">
                    <form name=form id="searchForm" method="get"
                        action="/projectEtoos/search/searchMain.do">
                        <ul>
                            <li><input type="text" onkeyup="enterkey(event)"
                                name="search_word" id="search_word" value="" maxlength="20" />
                            </li>
                        </ul>
                    </form>
                </div>
                <div class="gumsaekGyelGwa">
                    <p id="gyeolGwadata"><%=searchWord%>
                        에 대한 검색결과 <span class="totalCount"> </span> 건
                        <!-- 이 부분 아직 안될 것 -->

                    </p>
                </div>
            </div>
            <div class="tap">
                <ul>

                    <li class="selected-tab"><span><a
                            href="./searchMain.do?search_word=${keyword }">전체(<span class="totalCount1"> </span>)</a></span></li>
                    <li><span><a
                            href="./searchMain.do?bbs=teacher&search_word=${keyword }"> 선생님 (<span class="teacherCount1"> </span> </a>)</span></li>
                    <li><span><a
                            href="./searchMain.do?bbs=course&search_word=${keyword }">강좌 (<span class="courseCount1"></span>)</a></span></li>
                    <li><span><a
                            href="./searchMain.do?bbs=notice&search_word=${keyword }">공지사항 (<span class="noticeCount1"></span>)</a></span></li>

                </ul>
            </div>
            <!-- 선생님 목록결과 -->
            <c:if test="${bbs eq 'teacher' || empty bbs}">
                <div class="contents_teacherlist" id="teacherList">
                    <div class="tsection">
                        <p id="title_g">
                            선생님 (<span class="teacherCount"></span>)
                        </p>

                        <c:if test="${not empty searchResults1}">
                            <c:forEach var="result" items="${searchResults1}">
                                <div>
                                    <ul class="search_teacher sch_ul">
                                        <li class="sch_t" id="sch_t" id="t1">
                                            <div class="sch_c teacher_img">
                                                <div class="img">
                                                    <img
                                                        src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
                                                        alt="">
                                                </div>
                                            </div>
                                            <div class="sch_c">
                                                <span class="sch_tis">${result.tMent}</span>
                                                <div class="sch_ti">
                                                    <strong>"${result.sub1}"</strong> &nbsp; <font
                                                        style="color: #b16e61">${result.name}</font> 선생님
                                                    &nbsp;&nbsp;
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty searchResults1}">
                            <p><%=searchWord%>
                                검색결과가 존재하지 않습니다
                            </p>
                        </c:if>

                    </div>
                </div>
            </c:if>
            <!-- 강좌 목록결과 -->
            <c:if test="${bbs eq 'course' || empty bbs}">

                <div class="courseList" id="courseList">
                    <div class="coursesection">
                        <div class="listTitle">

                            <p id="title_g">
                                강의 (<span class="courseCount"></span>)
                                <button type="button" class="gumsaekdeo"  onclick = "location.href='./searchMain.do?bbs=course&search_word=${keyword }'">더보기</button>

                            </p>

                            <c:if test="${not empty searchResults3}">
                                <c:forEach var="result" items="${searchResults3}">

                                    <div>
                                        <ul class="search_teacher sch_ul">
                                            <li class="sch_t" id="t2">
                                                <div class="sch_c teacher_img">
                                                    <div class="img">
                                                        <img
                                                            src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
                                                            alt="">
                                                    </div>
                                                    <p class="imgTName">${result.name}선생님</p>

                                                </div>
                                                <div class="sch_c">
                                                    <span class="sch_tis">${result.tMent}</span>
                                                    <div class="sch_ti">
                                                        <strong>"${result.courseName}" </strong>

                                                    </div>
                                                </div>
                                            </li>

                                        </ul>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty searchResults3}">
                                <p><%=searchWord%>
                                    검색결과가 존재하지 않습니다
                                </p>
                            </c:if>

                        </div>
                    </div>
                </div>
            </c:if>
            <!-- 공지 목록결과 -->
            <c:if test="${bbs eq 'notice' || empty bbs}">

                <div class="gonjiList" id="gonjiList">
                    <div class="coursesection">
                        <div class="listTitle">

                            <p id="title_g">
                                공지사항 (<span class="noticeCount"></span>)
                                <button type="button" class="gumsaekdeo"  onclick = "location.href='./searchMain.do?bbs=notice&search_word=${keyword }'">더보기</button>

                            </p>

                            <c:if test="${not empty searchResults2}">
                                <c:forEach var="result" items="${searchResults2}">
                                    <div>
                                        <ul class="search_teacher sch_ul">
                                            <li class="sch_t" id="t3">
                                                <div class="sch_c teacher_img">
                                                    <div class="img">
                                                        <img
                                                            src="http://img.etoos.com/teacher/teacher/200180/tch225x400.png"
                                                            alt="">
                                                    </div>
                                                    <p class="imgTName">${result.name}선생님</p>
                                                </div>
                                                <div class="sch_c">
                                                    <div class="sch_ti">
                                                        <span><strong>${result.title}</strong></span>

                                                    </div>
                                                    <br> <span class="sch_tis">${result.contents}</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty searchResults2}">
                                <p><%=searchWord%>
                                    검색결과가 존재하지 않습니다
                                </p>
                            </c:if>

                        </div>
                    </div>
            </c:if>
            <!-- 공지 끝 -->

        </div>

        </div>

    </main>




    <jsp:include page="../common/footer.jsp" />

    <script>
        let lies = document.querySelectorAll(".tap > ul > li");
        for (let li of lies) {
            li.addEventListener("click", ()=>{
                for (let li2 of lies) {
                    console.log(li2);
                    li2.classList.remove("selected-tap");
                }
                li.classList.add("selected-tap");
            })            
            
        }
        
        function enterkey(event) {
            if (event.keyCode === 13) {
                event.preventDefault(); 
                checkSearchInput(); // 검색 값 체크 함수 호출
            }
        }
        
     
        
        
/* 검색값이 없을시 막는 로직. => 추후 필요시 활용
        function checkSearchInput(event) {
          const searchWord = document.getElementById("search_word").value.trim();
        	  if (!searchWord) {
        	    alert("검색어를 입력하세요.");
        	    event.preventDefault();
        	    event.stopPropagation();
        	    return false;
        	  }
        	  
        	  // 검색어가 유효하면 폼을 정상적으로 제출
        	  document.getElementById("searchForm").submit();
        	}

        	// 검색 버튼 또는 폼 제출에 이벤트 리스너 추가
        	document.getElementById("searchForm").addEventListener("submit", checkSearchInput);

        	// 엔터 키 입력 시에도 checkSearchInput 함수 호출
        	document.getElementById("search_word").addEventListener("keydown", function(event) {
        	  if (event.keyCode === 13) {
        	    checkSearchInput(event);
        	  }
        	});*/
        	
        	

        	
        	
        document.addEventListener('DOMContentLoaded', function () {
            var teacherCount = document.querySelectorAll('.contents_teacherlist .search_teacher').length;
            document.querySelector('.teacherCount').textContent = teacherCount;
            document.querySelector('.teacherCount1').textContent = teacherCount;

           
            var noticeCount = document.querySelectorAll('.gonjiList .search_teacher').length;
            
            document.querySelector('.noticeCount').textContent = noticeCount;
            document.querySelector('.noticeCount1').textContent = noticeCount;
     
         
            var courseCount = document.querySelectorAll('.courseList .search_teacher').length;
            document.querySelector('.courseCount').textContent = courseCount;
            document.querySelector('.courseCount1').textContent = courseCount;
            
            var totalCount = teacherCount + noticeCount + courseCount;
            document.querySelector('.totalCount').textContent = totalCount;
            document.querySelector('.totalCount1').textContent = totalCount;

            
            
        });
        
      

    </script>

</body>
</html>