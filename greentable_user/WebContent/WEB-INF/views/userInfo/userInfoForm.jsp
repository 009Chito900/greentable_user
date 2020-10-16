<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 마이페이지 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
<!-- 회원가입 유효성 검사 -->
<script type="text/javascript">

$(function(){
	
	
	$("#emailDup").click(function() {
		var top=window.screenY+200;
		var left=window.screenX+100;
		window.open("modiChkDupEmailForm.do","id","width=550,height=230,top="+top+",left="+left);
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
	
	$("[value='정보수정']").click(function() {
		
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
		
		
		$("#frm").submit();//전송
		
	});//click
	
	$("[value='취소']").click(function() {
		//취소버튼을 눌렀을 때 이전 페이지로 이동
		if(confirm('정보수정을 취소하시겠습니까?')){
			location.href='/greentable_user/chkPassInfo.do';
		}//end if 
	});//click
	
	
});//ready

</script>
<style>
#wrapper{ position: relative; min-height: 1200px}
#titleDiv{position: absolute; top: 21%; left: 30%}
#memberDiv{ position: absolute; top: 28%; left: 33%; width: 45% ;padding:2%;background-color: #FAFAFA}
#footer{ position: absolute; top: 100%}
</style>
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
				<c:import url="/common/jsp/user-left-menu.jsp" />
		<div id="titleDiv">	
			<h3>회원정보 수정</h3>
		</div>
		<div id="memberDiv"> 
		<h6 style="text-align: left">*는 필수입력</h6>
		<form action="modifyUserInfo.do" method="post" name="frm" id="frm">
		<table id="joinTable" class="table table-borderless" >
			<tr>
				<th><span class="point">*</span>아이디</th>
				<td>
					<input type="hidden" name="id" id="id" value="${ sessionScope.user_id }"/>
					<label>${ sessionScope.user_id }</label>
				</td>
			</tr>
			<tr>
				<th><span class="point">*</span>비밀번호</th>
				<td><input type="password" style="width:300px; height: 40px" class="inputBox" name="password" id="password" maxlength="30"/></td>
			</tr>
			<tr>
				<th><span class="point">*</span>비밀번호확인</th>
				<td><input type="password" style="width:300px; height: 40px" class="inputBox" name="password2" id="password2" maxlength="30"/></td>
			</tr>
			<tr>
				<th><span class="point">*</span>이름</th>
				<td><input type="text" style="width:300px; height: 40px" class="inputBox" name="name" id="name" value="${ user_info.name }" maxlength="10"/></td>
			</tr>
			<tr>
				<th><span class="point">*</span>이메일</th>
				<td>
					<input type="text" style="width:300px;height: 40px" class="inputBox" name="email" id="email" value="${ user_info.email }" readonly="readonly" maxlength="50"/>
					&nbsp;
					<input type="button" value="중복확인" name="btn" class="btnDesign" id="emailDup" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>
					<input type="text" style="width:300px; height: 40px" class="inputBox" name="phone" id="phone" value="${ user_info.phone }" maxlength="13"/>
				</td>
			</tr>
			<tr>
				<th><span class="point">*</span>우편번호</th>
				<td>
					<input type="text" style="width:80px; height: 40px" class="inputBox" readonly="readonly" name="zipcode" id="zipcode" value="${ user_info.zipcode }" maxlength="6"/>
					<input type="button" value="검색" class="btn"/>
				</td>
			</tr>
			<tr>
				<th><span class="point">*</span>주소</th><td>
				<input type="text" style="width:300px ; height: 40px" class="inputBox" readonly="readonly" name="addr1" id="addr1" value="${ user_info.addr1 }" maxlength="100"/></td>
			</tr>
			<tr>
				<th><span class="point">*</span>상세주소</th>
				<td><input type="text" style="width:300px ; height: 40px" class="inputBox" name="addr2" id="addr2" value="${ user_info.addr2 }" maxlength="100"/></td>
			</tr>
		</table>
		</form>
		</div>
				<input type="button" value="정보수정" class="btnDesign"  style="position: absolute; top:90%; left: 48%"/>
				<input type="button" value="취소" class="btnDesign" style="position: absolute; top:90%; left: 55%"/>
		</div>
		</div>
		<!-- header -->
		<div id="container">
		
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