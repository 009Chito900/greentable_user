<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	 info="(회원탈퇴)비밀번호 재확인폼"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>

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
	
	$("#chkPassInfoBtn").click(function(){
		if($.trim($("#password").val()) == null || $.trim($("#password").val()) == ""){
				alert("비밀번호를 입력해주세요.");
				return;
			}else{ 
				$("#frm").submit(); 
			}//end if  
	});//click
	
}); //ready
</script>
<style>
#wrapper{position: relative}
#chkPassFormDiv{position: absolute; top: 45%; left: 30%}
#titleDiv{position: absolute; top: 33%; left: 30%}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="naviBar">
				<c:import url="/common/jsp/user-header.jsp" />
				<c:import url="/common/jsp/user-left-menu.jsp" />
			</div>
			<div id="titleDiv">
			<h3>회원탈퇴</h3>
			</div>
			<div id="chkPassFormDiv" style="background-color: #FAFAFA">
					<img src="../common/images/chkPass.png"><br/>
					<form action="dropOutChkPass.do" method="post" name="frm" id="frm">
						<span style="font-size: 20px; margin-top: 10%; margin-left: 6%; margin-bottom: 10%; margin-right: 8%" >회원 비밀번호</span>
						<input type="password" placeholder="비밀번호" id="password" name="password"  class="form-control" style="width: 40%; display: inline;"><br/>
					</form>
			</div>
			</div>
					<div id="btnDiv" style="margin-top: 5%; margin-left: 50%">
					<button type="button" id="chkPassInfoBtn" class="btn btn-success" style="width: 11%">확인</button>
					<button type="button" id="backBtn" class="btn btn-secondary" style="width: 11%">취소</button>
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