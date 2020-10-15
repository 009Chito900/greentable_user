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

	
	//확인버튼 눌렀을 때 Null Check
	$("[value='확인']").click(function() {
		if($("#name").val() == ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}//end if
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}//end if
		if($("#email").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return;
		}//end if
	});//click
	
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
					<h2>비밀번호 찾기</h2>
					<p>가입 시 등록하신 이메일 주소로 임시 비밀번호가 발송됩니다</p>
				</div>
				<form action="find_pass_process.do" method="post" id="Login">
					<div class="form-group">
						<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요">
					</div>
					<div class="forgot">
					<p>혹시 아이디를 찾으시나요?</p>
					<a href="find_id_frm.do" id="searchId">아이디 찾기</a>
					</div>
					<input type="submit" value="확인" class="btn"/>
				</form>
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
