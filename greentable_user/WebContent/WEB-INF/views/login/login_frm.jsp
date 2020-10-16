<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 로그인 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인</title>

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
<link rel="stylesheet" type="text/css" href="common/css/user-header.css">
<link rel="stylesheet" type="text/css" href="common/css/user-login.css">

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

 	/* what i did  */

	/* 
	$("#loginBtn").click(function(){

		chkNull();

		
		
	});//click */
	
 

	$("#loginBtn").click(function(){

		chkNull(evt);

		
		
	});//click 
	

		$("#inputEmail").keydown(function(evt) {

			chkNull(evt);
		});
		$("#inputPassword").keydown(function(evt) {
			chkNull(evt);

		});
		
	
});//ready		

function chkNull(evt) {
	if (evt.which == 13 || evt.which == 9) {
		if ($("#inputEmail").val() == "") {
			alert("아이디 필수 입력");
			$("#inputEmail").focus();
			return;
		}
	}//end if
	if (evt.which == 13 ) {
		if ($("#inputPassword").val() == "") {
			alert("비밀번호 필수 입력");
			$("#inputPassword").focus();
			return;
		}
		$("#Login").submit();
	}//end if
}//chkPass


		
	


/* function chkNull(){
	
	 if($("#inputEmail").val() =="" || $("#inputPassword").val()=="" ){
	
		alert("아이디와 패스워드를 입력해주세요");//Please eneter ID,pass
	
		location.href='login_frm.do';
	}else{
		
		$("#Login").submit();
	}
		

	
}//chkNull
 */
	/* what i did */

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
						<h2>Login</h2>
						<p>Please enter your id and password</p>
					</div>
					
					<form id="Login" action="login_process.do" method="post">
					
				<input type="hidden" id="user_id"  value="${sessionScope.user_id }" />
				
						<div class="form-group">

					<!--다하고 input type email로 바꾸기  -->
							<input type="text" name="id" class="form-control" id="inputEmail" placeholder="아이디를 입력해주세요">
						</div>
						<div class="form-group">
							<input onkeyup="enterkey();" type="password" name="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요">
						</div>
						
						<button type="button" class="btn btn-primary" id="loginBtn" >Login</button>
						<div class="forgot">
							<a href="joinMemberForm.do">회원가입</a> | <a href="">아이디 찾기</a> | <a href="find_pass_frm.do">비밀번호 찾기</a>
						</div>
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