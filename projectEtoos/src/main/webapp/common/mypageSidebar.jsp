<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix = "c" uri = "jakarta.tags.core" %>

<aside id="side">
	<h1><a href="#" style="line-height : 1.2;">${sessionScope.name}님<br>안녕하세요</a></h1>
	<ul>
		<li  class="depth1 <c:if test="${param.sideNum eq '1' }">selected</c:if>">
			<div>
				<a href="./MyCourse.do">내 강좌보기</a>
			</div>
		</li>
		<li class="depth1 <c:if test="${param.sideNum eq '2' }">selected</c:if>">
			<div>
				<a href="./MyInfo.do">내 정보 수정</a>
			</div>
		</li>
	</ul>
</aside>