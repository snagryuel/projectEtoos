<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합회원</title>
<link rel="stylesheet" href="/projectEtoos/css/joinAgree.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="prevLogin">
		<a href="#"><</a>
	</div>
	<div id="title">
		<p>ETOOS 통합회원</p>
	</div>
	<div id="exit">
		<a href="#"><img class="xSymbol" alt="xSymbol" src="/projectEtoos/img/xSymbol.png"/></a>
	</div>
</div>



<div id="content">
	<div>
		<div class="logoControl">
			<img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
		</div>
		<div class="agree">
		
			<div class="checkElement">
		        <input type="checkbox" id="select" name="allCheck"><label for="select">모두 동의</label>
		        <hr>
		    </div>
		    <div class="checkElement">
		        <input type="checkbox" id="select2" name="esntlCheck1"><label for="select2">(필수) 이용약관 동의</label>
	        	<span class="detailAgree" onclick="">보기</span>
		    </div>
		    <div class="checkElement">       
		        <input type="checkbox" id="select3" name="esntlCheck2"><label for="select3">(필수) 개인정보 항목 수집 및 이용 동의</label>
		    	<span class="detailAgree" onclick="">보기</span>
		    </div> 
		    <div class="checkElement">  
		        <input type="checkbox" id="select4" name="chcCheck1"><label for="select4">(선택) 마케팅/광고 활용 동의</label>
				<span class="detailAgree" onclick="">보기</span>
			</div>	
			<div class="checkElement">
				<input type="checkbox" id="select4" name="chcCheck2"><label for="select4">(선택) 제3자 개인정보 제공 동의(ETOOS ECI)</label>
				<span class="detailAgree" onclick="">보기</span>
			</div>
		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp" %> 
 
<script>
 
 
 
 </script>

</body>
</html>