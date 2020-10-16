<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="회원가입완료"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>

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
<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		location.href='http://localhost/greentable_user/login_frm.do';
	});//click
	
	$("#mainBtn").click(function(){
		location.href='http://localhost/greentable_user/main.do';
	});//click

}); //ready
</script>
<style>
#wrapper{text-align: center}
</style>
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
		<img src="http://localhost/greentable_user/common/images/joinmember_success.png" style="width: 70%; height: 75%; margin-top: 10%; margin-bottom: 5%"><br/>
		<button type="button" id="loginBtn" class="btn btn-success" style="width: 8%; height: 8%; margin-right: 2%">로그인</button>
		<button type="button" id="mainBtn" class="btn btn-success">메인으로 이동</button>
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