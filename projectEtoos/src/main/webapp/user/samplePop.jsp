<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
<link rel="stylesheet" href="../css/reset.css" type="text/css">
<link rel="stylesheet" href="../css/user.css" type="text/css">
</head>
<body>
	<div class="video">
		<!-- <video src="https://youtu.be/FxB6_qaqHlY?si=a9LUk3AtySqSu-mT"  controls width="450"  height="350" preload="auto"></video> -->
		<iframe width="450" height="350" src="https://www.youtube.com/embed/a1b3F6d8XKM?si=m3FQulXSq7f0J6DB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
	</div>
	<button id="close">닫기</button>
	<script>
		document.querySelector("#close").addEventListener("click", ()=>{
			window.close();
		})
	</script>
</body>
</html>