<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 결제완료 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 결제완료창</title>

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
			
			<div style="text-align: center; margin-top: 20%">
				<h2 style="font-weight: bold">고객님의 주문이 완료되었습니다.</h2>
				<p style="color: #777777">주문내역 및 배송에 관한 안내는 <a href="order_list.do">주문조회</a>를 통하여 확인 가능합니다.</p>
			</div>
			<div style="text-align: center">
				<p style="display: inline-block; font-size: 20px">주문번호</p>
				<p style="display: inline-block; font-size: 23px; color: #C40000; margin-left: 10px">
					<c:out value="${ receiverInfo.order_num}"/>
				</p> 
			</div>
			<div style="text-align: center">
				<p style="display: inline-block">주문일자</p>
				<p style="display: inline-block; font-size: 23px; color: #C40000; margin-left: 10px">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${order_date }"/>
				</p>
			</div>
			
			<div style="text-align: center; margin-top: 70px">
			<a href="order_list_detail.do"><input type="button" class="btn btn-success" value="주문내역 상세보기" /></a> 
			<a href="user_main.do"><input type="button" class="btn btn-outline-dark" value="홈으로 이동"/></a>
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