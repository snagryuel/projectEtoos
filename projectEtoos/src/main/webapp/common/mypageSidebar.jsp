<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix = "c" uri = "jakarta.tags.core" %>

<aside id="side">
	<h1><a href="#">안녕하세요 OOO님</a></h1>
	<ul>
		<li <c:if test="${param.sideNum eq '1' }">class="selected"</c:if>><a href="#">내 강좌보기</a></li>
		<li <c:if test="${param.sideNum eq '2' }">class="selected"</c:if>><a href="./MyInfo.do">내 정보 수정</a></li>
	</ul>
</aside>