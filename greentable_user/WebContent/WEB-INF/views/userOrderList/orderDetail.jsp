<%@page import="kr.co.greentable.user.domain.SelectUserOrderListDomain"%>
<%@page import="kr.co.greentable.user.domain.SelectUserOrderNumDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	 info="주문내역 상세보기"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세보기</title>

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

}); //ready
</script>
<style>
#wrapper{position: relative; min-height: 1500px}
#orderListTitileDiv{position: absolute; top: 17%; left: 30%; width: 60%}
#orderListTableDiv{position: absolute; top: 25%; left: 31%; width: 55%}
#footer{position: absolute; top: 100%}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="naviBar">
				<c:import url="/common/jsp/user-header.jsp" />
				<c:import url="/common/jsp/user-left-menu.jsp" />
			</div>
			<div id="orderListTitileDiv">
					<h3>주문내역 상세보기</h3>
					<hr>
			</div>
			<!-- order_detail -->
			<div id="orderListTableDiv">
			<label style="margin-bottom: 0px">주문일자 <c:out value="${ order_date }"/></label>
			<hr style="margin-top: 1%; margin-bottom: 2%" >
			<table class="table table-bordered">
					  	<tr>
					  		<td rowspan="2" style="width: 100px; height: 150px"><img src="http://localhost/greentable_user/common/images/<c:out value="${ order_detail.pro_img_thumb }"/>" style="width: 100px; height:150px"/></td>
					  		<td style="text-align: left"><c:out value="${ order_detail.product_name }"/></td>
					  	</tr>
					  	<tr>
					  		<td><c:out value="${ order_detail.option_price }"/>원</td>
					  	</tr>
					  </table>
			<hr style="margin-bottom: 0px">
			<table class="table table-bordered" style="margin-top: 0px; margin-bottom: 5%">
					  	<tr>
					  		<td style="width: 12%">주문번호</td> 
					  		<td><c:out value="${ order_num }"/></td>
					  	</tr>
					  	<tr>
					  		<td style="width: 12%">주문수량</td>
					  		<td><c:out value="${ order_detail.quantity }"/>개 (<c:out value="${ order_detail.total_price }"/>원)</td>
					  	</tr>
			</table>
			<div id="orderListInfoDiv" style="background-color: #FBFBFB; padding: 3%" > 
				<h4 style="margin-bottom: 2%">결제 정보</h4>
				<span style="margin-right: 5%; font-size: 18px">총 상품금액</span><sapn style="font-size: 18px"><c:out value="${ order_detail.total_price }"/> 원</span>
				<h4 style="margin-top: 5%;margin-bottom: 2%">배송 정보</h4>
				<span style="margin-right: 5%; font-size: 18px">받으시는 분</span><sapn style="font-size: 18px"><c:out value="${ order_detail.receiver_name }"/></span><br/>
				<span style="margin-right: 9%; font-size: 18px">연락처</span><sapn style="font-size: 18px"><c:out value="${ order_detail.receiver_phone }"/></span><br/>
				<span style="margin-right: 9%; font-size: 18px">배송지</span>
				<sapn style="font-size: 18px">
					(<c:out value="${ order_detail.receiver_zipcode }"/>) &nbsp;
					<c:out value="${ order_detail.receiver_addr1 }"/> &nbsp;
					<c:out value="${ order_detail.receiver_addr2 }"/>
				</span><br/>
				<h4 style="margin-top: 7%;margin-bottom: 2%">취소 및 교환/반품 안내</h4>
				<span style="font-size: 16px">구매하신 배송상품의 취소/환불 또는 교환/반품을 원하실 경우에는 다음 내용을 참고해 주세요.</span><br/>
				<span style="font-size: 16px">&gt; 물품 배송 전 청약 철회 (취소/환불)</span><br/>
				<span style="font-size: 16px">상품(재화)를 판매자가 배송하기 이전에는 취소 및 환불 가능</span><br/>
				<br/>
				<span style="font-size: 16px">* 청약 철회 방법</span><br/>
				<span style="font-size: 16px">주문내역 &gt; 해당 주문 상세화면에서 취소 선택</span><br/>
				<br/>
				<span style="font-size: 16px">&gt; 물품 배송 후 청약 철회 (교환/반품 환불)</span><br/>
				<span style="font-size: 16px">상품(재화)의 공급을 받은 날로부터 7일 이내 청약 철회 가능</span><br/>
			</div>
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