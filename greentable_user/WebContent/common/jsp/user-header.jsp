<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자 헤더 메뉴"%>
<%
request.setCharacterEncoding("UTF-8");

String user_id="";

user_id = (String) session.getAttribute("user_id");

%>	

<div id="headerTop">
    <a href='<%= user_id != null ? "http://localhost/greentable_user/cart_list.do" : "http://localhost/greentable_user/login_frm.do" %>'>장바구니</a>
    <i class='fas fa-shopping-cart' id="cartIcon"></i>
    <a href='<%= user_id != null ? "http://localhost/greentable_user/ask_list.do" : "http://localhost/greentable_user/login_frm.do" %>'>고객센터</a>
    <a href='<%= user_id != null ? "http://localhost/greentable_user/orderList.do?searchPeriod=all" : "http://localhost/greentable_user/login_frm.do" %>'>마이페이지</a>
    <a href="http://localhost/greentable_user/joinMemberForm.do">회원가입</a>
    <a href='<%= user_id != null ? "http://localhost/greentable_user/logOut.do" : "http://localhost/greentable_user/login_frm.do" %>'><%= user_id != null ? "로그아웃" : "로그인" %></a>
</div>

<div id="logo">
	<a href="http://localhost/greentable_user/main.do"><img src="common/images/logo3.png"/></a>
</div>

<div id="search-box">
    <div class="container-1">
        <span class="icon"><i class="fa fa-search"></i></span>
        <input type="search" id="search" placeholder="Search..." />
    </div>
</div> 

<div class="header_navbar">
    <div class="dropdown">
        <div class="dropmenu_wrap">
            <button class="dropbtn" style="margin-left: 280px;">
               	 전체보기 <i class="fa fa-caret-down"></i>
            </button>
            
            <div class="menu">
                <a href="http://localhost/greentable_user/main_ctg.do?flag=fruits">과수원</a>
                <a href="http://localhost/greentable_user/main_ctg.do?flag=grains">쌀 잡곡</a>
                <a href="http://localhost/greentable_user/main_ctg.do?flag=fish">바다와 강</a>
                <a href="http://localhost/greentable_user/companyInfo.do">회사소개</a>
            </div>
        </div>
    </div>
</div> <!-- navbar -->

<div id="drop_content" class="dropdown_content hidden"> <!-- hidden: 처음에 메뉴 숨김 -->
    <div class="row">
        <div class="nav_column">
            <h3>과수원</h3>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fruits&sub_flag=FrImported">수입과일</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fruits&sub_flag=FrDomestic">국산과일</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fruits&sub_flag=FrFrozen">냉동과일</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fruits&sub_flag=FrSeason">시즌한정과일</a>
        </div>
        
        <div class="nav_column">
            <h3>쌀 잡곡</h3>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=grains&sub_flag=GrRice">쌀 · 찹쌀 · 현미</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=grains&sub_flag=GrMultiGr">잡곡</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=grains&sub_flag=GrBeans">백태흑태녹두</a>
        </div>
        
        <div class="nav_column">
            <h3>바다와 강</h3>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fish&sub_flag=FshShell">해산물 · 조개류</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fish&sub_flag=FshOcto">오징어 · 낙지 · 문어</a>
            <a href="http://localhost/greentable_user/main_ctg.do?flag=fish&sub_flag=FshSeaweed">김 · 미역 · 해조류</a>
        </div>
    </div>
</div>