<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 회원가입 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 회원가입</title>

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
<!-- 회원가입 유효성 검사 -->
<script type="text/javascript">

$(function(){
	
	$("#idDup").click(function() {
		var top=window.screenY+200;
		var left=window.screenX+100;
		window.open("chkDupIdForm.do","id","width=550,height=230,top="+top+",left="+left);
	});//click
	
	$("#emailDup").click(function() {
		var top=window.screenY+200;
		var left=window.screenX+100;
		window.open("chkDupEmailForm.do","id","width=550,height=230,top="+top+",left="+left);
	});//click
	
	$("#password2").focusout(function() {
		if($("#password").val()!=$("#password2").val()){
			alert("비밀번호를 확인해 주세요.")
			$("#password").val("");
			$("#password2").val("");
			$("#password").focus();
		}//end if
	})//focusout
	
	$("#mail").change(function() {
		$("#email2").val($("#mail").val());
	})//change
	
	$("[value='검색']").click(function() {
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
	})//click
	
	$("[value='가입']").click(function() {
		
		if($("#id").val().trim()==""){
			alert("아이디는 필수 입력 사항 입니다.");
			return;
		}//end if
		if($("#password").val().trim()==""){
			alert("비밀번호는 필수 입력 사항 입니다.");
			$("#password").focus();
			return;
		}//end if
		if($("#password2").val().trim()==""){
			alert("비밀번호확인은 필수 입력 사항 입니다.");
			$("#password2").focus();
			return;
		}//end if
		if($("#name").val().trim()==""){
			alert("이름은 필수 입력 사항 입니다.");
			$("#name").focus();
			return;
		}//end if
		if($("#email").val().trim()==""){
			alert("이메일은 필수 입력 사항 입니다.");
			$("#email").focus();
			return;
		}//end if
		if($("#zipcode").val().trim()==""){
			alert("우편번호는 필수 입력 사항 입니다.");
			return;
		}//end if
		if($("#addr1").val().trim()==""){
			alert("주소는 필수 입력 사항 입니다.");
			$("#addr1").focus();
			return;
		}//end if
		if($("#addr2").val().trim()==""){
			alert("상세주소는 필수 입력 사항 입니다.");
			$("#addr2").focus();
			return;
		}//end if
		if($('input:checkbox[name=agreement]:checked').length != $('input:checkbox[name=agreement]').length){
			alert("모든 약관에 동의해주세요.");
			return;
		}//end if 
		
		$("#frm").submit();//전송
		
	})//click
	
});//ready

</script>
<style>
.btnDesign {

    width:100px;
    height: 30px;
    background-color: #223D25;
    border: none;
    color:#fff;
    text-align: center;
    margin:5px;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 2px;
    cursor: pointer;

}
</style>
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
		<!-- container -->
		<div id="memberDiv">
		<h3 style="margin-left: 43%">회원가입</h3><br/>
		<hr>
		<h6 style="text-align: right; margin-right: 25%">*는 필수입력</h6>
		<form action="addJoinMember.do" method="post" name="frm" id="frm">
			<table id="joinTable" class="table table-borderless" style="width: 50%; margin-left: 30%">
				<tr>
					<th><span class="point">*</span>아이디</th>
					<td>
						<input type="text" style="width:120px" class="inputBox" name="id" id="id" readonly="readonly" maxlength="10"/>
						&nbsp;
						<input type="button" value="중복확인" name="btn" class="btnDesign" id="idDup"/> 
					</td>
				</tr>
				<tr>
					<th><span class="point">*</span>비밀번호</th>
					<td><input type="password" style="width:100px" class="inputBox" name="password" id="password" maxlength="30"/></td>
				</tr>
				<tr>
					<th><span class="point">*</span>비밀번호확인</th>
					<td><input type="password" style="width:100px" class="inputBox" name="password2" id="password2" maxlength="30"/></td>
				</tr>
				<tr>
					<th><span class="point">*</span>이름</th>
					<td><input type="text" style="width:120px" class="inputBox" name="name" id="name" maxlength="10"/></td>
				</tr>
				<tr>
					<th><span class="point">*</span>이메일</th>
					<td>
						<input type="text" style="width:200px" class="inputBox" name="email" id="email" readonly="readonly" maxlength="50"/>
						&nbsp;
						<input type="button" value="중복확인" name="btn" class="btnDesign" id="emailDup"/>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="text" style="width:120px" class="inputBox" name="phone" id="phone" maxlength="13"/>
					</td>
				</tr>
				<tr>
					<th><span class="point">*</span>우편번호</th>
					<td>
						<input type="text" style="width:80px" class="inputBox" readonly="readonly" name="zipcode" id="zipcode" maxlength="6"/>
						<input type="button" value="검색" class="btnDesign"/>
					</td>
				</tr>
				<tr>
					<th><span class="point">*</span>주소</th><td>
					<input type="text" style="width:300px" class="inputBox" readonly="readonly" name="addr1" id="addr1" maxlength="100"/></td>
				</tr>
				<tr>
					<th><span class="point">*</span>상세주소</th>
					<td><input type="text" style="width:300px" class="inputBox" name="addr2" id="addr2" maxlength="100"/></td>
				</tr>
			</table>
		</form>
			<hr style="margin-top: 5%">
			<div id="agreement" align="center" style="font-size: 15px; margin-top: 2%">
				<h3 style="margin-left: 46%">약관</h3><br/>
				<textarea name="약관" style="width: 500px; height: 100px">
1조 (목적) 
이 약관은 ( “초록마켓” ) 에서 제공하는 쇼핑몰을 이용함에 있어 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

제2조 (정의)
① 쇼핑몰이라 함은 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보 통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.

② 이용자라 함은 쇼핑몰에 접속하여 서비스를 받는 회원 및 비회원을 말합니다.

③ 회원이라 함은 쇼핑몰에 개인정보를 제공하여 회원등록을 한 자로서, 쇼핑몰의 정보를 지속적으로 제공받으며, 서비스를 이용할 수 있는 자를 말합니다.

④ 비회원이라 함은 회원에 가입하지 않고 쇼핑몰이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관의 명시와 개정)
① (“초록마켓 )은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 쇼핑몰의 초기 서비스화면(전면)에 게시합니다.

② 쇼핑몰은 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

③ 쇼핑몰이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.

④ 쇼핑몰은 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 “이용자가 상당한 기간 내에 변경 약관에 대한 동의 여부를 표명하지 아니하는 때에는 변경약관의 적용을 받는 것으로 본다”는 내용의 취지를 통지를 하였음에도 동의 여부를 표명하지 아니한 경우 또는 부득이한 사유로 그러한 통지를 할 수 없는 경우에도 개정약관이 적용됩니다.

⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조 (서비스의 제공 및 변경)
① 쇼핑몰은 다음과 같은 업무를 수행합니다.

가. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결

나. 구매계약이 체결된 재화 또는 용역의 배송

다. 기타 쇼핑몰이 정하는 업무

② 쇼핑몰은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.

③ 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우 쇼핑몰은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, 쇼핑몰의 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.

제5조 (서비스의 중단)
① 쇼핑몰은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

② 제1항에 의한 서비스 중단의 경우에는 쇼핑몰 이용약관 제8조에 정한 방법으로 이용자에게 통지합니다.

③ 쇼핑몰은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 쇼핑몰에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.

제6조 (회원가입)
① 이용자는 쇼핑몰이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 하며, 자동적으로 연합사이트인 쇼핑몰의 회원자격을 부여합니다.

② 쇼핑몰은 다음 각 호에 해당하면 쇼핑몰 회원으로 등록거부를 할 수 있습니다.

가. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우,         다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 쇼핑몰의 회원 재 가입 승낙을 얻은 경우에는 예외로 한다.

나. 등록 내용에 허위, 기재누락, 오기가 있는 경우

다. 기타 회원으로 등록하는 것이 쇼핑몰 기술상 현저히 지장이 있다고 판단되는 경우

라. 만 14세 미만으로 보호자 동의가 없는경우

③ 회원가입계약의 성립 시기는 승낙이 회원에게 도달한 시점으로 합니다.

④ 회원은 본 쇼핑몰 및 쇼핑몰의 다양한 이벤트를 받을 수 있으며, 원치 않는 경우 본 쇼핑몰을 통해 탈퇴할 수 있습니다.

⑤ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 직접변경 및 전자우편 기타 방법으로 쇼핑몰에 대하여 그 변경사항을 알려야 합니다.

제7조 (회원 탈퇴 및 자격 상실 등)
① 회원은 쇼핑몰에서 언제든지 탈퇴를 요청할 수 있으며 쇼핑몰은 즉시 회원탈퇴를 처리합니다.

② 회원이 다음 각 호의 사유에 해당하는 경우, 쇼핑몰은 회원자격을 제한 및 정지시킬 수 있습니다.

i. 가입 신청 시에 허위 내용을 등록한 경우

ii. 가입시 제 6조 ②항에 해당되는 경우

iii. 쇼핑몰을 이용하여 구입한 재화·용역 등의 대금, 기타 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우

iv. 다른 사람의 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우

v. 쇼핑몰을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회원자격을 상실 시킬 수 있습니다.

④ 쇼핑몰에서 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.

제8조 (회원에 대한 통지)
① 회원에 대한 통지를 하는 경우, 회원이 쇼핑몰에 제출한 전자우편 주소로 할 수 있습니다.

② 불특정다수 회원에 대한 통지의 경우 1주일이상 공지사항 및 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.

제9조 (구매신청)
쇼핑몰 이용자는 이하의 방법에 의하여 구매를 신청합니다.

가.성명, 주소, 전화번호, 이메일 입력

나.재화 또는 용역의 선택

다.결제방법의 선택

라.구매내용 확인후 최종결정(예, “주문완료”마우스 클릭)

제10조 (계약의 성립)
① 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.

가.신청 내용에 허위, 기재누락, 오기가 있는 경우

나.미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우

다.기타 구매신청에 승낙하는 것이 기술상 현저히 지장이 있다고 판단하는 경우

② 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

제11조 (지급방법)
쇼핑몰에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.

가.계좌이체

나.신용카드결제

다.온라인무통장입금

라.쇼핑몰에서 지급한 적립금 또는 e-cash에 의한 결제 등

제12조 (수신확인통지·구매신청 변경 및 취소)
① 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.

② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.

③ 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.

제13조 (배송)
이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다.

제14조 (환급, 반품 및 교환)
① 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 영업일 기준 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 영업일 기준 3일 이내에 계약해제 및 환급절차를 취합니다.

② 다음 각 호의 경우에는 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다.

가.배송된 재화가 주문내용과 상이하거나 쇼핑몰이 제공한 정보와 상이할 경우

나.배송된 재화가 파손, 손상되었거나 오염되었을 경우

다.재화가 광고에 표시된 배송기간보다 늦게 배송된 경우

라.방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우

단, 재화 등의 내용이 표시, 광고 내용 또는 계약내용과 다르게 이행된 경우에는, 당해 재화를 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회를 할 수 있습니다.

제15조 (개인정보보호)
① 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.

가.성명

나.주민등록번호(회원의 경우)

다.주소

라.전화번호 및 이동전화번호

마.희망ID(회원의 경우)

바.비밀번호(회원의 경우)

사.E-mail (회원의 경우)

아.메일수신 여부 (회원의 경우)

② 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.

③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 쇼핑몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.

가.배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우

나.통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우

다.여행 상품 이용 시 여행 상품 제공을 목적으로 해당 기관에 알려주는 경우

라.고객의 제세공과금(원천징수 세금 포함) 관련 해당 기관에 통보하는 경우

마.당사가 제공하는 서비스의 질을 향상시키기 위한 당사의 비즈니스 파트너와의 제휴 서비스, 당사가 운영하는 콜 센터의 텔레 마케팅 서비스(보험, 신용카드 등)를 위하여 최소한의 정보를 이용하는 경우

바.당사의 사후 불만처리 업무 및 고객서비스 업무를 수행하는 제3자에게 최소한의 정보를 제공하는 경우

④ 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는 자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

⑤ 이용자는 언제든지 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 쇼핑몰은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.

⑥ 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.

⑦ 쇼핑몰 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. 단, 쇼핑몰에서 지급된 적립금 및 e-cash를 이용과 관련한 개인정보는 관련 회계처리가 모두 종료되는 시점에 파기합니다.

제16조 (쇼핑몰의 의무)
①  쇼핑몰은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.

②  이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

③  상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.

④  이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제17조 ( 회원의 ID 및 비밀번호에 대한 의무)
①  제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

②  회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

③  회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 쇼핑몰에 통보하고 안내가 있는 경우에는 그에 따라야 합니다.

제18조 (이용자의 의무)
이용자는 다음 행위를 하여서는 안됩니다.

가. 신청 또는 변경 시 허위내용의 등록

나. 쇼핑몰에 게시된 정보의 변경

다. 쇼핑몰이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시

라. 쇼핑몰 또는 기타 제3자의 저작권 등 지적재산권에 대한 침해

마. 쇼핑몰 또는 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위

바. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제19조 (연결 몰과 피연결 몰 간의 관계)
①  상위 몰과 하위 몰이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 몰(웹 사이트)이라고 하고 후자를 피연결 몰(웹사이트)이라고 합니다.

②  연결몰은 피연결몰이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결몰의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제20조 (저작권의 귀속 및 이용제한)
①  쇼핑몰이 작성한 저작물에 대한 저작권 기타 지적재산권은 쇼핑몰에 귀속합니다.

②  이용자는 쇼핑몰을 이용함으로써 얻은 정보를 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

제21조 (분쟁해결)
①  이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.

②  이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.

③  이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의
 조정에 따를 수 있습니다.

제22조 (재판권 및 준거법)
①  이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.

②  이용자간에 제기된 전자거래 소송에는 한국 법을 적용합니다.

제23조 e-cash, 적립금 소멸 및 양도)
①  고객이 회원을 탈퇴한 경우에, e-cash 적립금 모두 소멸되며 재 적립되지 않습니다.

② e-cash 적립금은 타인에게 양도될 수 없습니다.
				</textarea>
			<br/><br/>
			<input type="checkbox" name="agreement" id="agreeChk" value="동의" class="btn btn-success" />동의
			</div>
			<br/>
			
			<div id="agreement" align="center" style="font-size: 15px">
			
				<textarea name="약관" style="width: 500px; height: 100px">
정보통신부에서 시행하는 정보통신망 이용촉진 등에 관한 법률상의 개인정보 보호제도에 따라 회원들의 개인정보 관리에 만전을 기하고 있으며 회원들이 모든 서비스를 안심하고 이용할수 있도록 하기 위해 항상 최선을 다하고 있습니다.

"초록마켓" 의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다.

가. 수집하는 개인정보 항목 및 수집방법
나. 개인정보의 수집 및 이용목적
다. 수집한 개인정보의 공유 및 제공
라. 개인정보취급 위탁
마. 수집한 개인정보의 보유 및 이용기간
바. 개인정보의 파기절차 및 방법
사. 이용자 및 법정대리인의 권리와 그 행사방법
아. 개인정보 자동 수집 장침의 설치 (운영 및 그 거부에 관한 사항)
자. 개인정보 관리책임자 및 담당자의 소속 (성명 및 연락처)
가. 수집하는 개인정보 항목 및 수집방법
"초록마켓"은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

▶ 이름, 이메일, 주민등록번호, 주소, 연락처, 핸드폰 번호, 월소득, 직업

또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.

▶ 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 이용정지 기록

"초록마켓"은 다음과 같은 방법으로 개인정보를 수집합니다.

▶ 홈페이지, 서면양식, 전화

- 팩스를 통한 회원가입, 상담 게시판, 경품 행사 응모, 배송 요청

▶ 제휴사로부터의 제공

▶ 생성정보 수집 툴을 통한 수집

나. 개인정보 수집 및 이용목적
"초록마켓" 는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

▶ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

- 콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결재, 요금추심

▶ 회원 관리

- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달

▶ 마케팅 및 광고에 활용

- 신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달

다. 개인정보의 공유 및 제공

[제3자 제공 안할 경우]

"초록마켓"은 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

- 이용자들이 사전에 동의한 경우

- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우


[제3자 제공할 경우]

"초록마켓"은 회원에 대하여 보다 더 질 높은 서비스 제공 등을 위해 아래와 같이 귀하의 개인정보를 제공하고 있습니다.

▶ 제공정보의 이용 목적 : 제휴 마케팅

- 제공 정보 : 이름, 이메일, 핸드폰 번호, 주소, 생년월일

- 제공 정보의 보유 및 이용 기간 : 초록마켓 회원 탈퇴 시까지


다만, 아래의 경우에는 예외로 합니다.

- 이용자들이 사전에 동의한 경우

- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

라. 수집한 개인정보 취급 위탁

[업무위탁 안 할 경우]

"초록마켓"은 고객님의 동의 없이 고객님의 개인정보 취급을 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.


[업무위탁 할 경우]

"초록마켓"은 서비스 이행을 위해 아래와 같이 개인정보 취급 업무를 외부 전문업체에 위탁하여 운영하고 있습니다.

▶ 초록마켓 컨설팅

- 위탁업무 내용 : 상담업무 효율성 제고를 위한 고객센터 운영

마. 수집한 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.


▶ 회원 ID

- 보존 이유 : 서비스 이용의 혼선방지

- 보존 기간 : 탈퇴후 6개월

바. 개인정보 파기절차 및 방법
"초록마켓"은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

▶ 파기절차

- 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어 집니다.

동 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.

▶ 파기방법

- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고

- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

사. 이용자 및 법정 대리인의 권리와 그 행사방법
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.

이용자 혹은 만 14세 미만 아동의 개인정보 조회

- 수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을, 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.

혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.

귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.

"초록마켓"은 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “초록마켓이 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

아. 개인정보의 자동 수집 장치의 설치
- 운영 및 그 거부에 관한 사항

"초록마켓"은 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등 개인정보를 자동으로 수집하는 장치를 설치/운용합니다.

쿠키란 "초록마켓" 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다

"초록마켓"은 다음과 같은 목적을 위해 쿠키 등을 사용합니다.

▶ 쿠키 사용 목적

- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공

귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.

▶ 쿠키 설정 거부 방법

예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.

설정방법 예(인터넷 익스플로어의 경우): 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보

단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

자. 개인정보 관리 책임자
"초록마켓"은 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.

▶ 개인정보관리책임자

성명 : 김병모

전화번호 : 1644-7796

이메일 : nongsooya@yourbiz.co.kr

귀하께서는 “초록마켓" 의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
				</textarea>
				<br/><br/> 
				<input type="checkbox" name="agreement" id="InfoChk" value="동의"  />동의<br/>
				<br/>
			</div>
			<hr>
			<input type="button" value="가입" class="btn btn-success"  style="width: 40%; margin-left: 30%; margin-top: 5%"/>
		</div>
		</div>
		<!-- container  -->
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