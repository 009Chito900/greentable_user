<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="사용자 비밀번호 찾기 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 비밀번호 찾기</title>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- 다음 우편 번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Google CDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-header.css">
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-searchIdPass.css">

<style>
.login-form {
	text-align: center;
	margin-top: 15%;
}

.InfoTxt p {
	text-align: center;
	font-size: 17px;
	margin-top: 20px;
}

.InfoTxt h2 {
	font-size: 30px;
	font-weight: bold;
	text-align: center;
		
}

.btn {
}
</style>
<script type="text/javascript">
$(function () {
	/* dropdown menu */
	$('.dropbtn').hover(function(){
       	setHidden();
	});//hover

	$('#drop_content').mouseleave(function(){
       	unsetHidden();
	});//mouseleave

	function setHidden(){
		console.log("button clicked");
    	if( $('#drop_content').hasClass('hidden') ){
    		$('#drop_content').removeClass('hidden');
     	}//end if
	}//setHidden

	function unsetHidden(){
	    $('#drop_content').addClass('hidden');
	}//unsetHidden

});//ready
</script>

</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="naviBar">
			<c:import url="/common/jsp/user-header.jsp" />
		</div>
	</div>
	<!-- header -->

		<div id="container">

			<div class="login-form">
				<div class="panel">
				</div>
					<div class="InfoTxt">
						<h2>비밀번호 찾기</h2>
						<p>메일발송이 완료되었습니다.</p>
						<p>메일을 확인하고 새로운 비밀번호로 재설정해 주세요.</p>
					</div>
				<div class="forgot">
					<a href="user_login.do"><input type="submit" value="로그인 하기" class="btn" style="margin-top: 20px" /></a>
				</div>
				<!-- main-div -->
			</div>
			<!-- login-form -->

		</div>
		<!-- container -->

		<div id="footer">
		<p>
			With supporting text below as a natural lead-in to additional
			content.<br /> &copy; CopyRight. All Right Reserved. Class A
		</p>
	</div>
	<!-- footer -->
	
</div>
</body>
</html>
