<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	 info="(회원탈퇴)회원탈퇴 완료"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 완료</title>

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
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-left-menu.css">


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
	
	$("#mainBtn").click(function(){
		location.href="http://localhost/greentable_user/logOut.do"; //메인으로 이동
	});//click
	
}); //ready
</script>
<style>
#wrapper{position: relative}
#successDropOutDiv{position: absolute; top: 25%; left: 30%}
#btnDiv{position: absolute; top: 60%; left: 52%}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="naviBar">
				<c:import url="/common/jsp/user-header.jsp" />
				<c:import url="/common/jsp/user-left-menu.jsp" />
			</div>
			<div id="successDropOutDiv">
					<img src="http://localhost/greentable_user/common/images/successDropOut.png" style="width: 75%"/><br/>
			</div>
			<div id="btnDiv">
					<button type="button" id="mainBtn" class="btn btn-success">홈으로 이동</button>
			</div>
		</div>
		<!-- header -->
		
		<div id="container"></div>
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