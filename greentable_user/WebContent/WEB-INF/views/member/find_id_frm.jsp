<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="사용자 아이디 찾기 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 아이디 찾기</title>

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
</style>
<script type="text/javascript">
$(function () {
	/* dropdown menu */
	$('.dropbtn').hover(function(){
       	setHidden();
	});

	$('#drop_content').mouseleave(function(){
       	unsetHidden();
	});

	function setHidden(){
		console.log("button clicked");
    	if( $('#drop_content').hasClass('hidden') ){
    		$('#drop_content').removeClass('hidden');
     	}//end if
	}

	function unsetHidden(){
	    $('#drop_content').addClass('hidden');
	}
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
			<div class="main-div">
				<div class="panel">
					<h2>아이디 찾기</h2>
					<p>가입 시 등록하신 이메일 주소를 입력해주세요</p>
				</div>
				<form id="Login">
					<div class="form-group">
						<input type="text" class="form-control" id="inputName" placeholder="이름을 입력해주세요">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" id="inputEmail" placeholder="이메일 주소를 입력해주세요">
					</div>
					<div class="forgot">
					<p>혹시 비밀번호를 찾으시나요?</p>
						<a href="find_pass_frm.do">비밀번호 찾기</a>
					</div>
					<input type="button" value="확인" class="btn"/>
				</form>
			</div>
		</div>
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
