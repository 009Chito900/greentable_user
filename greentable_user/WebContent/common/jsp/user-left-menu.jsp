<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자 사이드 메뉴"%>
<style>

</style>	
 
<div id="leftMenuDiv">
	<ul id="left-menu">
		<li class="list-group-item" id="myPage"> 마이페이지 </li>

		<li class="list-group-item">
			<a href="http://localhost/greentable_user/orderList.do?searchPeriod=all" id="main"> 나의 쇼핑정보</a><br/> 
			<a href="http://localhost/greentable_user/orderList.do?searchPeriod=all" id="sub"> 주문내역</a>
		</li>

		<li class="list-group-item">
			<a href="http://localhost/greentable_user/ask_list.do" id="main"> 나의 문의글</a><br/> 
			<a href="http://localhost/greentable_user/ask_list.do" id="sub"> 나의 질문과 답변</a>
		</li>
		
		<li class="list-group-item">
			<a href="http://localhost/greentable_user/chkPassInfo.do" id="main"> 개인정보</a><br/>
			<a href="http://localhost/greentable_user/chkPassInfo.do" id="sub"> 회원정보 수정</a><br/>
			<a href="http://localhost/greentable_user/chkPassDropOutForm.do" id="sub"> 회원탈퇴</a>
		</li>
	</ul>
	
</div>
