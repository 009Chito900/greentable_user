<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Google CDN -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {


		if($("#user_id").val() == "" ){
		
			alert("아이디와 비밀번호를 확인해 주세요");
			location.href='login_frm.do';
		
		}else{
			location.href='main.do';
		}
	

});//ready	
</script>
</head>
<body>
<input type="hidden" id="user_id"  value="${sessionScope.user_id }" />
		
</body>
</html>