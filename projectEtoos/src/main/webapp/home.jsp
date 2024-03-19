<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
 <link rel="stylesheet" href="./css/home.css" type="text/css">


</head>
<body>
<%@ include file="./common/header.jsp" %>
<div id="logo" class="logo">
<a href="#">ETOOS</a>
</div>




<div class="main" id="main">

	
</div>



<div class="footer" id="footer">



</div>

<script>
function showCategory() {
	document.getElementById("imageList").style.display = "block";
}

function hideCategory() {
    document.getElementById("imageList").style.display = "none";
}
</script>

</body>
</html>