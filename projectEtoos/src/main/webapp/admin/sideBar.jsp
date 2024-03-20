<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="stylesheet" href="../css/reset.css" type="text/css">
<link rel="stylesheet" href="../css/admin.css" type="text/css">
<aside id="side">
	<h1><a href="#">관리자</a></h1>
	<ul>
		<li <c:if test="${param.page_gubun eq 1 }">class="selected"</c:if>><a href="#">회원조회${page_gubun}</a></li>
		<li <c:if test="${param.page_gubun eq 2 }">class="selected"</c:if>><a href="#">선생님조회</a></li>
		<li <c:if test="${param.page_gubun eq 3 }">class="selected"</c:if>><a href="#">강좌조회</a></li>
	</ul>
</aside>