<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자 헤더 메뉴"%>
	
<div id="headerTop">
    <a href="user_cartList.jsp">장바구니</a>
    <i class='fas fa-shopping-cart' id="cartIcon"></i>
    <a href="service_center.jsp">고객센터</a>
    <a href="myPage.jsp">마이페이지</a>
    <a href="joinMember.jsp">회원가입</a>
    <a href="user_login.jsp">로그인</a>
</div>

<div id="logo">
	<a href="user_main.jsp"><img src="/common/images/logo3.png"/></a>
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
                <a href="user_menu1.jsp">과수원</a>
                <a href="user_menu2.jsp">쌀 잡곡</a>
                <a href="user_menu3.jsp">바다와 강</a>
                <a href="user_menu4.jsp">회사소개</a>
            </div>
        </div>
    </div>
</div> <!-- navbar -->

<div id="drop_content" class="dropdown_content hidden"> <!-- hidden: 처음에 메뉴 숨김 -->
    <div class="row">
        <div class="nav_column">
            <h3>과수원</h3>
            <a href="#">시즌한정과일</a>
            <a href="#">국산과일</a>
            <a href="#">수입과일</a>
            <a href="#">냉동 · 건과일</a>
        </div>
        
        <div class="nav_column">
            <h3>쌀 잡곡</h3>
            <a href="#">쌀 · 찹쌀 · 현미</a>
            <a href="#">잡곡</a>
            <a href="#">견과</a>
        </div>
        
        <div class="nav_column">
            <h3>바다와 강</h3>
            <a href="#">생선류</a>
            <a href="#">오징어 · 낙지 · 문어</a>
            <a href="#">해산물 · 조개류</a>
            <a href="#">김 · 미역 · 해조류</a>
        </div>
    </div>
</div>