<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	 info="회원탈퇴"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

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
	
	$("#dropOutBtn").click(function(){
		if($("#dropOutChk").is(":checked") == true){
			location.href="dropOut.do";
		}else{
			alert("회원탈퇴에 동의 버튼을 눌러주세요.");
			return;
		}//end else
	});//click
	
	$("#backBtn").click(function(){
		location.href=""; //메인으로 이동
	});//click
	
}); //ready
</script>
<style>
#wrapper{position: relative}
#dropOutDiv{position: absolute; top: 30%; left: 30%}
#titleDiv{position: absolute; top: 22%; left: 30%}
#agreeChk{position: absolute; top : 50%; left: 46%}
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
			<div id="dropOutDiv" style="background-color: #FAFAFA">
					<br/>
					<ul>
					<li>회원 탈퇴시 적립금, 예치금, 쿠폰, 마일리지, 상품권 등의 초록식탁통장이 자동삭제 됩니다.</li>
					<li>출고 이전 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가합니다.(주문 취소 혹은 출고 이후 탈퇴 가능)</li>
					<li>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은 6월,<br/> 
					계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
					</ul>
			</div>
			<div id="agreeChk">
				<input type="checkbox" id="dropOutChk" name="dropOutChk"/> 상기 내용을 확인하였으며 회원탈퇴 합니다.<br/>
			</div>
			<div id="btnDiv" style="margin-top: 5%; margin-left: 50%">
				<button type="button" id="dropOutBtn" class="btn btn-success">회원탈퇴</button>
				<button type="button" id="backBtn" class="btn btn-secondary">취소</button>
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