<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	info="사용자 메인 페이지"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인</title>

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
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-main.css">

<style>
/*what i did  */
/*  a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;} */
.col-md-3{text-align: center}
#productName{
text-align: center;
margin-top: 20px;
}
#productPrice{
text-align: right;
margin-top: 20px;
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

	function unsetHidden(){
	    $('#drop_content').addClass('hidden');
	}

	/* scorllbar side menu chatbot */
	var $win = $(window);
    var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
    
     /*사용자 설정 값 시작*/
    var speed          = 'fast';     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('.float_sidebar'); // 레이어 셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'relative').css('z-index', '1');
    /*사용자 설정 값 끝*/
    
     // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);
     //스크롤이벤트가 발생하면
    $(window).scroll(function(){
        yPosition = $win.scrollTop() - 1100; //이부분을 조정해서 화면에 보이도록 맞추세요
        if (yPosition < 0)
    {
            yPosition = 0;
    }
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
});//ready
</script>

<script>
$(document).ready(function() {
    $(window).scroll(function() {
        $(this).scrollTop() > 1000 ? $(".float_sidebar").fadeIn() : $(".float_sidebar").fadeOut()
    })
});
</script>

</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="naviBar">
				<c:import url="/common/jsp/user-header.jsp" />
			</div>
			
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
					 
						<!-- 메인이미지 -->
						<img src="http://localhost/design_prj/common/images/main.png" width="100%" height="970px"/>
					</div>
					<div class="carousel-item">
						<img src="http://localhost/design_prj/common/images/main2.png" width="100%" height="970px"/>
					</div>
				</div>

				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"> </span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
				</a>
			</div>
			<!-- carousel slide -->
		</div>
		<!-- header -->

		<div class="float_sidebar">
			<a href="service_center.jsp">
			<img src="http://localhost/design_prj/common/images/chatbot.gif" align="right" style="margin-top: 50px; margin-right: 20px"/></a>
		</div>
		
		<div id="container">
		
			<!-- 최신상품 -->
			<h2 style="font-weight: bold; margin-top: 80px">최신상품</h2>
			<hr>
			<div class="row blog">
                <div class="col-md-12">
                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">

                        <ol class="carousel-indicators">
                            <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#blogCarousel" data-slide-to="1"></li>
                        </ol>

                        <!-- Carousel items -->
                        <div class="carousel-inner">

                            <div class="carousel-item active">
                                <div class="row">
 <!-- 최신상품 이미지 -->                      
 								<c:forEach begin="0" end="3" step="1" var="mpl" items="${pro_list}">              
                                    <div class="col-md-3">
   									        <a href="product_detail.do?product_num= ${mpl.product_num}">
                                            <img src="upload/${mpl.pro_img_thumb}" alt="Image" style="width:300px; height: 300px">
                                        </a>
                                    </div>
                                  </c:forEach>
                              
                                </div>
                                <!--.row-->
                            </div>
                            <!--.item-->
                            <div class="carousel-item">
                                <div class="row">
                                <c:forEach begin="4" end="7" step="1" var="mpl" items="${pro_list}">              
                                    <div class="col-md-3">
   									        <a href="#">
                                            <img src="upload/${mpl.pro_img_thumb}" alt="Image" style="width:300px; height: 300px">
                                        </a>
                                    </div>
                                  </c:forEach>
                                   
                                </div>
                                <!--.row-->
                            </div>
                            <!--.carousel-item-->
                        </div>
                        <!--.carousel-inner-->
                    </div>
                    <!--.Carousel-->
                </div>
            </div>
			
		</div>
		<!-- container -->
		
		<!-- jumbotron -->
		<div class="jumbotron">
			<h1>SAY YES TO THE BEST</h1>
			<p> 초록식탁의 라벨은 품질에 대한 약속이며<br/> 초록식탁은 최고의 품질을 위해 오늘도 최선을 다합니다 </p> 
			<button type="button" id="infoBtn" class="btn btn-outline-success"  onclick = "location.href='user_menu4.jsp'"> View</button> 
		</div> 
		
		<!-- footer-menu -->
		<div id="footerMenuDiv">
			<a href="main_ctg.do?flag=fruits"><img src="http://localhost/design_prj/common/images/menu1.png" class="menu_img" height="400px"/></a>
			<div id="footerMenuTxt1"> 과수원</div>
			<a href="main_ctg.do?flag=grains"><img src="http://localhost/design_prj/common/images/menu2.png" class="menu_img" height="400px"/></a>
			<div id="footerMenuTxt2"> 쌀 잡곡</div>
			<a href="main_ctg.do?flag=fish"><img src="http://localhost/design_prj/common/images/menu3.png" class="menu_img" height="400px"/></a>
			<div id="footerMenuTxt3"> 바다와 강</div>
		</div> 
		
		
		<div id="footer">
			<p> 
				With supporting text below as a natural lead-in to additional
				content.<br /> &copy; CopyRight. All Right Reserved. Class A
			</p>
		</div>

	</div>
</body>
</html>