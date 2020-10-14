<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 고객센터 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 고객센터</title>

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
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-left-menu2.css">

<style>

<!--내가 추가  -->
#container{width:100%; min-height:700px; }
#left{/* width:25%; min-height:600px;  */ float:left;  /* background-color: #fffed3; */}
#right1{width:70%; min-height:100px;float:right; /* background-color: #fffed3  */;}
#right2{width:70%; min-height:100px;float:right; margin-top: 30px;  /*  background-color: #b4c3cc ; */}
#footer{clear:both; width: 100%;
	padding: 20px;
	position: relative;
	text-align: center;
	height: 100px;
	background-color: #F6F6F6;
	margin-top: 100px}

/* 테이블 */	
	table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-bottom: 1px solid #ccc;
                margin : 20px 10px;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 100px;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
        
      #privacyInfo{
      margin-left:30px;
      font-weight: normal;
       height:200px; 
       width:500px;
 		overflow:scroll;
 		overflow-x:hidden
      }


/* 테이블 */	
	
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
	
/*  what i did*/
	$("#cancelBtn").click(function() {
		
		location.href='ask_list.do';
	});//click
	
	$("#insertBtn").click(function() {
		
		chkNull();

	});//click
	
});//ready

function chkNull(){
	alert("chknull 불림");

	 if($("#ask_subject").val() =="" || $("#ask_category").val()=="------선택------" || $("#ask_content").val()==""  ){
	
		alert("공란 없이 작성해주세요");
		return;
	 }
		if(! ($("#agreeChekbox").prop("checked")) ){
			alert("개인 정보 처리 방안에 동의해주세요");
		
			return;
		
	}else{
		
		$("#frm").submit();
	}
}//chkNull

	
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
		
		<div id="container" style="width:100%; min-height:700px; ">
			<form id="frm" action="ask_add_insert.do">
			<div id="left">	
				<c:import url="/common/jsp/user-left-menu2.jsp" />
		</div>
		
			<div id="right1">
				
				 <table  style="margin-left: 50px" >
            
                <tr>
                <td bgcolor=white>
  
                <table class = "table2">
                <tr>
                <td colspan="2" style="font-size: 25px">1:1 문의</td>
                </tr>
                        <tr>
                        <td>제목</td>
                        <td><input type = text  id="ask_subject" name ="ask_subject"  size=20> </td>
                        </tr>
 
                        <tr>
                        <td>분류</td>
                        <td>
                        	<select id="ask_category" name="ask_category">
                        		<option>------선택------</option>
                        		<option>배송</option>
                        		<option>상품</option>
                        		<option>반품</option>
                        		<option>결제문의</option>
                        		<option>기타</option>
                        	</select>
                        </td>
                        </tr>
 
                        <tr >
                        <td style="border-bottom: none">문의내용</td>
                        <td style="border-bottom: none">
                        <textarea id="ask_content" name ="ask_content" cols=85 rows=15></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td colspan="2" style="height:50px"></td>
 						</tr>
 						
                        <tr>
                        <td colspan="2">개인정보처리방침안내</td>
                        </tr>
                        </table>
                        <table> <tr><td>
                  <div id="privacyInfo" style=" font-weight: normal; height:200px; width:62%; overflow:scroll; overflow-x:hidden">

                        				&nbsp;&nbsp;■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를
										다음의 목적을 위해 활용합니다. - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공
										, 구매 및 요금 결제 - 고객 관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용
										방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달 - 마케팅
										및 광고에 활용 : 신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는
										회원의 서비스 이용에 대한 통계<br/> 
										&nbsp;&nbsp;■ 수집하는 개인정보 항목 회사는 정보주체가 고객서비스(상담신청, 상담, 서비스
										신청 등)를 이용하기 위하여 고객의 개인 정보를 제공할 때의 서비스 제공을 위한 필수 정보와, 보다 향상된
										서비스 제공을 위한 선택정보를 온라인상 입력방법을 통하여 수집하고 있습니다. 수집하는 개인정보의 범위는 아래와
										같습니다. 개인정보 수집항목 - 필수항목: 이름, 생년월일, 전화번호 , 이메일, 주소, 여권사본, -
										선택항목: 직업, 학력, 이력, 유학동기, 유학계획, 유학목적 등 입학 지원을 하기 위하여 해당 교육기관에서
										요청하는 개인 정보. - 자동수집 항목 : 접속로그( 접속시간, 접속 아이피,접속 웹브라우져종류,서비스 이용
										기록 ) 개인정보 수집방법 정보주체는 웹사이트 또는 서면 절차를 통하여 개인정보처리방침과 이용약관 각각의 내용을
										확인하고 ‘동의’ 또는 ‘동의하지 않는다’ 문구를 선택 할 수 있습니다. 정보 주체가 ‘동의’ 문구를 선택한
										경우에는 개인정보 수집에 동의한 것으로 봅니다.
										
										&nbsp;&nbsp;■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를
										다음의 목적을 위해 활용합니다. - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공
										, 구매 및 요금 결제 - 고객 관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용
										방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달 - 마케팅
										및 광고에 활용 : 신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는
										회원의 서비스 이용에 대한 통계<br/> &nbsp;&nbsp;■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를
										다음의 목적을 위해 활용합니다. - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공
										, 구매 및 요금 결제 - 고객 관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용
										방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달 - 마케팅
										및 광고에 활용 : 신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는
										회원의 서비스 이용에 대한 통계<br/> &nbsp;&nbsp;■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를
										다음의 목적을 위해 활용합니다. - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공
										, 구매 및 요금 결제 - 고객 관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용
										방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달 - 마케팅
										및 광고에 활용 : 신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는
										회원의 서비스 이용에 대한 통계<br/> 
							</td></tr>
							</table>
                       </div>
                       
                   </td>
 				</tr>
 			
        </table>
        
		
		<div style="text-align: right; margin-left:30px;margin-top: 30px; width:62%">
			<input type="checkbox" id="agreeChekbox" /> 상기 내용에 동의합니다.
			</div>
		<div style="text-align: center; margin-top: 80px; width:70%">
		
                       <button id="insertBtn"  type="button" class="btn btn-outline-success"> 문의하기 </button>
                       <button id="cancelBtn" type="button" class="btn btn-outline-secondary"> 취 소 </button>

		</div>
				
			</div>
		
		
			<div id="right2">
			
			
			</div>
		</form>
		</div>
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
