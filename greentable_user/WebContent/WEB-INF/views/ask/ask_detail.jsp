<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 마이페이지 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" type="text/css" href="common/css/user-header.css">
<link rel="stylesheet" type="text/css" href="common/css/user-left-menu.css">


<style>

<!--내가 추가  -->
#container{width:100%; min-height:700px; }
#left{width:25%; min-height:600px; float:left;  /* background-color: #fffed3; */}
/*width가 전체 넓이가 아니더라도 div는 기본 width 100%의 영역을 가진다
float:left를 설정하여 기본 width100프로의 영역에서 width를 설정한 것 까지만 사용  */
#right{width:70%; min-height:500px;float:right;  /*  background-color: #b4c3cc ; */}
#footer{clear:both; width: 100%;
	padding: 20px;
	position: relative;
	text-align: center;
	height: 100px;
	background-color: #F6F6F6;
	margin-top: 150px}
#askTable{margin-top: 15px}
#btnWrap{ text-align:right; width:100%}
#detailTable{text-align: center; margin-bottom:30px; }
#date,#type,#status{width:15%;background-color:#F6F6F6;}
#type_data,#status_data{width:16%; text-align: left; font-weight: normal }
#date_data{width:20%; text-align: left; font-weight: normal;}
#detailAskContentTable{margin-bottom: 150px}

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
	
	/*내가 추가  */
	$("#delBtn").click(function(){
	if(confirm("문의내역을 삭제하시겠습니까")){
		
	  $("#frm").submit();
	}///end if

	
});//click
	
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
	<form id="frm" action="ask_delete.do">
	
	<input type="hidden" name="id" value="${sessionScope.user_id }"/>
	<input type="hidden" name="ask_subject" value="${ask_detail.ask_subject}"/>
	<input type="hidden" name="ask_date" value="${ask_detail.ask_date}"/>
	
	
	<div id="left">			
	<c:import url="/common/jsp/user-left-menu.jsp" />   
	</div>
	
	<div id="right">
	
	<h4>나의 질문과 답변</h4>
	<table class="table table-borderless" style=" border:1px solid #dfdfdf ; margin-bottom: 50px">
	<tr><th>- 환불/배송/매진된 상품의 입고문의/기타 고객님의 이용에 관한 의견사항은 1:1상담을 이용하세요.</th></tr>
	<tr><th>- 기타 궁금한 상황이 있을 시에는 고객센터에 문의하세요.</th></tr>
	</table>
	

	<h4>최근 문의 내역</h4>
	<table id="detailTable"  class="table table-bordered"  style=" border:1px solid #dfdfdf ">
	<tr>
	<th id="date">작성일</th>
	<th id="date_data">
<%-- 	<fmt:formatDate value="${ask_detail.ask_date}" pattern="yyyy-mm-dd" /> --%>
	<c:out value="${ask_detail.ask_date}"/> 
</th>
	<th id="type">문의유형</th>
	<th id="type_data"><c:out value="${ask_detail.ask_category}"/></th>
	<th id="status">상태</th>
	<th id="status_data"><c:out value="${ask_detail.ask_status}"/></th>
	
	</tr>
	
	</table>

<div id="btnWrap">

<input type="hidden" name="ask_num" value="${param.ask_num }"/>
	<button  id="delBtn" type="button" class="btn btn-outline-success">문의 내역 삭제</button>
</div>

<table class="table" id="detailAskContentTable" >
  <thead>
    <tr>
      <th scope="col" colspan="2" style="text-align: left; border-top: 0px; font-weight: bold;" ><h5>문의내용</h5></th>
    </tr>	
    </thead>
    <tbody>
	<tr>
	<th>제목</th>
	<th><c:out value="${ask_detail.ask_subject}"/></th>
	</tr>
	<tr>
	<td>내용</td>
	<td><c:out value="${ask_detail.ask_content}"/></td></tr>
	<tr>
	</tbody>
	<tr>
	<td>답변</td>
	<td><c:out value="${ask_detail.ask_answer}"/> </td>
	</tr>
	<tr><tfoot><td colspan="2"></td></tfoot></tr>
	
	</table>	
	</div>
</form>
		</div>
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