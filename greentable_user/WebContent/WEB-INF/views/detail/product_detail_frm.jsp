<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   info="사용자 상품 상세보기 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- 다음 우편 번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Google CDN -->
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost/greentable_user/common/css/user-header.css">

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
   var price = 0;
   $("#inputGroupSelect02").change(function() {
	   if($(this).val() != 'none'){
			price = $(this).val();
		   $("#totalPrice").text(price);
	   }	
   });//미완성
   /////////////////////////////////
   //수량 down
   $('#decreaseQuantity').click(function(e) {
      e.preventDefault();
      var stat = $('#numberUpDown').text();
      var num = parseInt(stat, 10);
      num--;
      if (num <= 0) {
         alert('더이상 줄일수 없습니다.');
         num = 1;
      }
      $('#numberUpDown').text(num);
      var quantity = $("#numberUpDown").text() * 1;
	  $("#totalPrice").text(quantity * price);
   });//click
   //수량 up
   $('#increaseQuantity').click(function(e) {
      e.preventDefault();
      var stat = $('#numberUpDown').text();
      var num = parseInt(stat, 10);
      num++;
      $('#numberUpDown').text(num);
      var quantity = $("#numberUpDown").text() * 1;
	  $("#totalPrice").text(quantity * price);
   });//click
   
   $("#closeOption").click(function(){
	   
   });

   
   $("#btnCart").click(function(){
	  if(confirm("장바구니를 보시겠습니까?")){
		  $("frm").prop("action", "cart_list.do");
		  $("frm").submit();
	  }
   });
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
		<form action="" id="frm" name="frm">
		<input type="hidden" id="productNum" name="productNum" value="${pddd.product_num }"/>
		<input type="hidden" id="productName" name="productName" value="${pddd.product_name }"/>
		<input type="hidden" id="proImgInfoName" name="proImgInfoName" value="${pddd.pro_img_info }"/>
		<input type="hidden" id="proImgThumName" name="proImgThumName" value="${pro_img_thumb }"/>
		<input type="hidden" id="productTooltip" name="productTooltip" value="${product_tooltip }"/>
		<input type="hidden" id="subCtg" name="subCtg" value="${pddd.sub_ctg_name }"/>
		<input type="hidden" id="onSale" name="onSale" value="${pddd.on_sale }"/>
		<input type="hidden" id="proTextInfo" name="proTextInfo" value="${pddd.pro_text_info }"/>
		
			<img src="http://localhost/greentable_admin/upload_img/${pddd.pro_img_thumb }"
				style="width: 500px; margin-top: 50px; margin-left: 100px" />

			<div id="productDetail" style="float: right; margin-top: 80px; margin-right: 90px">
         
            <h2 style="font-weight: bold"><c:out value="${pddd.product_name }"/></h2>
            <p><c:out value="${pddd.pro_text_info }"/></p>
            <h2 style="display: inline-block"><c:out value="${pddd.podList[0].option_price }"/>원</h2><br/>
           
            <div class="input-group mb-3" style="width: 400px; margin-top: 10px">
               <p style="display: inline-block; margin-top: 10px"> 옵션 </p>
               <select class="custom-select" id="inputGroupSelect02" style="margin-left: 60px">
                  <option value="none">-- (필수) 옵션선택 --</option>
                  <c:forEach var="po" items="${pddd.podList }">
                  <option value="${po.option_price }"><c:out value="${po.option_name }"/>(<c:out value="${po.option_price }"/>)</option>
                  </c:forEach>
               </select>
            </div>
           
            <p style="display: inline-block">구매수량</p>
            <div style="display: inline-block; margin-left: 25px">
           
            <div class="number" id="quantity" name="quantity">
            	<span id="optionName"></span>
            	<span id="optionPrice"></span>
               <a href="#" id="decreaseQuantity"><i class="fas fa-caret-square-down" style="font-size: 20px; color: black"></i></a>
               <span id="numberUpDown"> 1 </span>
               <a href="#" id="increaseQuantity"><i class="fas fa-caret-square-up" style="font-size: 20px; color: black"></i></a>
               <a href="#" id="closeOption"><i class="fas fa-times" style=""></i></a>
            </div>
            
            </div>
           
            <hr>
            <div id="totalAmount" style="float: right">
               <p style="display: inline-block">총 상품금액 : </p> <h2 style="display: inline-block"><span id="totalPrice"></span>원</h2>
            </div>
           
            <div id="btnDiv">
               <a href="user_payment_frm.do"><input type="button" class="btn btn-success" value="결제하기" id="btnOrder" style="width: 400px; height: 50px; margin-top: 30px"/></a><br/>
               <input type="button" class="btn btn-outline-success" value="장바구니 담기" id="btnCart" style="width: 400px; height: 50px; margin-top: 10px"/>
            </div>
         </div>
         <!-- productDetail -->
         
         <hr>
         <h2 style="font-weight: bold; margin-top: 50px">상품설명</h2>
         <div id="itemDetailImg" style="margin-left: 300px; margin-top: 50px">
            <img src="http://localhost/greentable_admin/upload_img/${pddd.pro_img_info }" style="margin-bottom: 70px"/><br/>
         </div>
         <hr>  
         <h2 style="font-weight: bold">배송안내</h2>
         <img src="http://localhost/greentable_user/common/images/배송안내.png" style="margin-left: 340px; margin-top: 50px; margin-bottom: 70px"/><br/>
		</form>
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