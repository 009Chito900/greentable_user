<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 마이페이지 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>

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


<style>

<!--내가 추가  -->
#container{width:100%; min-height:700px; }
#left{width:25%; min-height:600px; float:left;  /* background-color: #fffed3; */}
/*width가 전체 넓이가 아니더라도 div는 기본 width 100%의 영역을 가진다
float:left를 설정하여 기본 width100프로의 영역에서 width를 설정한 것 까지만 사용  */
#right1{width:70%; min-height:100px;float:right;  /* background-color: #fffed3  */;}
#right2{width:70%; min-height:500px;float:right; margin-top: 30px;  /*  background-color: #b4c3cc ; */}
#footer{clear:both; width: 100%;
	padding: 20px;
	position: relative;
	text-align: center;
	height: 100px;
	background-color: #F6F6F6;
	margin-top: 100px}
thead{text-align: center; background-color:#dfdfdf; }
#askTable{margin-top: 15px; margin-bottom:150px; font-weight:normal; }
#btnWrap{ text-align:right; width:100%}
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
	
/*내가 한거  */

	$("#questionBtn").click(function(){
	$("#frm").submit();
	
	});

  <c:if test="${page_flag eq 'del'}">
  
	<c:if test="${remove_flag eq 0}">
	alert("문의내역을 삭제하지 못했습니다.");
	</c:if>
	
	<c:if test="${remove_flag eq 1}">
	alert("문의내역을 삭제했습니다.");
	location.replace=("ask_list.do");
	</c:if>
	
</c:if>
	
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
	<form id="frm" action="ask_add_frm.do">

	<div id="left">			
	<c:import url="/common/jsp/user-left-menu.jsp" />   
	</div>
	
	<div id="right1">	
	
	<h4>나의 질문과 답변</h4>
	<table class="table table-borderless" style=" border:1px solid #dfdfdf ">
	<tr><th>- 환불/배송/매진된 상품의 입고문의/기타 고객님의 이용에 관한 의견사항은 1:1상담을 이용하세요.</th></tr>
	<tr><th>- 기타 궁금한 상황이 있을 시에는 고객센터에 문의하세요.</th></tr>
	</table>
	

	</div>
	
	<div id="right2">
	<h4 style="text:bold">최근 문의 내역</h4>
	<div id="btnWrap" >

	<button id="questionBtn" type="button" class="btn btn-success"> 1:1 문의 </button>
	</div>
	
	
		<table class="table table-bordered" id="askTable">
		 <c:if test="${empty ask_list}">
	  	<tr>
  		<td colspan="4">문의 내역이 존재하지 않습니다.</td>
  		</tr>
  		</c:if>
  
  		<thead>
    		<tr>
      		<th scope="col">분류</th>
      		<th scope="col">제목</th>
      		<th scope="col">작성일</th>
      		<th scope="col">답변여부</th>
    		</tr>
  		</thead>
 		<c:forEach var="al"  items="${ask_list }">

 		<tr>
 		<td><c:out value="${al.ask_category}"/></td>
 		<td id="subject"><a href="ask_detail.do?ask_num=${al.ask_num}"><c:out value="${al.ask_subject}"/></a></td>
 		<td><c:out value="${al.ask_date}"/></td>
 		<td><c:out value="${al.ask_answer}"/></td>
 		
 		</tr>
		</c:forEach>
	</table>	

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