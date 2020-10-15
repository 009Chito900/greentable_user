<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 결제하기 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 결제하기</title>

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
 
.img-container {
    width: 120px;
    max-height: 160px;
    overflow: hidden;
}

.img-container img {
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
	/* dropdown menu */

	function unsetHidden(){
	    $('#drop_content').addClass('hidden');
	}
	
	//우편번호 검색
	$("[value='우편번호 찾기']").click(function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $("#zipcode").val(data.zonecode);
	            $("#addr1").val(roadAddr);
	        }
	    }).open();
	});//click

	
	//결제하기 버튼 눌렀을 때 Null Check
	$("#btnOrder").click(function() {
		if($("#name1").val() == ""){
			alert("주문하시는분을 입력해주세요.");
			$("#name1").focus();
			return;
		}//end if
		if($("#phone1").val() == ""){
			alert("주문하시는분 전화번호를 입력해주세요.");
			$("#phone1").focus();
			return;
		}//end if
		if($("#name2").val() == ""){
			alert("받으시는분을 입력해주세요.");
			$("#name2").focus();
			return;
		}//end if
		if($("#phone2").val() == ""){
			alert("받으시는분 전화번호를 입력해주세요.");
			$("#phone2").focus();
			return;
		}//end if
		if($("#zipcode").val() == ""){
			alert("주소를 입력해주세요.");
			$("#zipcode").focus();
			return;
		}//end if
		if($("#addr1").val() == ""){
			alert("주소를 입력해주세요.");
			$("#addr1").focus();
			return;
		}//end if
		if($("#addr2").val() == ""){
			alert("주소를 입력해주세요.");
			$("#addr2").focus();
			return;
		}//end if
		var radio = document.frm.chkRadio.checked;
		if( !radio ){
			alert("결제방법을 체크해주세요.");
		 return false;
		}//end if  
		
		var count = $('select option:selected').val(); //selected 하위의 옵션에서 선택된 값을 가져오는데 
		 if(count == "none") { //첫번쨰 option의 value값 none으로 비교
			alert("카드종류를 선택해주세요.");
			return;
		}//end if
		if($("#cardNum").val() == ""){
			alert("카드번호를 입력해주세요.");
			$("#cardNum").focus();
			return;
		}//end if
		if($("#cardMonth").val() == ""){
			alert("만료일을 입력해주세요.");
			$("#cardMonth").focus();
			return;
		}//end if
		if($("#cardYear").val() == ""){
			alert("만료일을 입력해주세요.");
			$("#cardYear").focus();
			return;
		}//end if

		var chk = document.frm.checkAgreement.checked;
		if( !chk ){
		 alert("결제서비스 약관에 동의 해주세요.");
		 return false;
		}//end if 
		
		$("#frm").submit();
	});//click
	
	
	//카드번호 하이픈(-) 자동 생성
	var cardNumber = document.getElementById('cardNum');
	cardNumber.onkeyup = function(event){
	    event = event || window.event;
	    var _val = this.value.trim();
	    this.value = autoHypenCard(_val) ;
	};
	
	function autoHypenCard(str){
	    str = str.replace(/[^0-9]/g, '');
	    var tmp = '';
	    if( str.length < 4){
	        return str;
	    }
	    else if(str.length < 8){
	        tmp += str.substr(0, 4);
	        tmp += '-';
	        tmp += str.substr(4,4);
	        return tmp;
	    }else if(str.length < 12){
	        tmp += str.substr(0, 4);
	        tmp += '-';
	        tmp += str.substr(4, 4);
	        tmp += '-';
	        tmp += str.substr(8,4);
	        return tmp;
	    }else if(str.length < 17) {

	        tmp += str.substr(0, 4);
	        tmp += '-';
	        tmp += str.substr(4, 4);
	        tmp += '-';
	        tmp += str.substr(8,4);
	        tmp += '-';
	        tmp += str.substr(12,4);
	        return tmp;
	    }
	    return str;
	}//autoHypenCard
	
});//ready
	
//주문자 정보와 동일 체크박스 선택
function sameOrder1(f) {

	if (f.name1.value == "") {
		alert("주문자 명을 먼저 넣어주세요.");
		f.chkbox.checked = false;
		$("#name1").focus();
		return;
	}
	f.name2.value = f.name1.value;
	f.phone2.value = f.phone1.value;
	f.zipcode.value = '${member.zipcode}';
	f.addr1.value = '${member.addr1}';
	f.addr2.value = '${member.addr2}';
}//sameOrder


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
				<h2 style="font-weight: bold; text-align: center; margin-top: 70px; margin-bottom: 10px">결제하기</h2>
				<p style="text-align: center; color: #777777; margin-bottom: 70px">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
			</div>

			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col" style="text-align: center">상품정보/옵션</th>
						<th scope="col">수량</th>
						<th scope="col">결제금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" class="img-container"><img src="http://localhost/design_prj/common/images/${cart1.pro_img_info}"/></th>
						<c:forEach var="optList" items="${list_data}">
							<td><c:out value="${cart1.porduct_name}"/><br/> 
								<c:out value="${optList.option_name}"/>
							</td>
							<td><c:out value="${optList.quantity}"/></td>
							<td><c:out value="${optList.option_price}"/></td>
						</c:forEach>
					</tr>
					<tr>
						<th scope="row" class="img-container"><img src="http://localhost/design_prj/common/images/${cart1.pro_img_info}"/></th>
						<c:forEach var="optList" items="${list_data}">
							<td><c:out value="${cart1.porduct_name}"/><br/> 
								<c:out value="${optList.option_name}"/>
							</td>
							<td><c:out value="${optList.quantity}"/></td>
							<td><c:out value="${optList.option_price}"/></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			
			
			<form action="user_payment_process.do" name="frm" id="frm" method="post">
			
				<h5 style="font-weight: bold; margin-top: 70px">주문하시는분 (보내시는분)</h5>
				
				<div class="form-group row" style="margin-top: 30px">
					<label class="col-sm-2 col-form-label" style="font-weight: bold" >이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="name1" name="name1" value="${member.name }"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="font-weight: bold">휴대폰 번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="phone1"  value="${member.phone }" name="phone1" oninput="this.value = this.value.replace(/[^0-9]/g, '')"/>
					</div>
				</div>
				
				
				<h5 style="font-weight: bold; margin-top: 70px; display: inline-block">받으시는분 (상품받으실분)</h5>
				
				<input type="checkbox" id="sameOrder" name="chkbox" onclick="sameOrder1(document.frm)"/>주문자 정보와 동일
				
				<div class="form-group row" style="margin-top: 30px">
					<label class="col-sm-2 col-form-label" style="font-weight: bold">받으시는분</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="name2" name="receiver_name" value="${receiverInfo.receiver_name }" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="font-weight: bold">휴대폰 번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="phone2" name="receiver_phone" oninput="this.value = this.value.replace(/[^0-9]/g, '')" value="${receiverInfo.receiver_phone }" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label" style="font-weight: bold">주소</label>
					<div class="col-sm-3">
						<input type="text" id="zipcode" name="receiver_zipcode" class="form-control" value="${receiverInfo.receiver_zipcode }" />  
					</div>
					<div class="input-group-append">
						<input type="button" class="btn btn-outline-success" value="우편번호 찾기" id="zipBtn" style="width: 200px">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="addr1" name="receiver_addr1" value="${ receiverInfo.receiver_addr1 }" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="addr2" name="receiver_addr2" value="${ receiverInfo.receiver_addr2 }" />
					</div>
				</div>
				
				<div>
					<h4 style="font-weight: bold; margin-top: 70px">결제수단</h4><hr>
					<h5 style="font-weight: bold; margin-top: 30px; display: inline-block">총결제금액</h5>
					<h4 style="display: inline-block; margin-left: 20px; color: #FB0000">111,000원</h4>
				</div>
				
					<h5 style="font-weight: bold; margin-top: 30px; display: inline-block">결제방법</h5>
					<input type="radio" id="chkRadio" style="margin-left: 40px; display: inline-block"> 
					<label class="form-check-label"> 신용카드</label>
				
					<div class="modal-body" style="margin-left: 110px">
							<h2 style="font-size: 15px; font-weight: bold; margin-top: 10px; display: inline-block">카드종류</h2>
							<select class="custom-select sm-2" id="card" name="bank" style="display: inline-block; width: 200px; margin-left: 10px">
								<option value="none">== 카드종류 선택 ==</option>
								<c:forEach var="bank" items="${ bankList }">
									<option value="${ bank }"> <c:out value="${ bank }"/> </option>
								</c:forEach>
							</select>
						
						<div style="margin-top: 10px">
							<h2 style="font-size: 15px; font-weight: bold; margin-top: 10px; display: inline-block">카드번호</h2>
							<input type="text" class="form-control" id="cardNum" name="credit_num" placeholder="xxxx-xxxx-xxxx-xxxx" maxlength="19" value="${ receiverInfo.credit_num }" 
								style="width: 200px; display: inline-block; margin-left: 10px"/> 
						</div>
						
						<div style="margin-top: 10px">
							<h2 style="font-size: 15px; font-weight: bold; margin-top: 10px; display: inline-block">만료일</h2>
							<input type="text" class="form-control" id="cardMonth" name="expiration_month" placeholder="MM" value="${ receiverInfo.expiration_month }" style="width: 100px; display: inline-block; margin-left: 25px">
							<input type="text" class="form-control" id="cardYear" name="expiration_year" placeholder="YY" value="${ receiverInfo.expiration_year }" style="width: 100px; display: inline-block; margin-left: 5px">
						</div>
				</div>
				
				<div id="checkBox" style="text-align: center; margin-top: 50px">
					<input type="checkbox" value="checkAgreement" id="checkAgreement">(필수) 결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보 제공에 동의합니다.
				</div>
			
				<!-- paymentDiv -->
				<div id="paymentDiv" style="text-align: center">
					<input type="button" class="btn btn-success" value="결제하기" id="btnOrder" style="width: 200px; height: 50px; margin-top: 100px"/>
					<a href="cart_list.do"><input type="button" class="btn btn-secondary" value="취소" style="width: 200px; height: 50px; margin-top: 100px"/></a>
				</div>
			</form>

		</div>
		<!-- container -->

		<div id="footer">
			<p>
				With supporting text below as a natural lsead-in to additional
				content.<br /> &copy; CopyRight. All Right Reserved. Class A
			</p>
		</div>
		<!-- footer -->
		
	</div>
</body>
</html>