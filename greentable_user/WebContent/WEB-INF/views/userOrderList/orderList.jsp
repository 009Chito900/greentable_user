<%@page import="kr.co.greentable.user.domain.SelectUserOrderListDomain"%>
<%@page import="kr.co.greentable.user.domain.SelectUserOrderNumDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	 info="주문내역리스트"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>

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
	
	 var params = location.search.substr(location.search.indexOf("?") + 1); //파라메터를 받는다 
	 var searchPeriod = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == "searchPeriod") { 
	        	searchPeriod = temp[1]; 
	        }//end if 
	    }//end for
	
	    if(searchPeriod != null || searchPeriod != ""){ //searchPeriod가 null이거나 빈칸이 아니라면 
	    	$("#period").val(searchPeriod);  //그 값으로 select를 고정한다.
	    }else{
	    	$("#period").val("all"); 
	    }//end else
	    
	/* select 메뉴가 바뀌었을 때 */
	$("#period").change(function(){
	    var period =  $(this).val();
	    location.href="orderList.do?searchPeriod="+period;
	});//change

}); //ready
</script>
<style>
#wrapper{position: relative; min-height: 2000px}
#orderListTitileDiv{position: absolute; top: 13%; left: 30%; width: 35%}
#orderListSelectDiv{position: absolute; top: 15%; left: 80%}
#orderListTableDiv{position: absolute; top: 20%; left: 31%; width: 55%}
#page{position: absolute; left: 50%; margin-top: 5%}
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
					<h3>주문내역</h3>
			</div>
			<div id="orderListSelectDiv">
					 <select name="period"  id="period">
						<option value="all"  selected>전체기간</option>
					    <option value="day">하루</option>
					    <option value="aWeek">일주일</option>
					    <option value="aMonth">한 달</option>
					    <option value="threeMonths">세 달</option>
					  </select>
			</div>
			<div id="orderListTableDiv">
			<%
			
				List<SelectUserOrderNumDomain> orderNum=(List<SelectUserOrderNumDomain>)request.getAttribute("order_num");
				List<SelectUserOrderListDomain> orderList=(List<SelectUserOrderListDomain>)request.getAttribute("order_list");
				SelectUserOrderNumDomain suond=null;
				SelectUserOrderListDomain suold=null;
				
			if( orderNum.size() != 0 && orderList.size() !=0   ){
				for( int i=0; i< orderNum.size(); i++){
					
					suond=orderNum.get(i);
			%>
					  <label style="margin-bottom: 0px; margin-top: 5%"><%= suond.getOrder_date()  %></label>
					  <hr style="margin-bottom: 3%; margin-top: 0px">
					  <form action="orderDetail.do" method="post" >
					  <table class="table table-bordered">
					  <%
					 	 suold=orderList.get(i);
					  %>
					  	<tr>
					  		<td colspan="10">
					  		<%= suold.getProduct_name() %>
					  		</td>
					  	</tr>
					  	<tr>
					  		<td rowspan="2" style="width: 100px; height: 150px"><img src="http://localhost/greentable_user/common/images/<%= suold.getPro_img_thumb()  %>" style="width: 100px; height:150px"/></td>
					  		<td style="width: 100px; height: 75px">주문번호</td>
					  		<td colspan="6"><%= suond.getOrder_num() %></td>
					  		<td rowspan="2" style="text-align: center">
					  			<input type="button" class="btn btn-outline-success" value="상세보기" style="margin-top: 10%" 
					  			onclick = "location.href = 'orderDetail.do?order_list_num=<%=suold.getOrder_list_num()%>&order_date=<%=suond.getOrder_date()%>&order_num=<%=suond.getOrder_num().trim()%>'">
					  		</td>
					  	</tr>
					  	<tr>
					  		<td>결제금액</td>
					  		<td colspan="6"><%= suold.getTotal_price()  %>원</td>
					  	</tr>
					  </table>
					  </form>
					  <%
					
				}//end for
			}else{ 
				%>
				<table class="table table-bordered">
				<tr>
					<td>조회된 주문내역이 없습니다.</td>
				</tr>
				</table>
				<%
			}//end else 
					  %>
						<div id="page">
							<span><img src="http://localhost/greentable_user/common/images/left-arrow.png" style="width: 2%; height: 2%"></span>
							<c:forEach begin="1" end="${total_page }" step="1" var="num">
								<a href="/greentable_user/orderList.do?searchPeriod=all&paramPage=${num }">${ num }</a>
							</c:forEach>
							<span><img src="http://localhost/greentable_user/common/images/right-arrow.png" style="width: 2%; height: 2%"></span>
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