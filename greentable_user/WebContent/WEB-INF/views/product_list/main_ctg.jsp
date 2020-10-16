<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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

<style>
.gallery-title {
    font-size: 36px; 
	font-weight: bold;
    text-align: center;
    margin-top: 80px;
}
.gallery-title:after {
    content: "";
    position: absolute;
    width: 7.5%;
    left: 46.5%;
    height: 45px;
    border-bottom: 1px solid #5e5e5e;
}

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
	/*what i did  */
	/* $("#subCtgBtn").click(function() {
		
		$("#frm").submt();
		
	});//click 
	*/
	
});//ready

function sendSubCtg(flag ,sub_ctg_nick){
	$("#flag").val(flag);
	$("#sub_flag").val(sub_ctg_nick);
	$("#frm").submit();
}
</script>

</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="naviBar">
				<c:import url="/common/jsp/user-header.jsp" />
			</div>
			
			<div>

	<img src="common/images/fish.jpg">
			
		
			</div>

			<div class="row">
				<div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
				
					<h1 class="gallery-title">
					<c:if test="${param.flag eq 'fruits' }">
						과수원
					</c:if>
					<c:if test="${param.flag eq 'grains' }">
						쌀 잡곡
					</c:if>
					<c:if test="${param.flag eq 'fish' }">
						바다와 강
					</c:if>
					
					</h1>
					
				</div>
			</div>
		</div>
		<!-- header -->

		<div id="container">
			
			<div align="center" style="margin-bottom: 70px">
	
	         <form id="frm"   action="main_ctg.do" >
	       
	           <button class="btn btn-outline-success filter-button" data-filter="sprinkle" onclick="sendSubCtg('${ param.flag }','')">전체보기</button>
	            <c:forEach var="scl" items="${ subCtgNameList }" >
	            <button id="subCtgBtn" class="btn btn-outline-success filter-button" data-filter="sprinkle"
	            	onclick="sendSubCtg('${ param.flag }','${ scl.sub_ctg_nick}')">${ scl.sub_ctg_name }</button>
	            </c:forEach>
		       <input type="hidden" id="flag" name="flag"/>
		       <input type="hidden" id="sub_flag" name="sub_flag"/>
	        </form>   
	        </div>
		
			<br/>
			<div id="mainImgDiv" style="margin-left: 50px; margin-top: 50px">
	
			<c:forEach var="mcl"  items="${ m_ctg_list }" varStatus="status">

				<div class="card" style="width: 380px; display: inline-block">
					<img class="card-img-top" src="upload/${mcl.pro_img_thumb}" alt="Card image"
						style="width: 100% ; height:350px">
					<div class="card-body">
						<h4 class="card-title"><c:out value="${mcl.product_name }"/></h4>
						<p class="card-text"><c:out value="${mcl.pro_text_info }"/></p>
						<h5 class="card-text" style="color: #FB0000"><c:out value="${mcl.option_price }"/>원</h5>
						<a href="user_cartList.jsp" class="btn btn-success stretched-link">장바구니 담기</a>
					</div>
				</div>
				<c:if test="${(status.index+1)%3 eq 0}">
				<div style="margin-top: 50px"></div>
				</c:if>
			</c:forEach>	
		
		<div style="margin-top: 50px"></div>
		
			</div>
			<!--mainImgDiv  -->
			
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