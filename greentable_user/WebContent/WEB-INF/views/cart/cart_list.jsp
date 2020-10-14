<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.greentable.user.domain.CartListDomain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 장바구니 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

session.setAttribute("user_id", request.getParameter("id"));
session.setAttribute("proImgInfo", request.getParameter("proImgInfo"));
session.setAttribute("productName", request.getParameter("productName"));
session.setAttribute("productNum", request.getParameter("productNum"));
session.setAttribute("optionName", request.getParameter("optionName"));
session.setAttribute("optionPrice", request.getParameter("optionPrice"));
session.setAttribute("quantity", request.getParameter("quantity"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 장바구니</title>
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
.table-shopping a {
    text-decoration: none;
	font-size: 15px;
	color: #333;
}

.table-shopping a:hover{
    text-decoration: none;
}

.table-shopping>thead>tr>th {
	font-weight: bold;
    font-size: 15px;
}
 
.table-shopping .img-container {
    width: 120px;
    max-height: 160px;
    overflow: hidden;
    display: block;
}

.table-shopping .img-container img {
    width: 100%;
}

.table td {
	vertical-align: middle;
}
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
	/* dropdown menu */
	
	
	
	
	
	//체크박스 전체선택
	$("#allCheck").click(function(){ 
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allCheck").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); 
		} else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[type=checkbox]").prop("checked",false); 
		}//end else
	});//click

	//체크박스를 하나라도 풀면 전체선택 체크박스를 푸는 스크립트
    $("#chk_product").click(function(){
    	$("#allCheck").prop("checked", false);
    });//click
	
	
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
	});//click
	
	//수량 up
	$('#increaseQuantity').click(function(e) {
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat, 10);
		num++;
		$('#numberUpDown').text(num);
	});//click
	

	//선택삭제
	$('#btnDel').click(function(){
	       if(confirm("삭제하시겠습니까?")){
	           $("input[name=chk_product]:checked").each(function(){
	               var tr_value =$(this).val();
	               var tr=$("tr[data-tr_value='"+tr_value+"']");
	               tr.remove();
	           });//each
	       }else{
	           return false;
	       }//end else
	});//click
	
	//요청하는 do를 변경
/* 	$("#btnDel").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			//form태그의 action속성을 변경, document.폼이름.action = "변경할액션"
			document.frm.action = "remove_cart.do";
			//document.frm.enctype = "application/x-www.form-urlencoded"; //파라메터 전송방식으로 변경
			$("[name='frm']").submit();
		}
	});//click */
	
	//장바구니 삭제
	<c:if test ="${ move_page eq 'del' }">
		
		<c:if test = "${ delFlag}">
			alert("삭제되었습니다.");
		</c:if>
		
		<c:if test = "${ not delFlag}">
			alert("삭제하지 못했습니다.");
			history.back();
	   	</c:if>
	   	
	</c:if>
	

	//금액 총 합계
	function itemSum(){
        var str = "";
        var sum = 0;
        var count = $("#allCheck").length;
        for(var i=0; i < count; i++ ){
            if( $("#allCheck")[i].checked == true ){
             sum += parseInt($("#allCheck")[i].value);
            }//end if
        }//end for
        $("#total_sum").html(sum + " 원");
        $("#numberUpDown").val(sum);
     }//itemSum
	
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
			<div id="cartList">
				<h2 style="font-weight: bold; text-align: center; margin-top: 70px; margin-bottom: 70px">장바구니</h2>
			</div>

			<table class="table table-shopping">
				<thead>
					<tr>
						<th style=" width: 110px"> 
							 <input type="checkbox" id="allCheck" style="margin-right: 10px"/>전체선택
						</th>					
						<th style="width: 50px"></th>
						<th style="width: 500px">상품정보/옵션</th>
						<th style="width: 200px">수량</th> 
						<th style="width: 150px">상품금액</th>
						<th style="width: 100px">주문금액</th>
					</tr> 
				</thead>
				
				<tbody>
					<c:if test="${ empty list_data }" >
					<tr>
						<td colspan="5">장바구니가 비어있습니다.</td>
					</tr>
					</c:if>
					
					<tr data-tr_value="1">
						<td><input type="checkbox" id="chk_product" value="1"/></td>
						<td>
							<div class="img-container">
								<a href="item_detail.do"><img src="http://localhost/design_prj/common/images/${cart1.pro_img_info}" /></a>
							</div>
						</td>
						<c:forEach var="list" items="${list_data}">
							<td>
							<c:out value="${cart1.porduct_name}"/>
							<select	style="margin-left: 20px">
								<option value="none">--- 옵션 선택 ---</option>
								<option><c:out value="${list.option_name}"/></option>
							</select>
							</td>
							<td>
							<div class="number">
								<a href="#" id="decreaseQuantity"><i class="fas fa-arrow-alt-circle-down down"></i></a>
								<span id="numberUpDown"> 1 </span>
								<a href="#" id="increaseQuantity"><i class="fas fa-arrow-alt-circle-up up"></i></a> 
							</div> 
							</td>
							<td><c:out value="${list.option_price}"/></td>
							<%-- <td><c:out value="${list.total_price}"/></td> --%>
						</c:forEach>
					</tr>
					<tr data-tr_value="2">
						<td><input type="checkbox" id="chk_product" value="2"/></td>
						<td>
							<div class="img-container">
								<a href="item_detail.do"><img src="http://localhost/design_prj/common/images/${cart1.pro_img_info}" /></a>
							</div>
						</td>
						<c:forEach var="list" items="${list_data}">
							<td><c:out value="${cart1.porduct_name}"/>
							<select	style="margin-left: 20px">
								<option value="none">--- 옵션 선택 ---</option>
								<option><c:out value="${list.option_name}"/></option>
							</select>
							</td>
							<td>
							<div class="number">
								<a href="#" id="decreaseQuantity"><i class="fas fa-arrow-alt-circle-down down"></i></a>
								<span id="numberUpDown"> 1 </span>
								<a href="#" id="increaseQuantity"><i class="fas fa-arrow-alt-circle-up up"></i></a> 
							</div> 
								</td>
							<td><c:out value="${list.option_price}"/></td>
							<%-- <td><c:out value="${list.total_price}"/></td> --%>
						</c:forEach>
					</tr>
					<!-- <tr>
					</tr> -->
				</tbody>
			</table>
			
			<div id="chkDel">
				<input type="button" class="btn btn-outline-dark" id="btnDel" value="선택삭제" style="margin-top: 10px"/>
			</div>
			
			<div style="margin-left: 75%">
				<h4 style="display: inline-block; font-weight: bold">결제예정금액</h4>
				<h4 id="total_sum" style="margin-left: 50px; display: inline-block">68,800원</h4>
			</div>  
			
			<!-- 주문하기 -->
			<div style="text-align: center">
				<a href="user_item_detail.do"><input type="button" class="btn btn-outline-success" value="계속 쇼핑하기" style="width: 200px; height: 50px; margin-top: 100px"></a>
				<a href="user_payment_frm.do"><input type="button" class="btn btn-success" value="주문하기" style="width: 200px; height: 50px; margin-top: 100px"></a>
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