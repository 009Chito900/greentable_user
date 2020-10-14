<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이메일중복확인"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="http://localhost/servlet_prj/common/css/main.css"> -->

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost/design_prj/common/css/user-header.css">

<title>이메일중복확인</title>
<style type="text/css">
#idWrap{ width: 470px; height: 200px; margin: 0px auto; position: relative; background-color: #FFFAF0}
#idFrm{ width: 300px; position: absolute; top: 70px; left: 60px; }
</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	
	
	$("#chkDulEmailBtn").click(function() {
		
		if($.trim($("#email").val()) == ""){
			alert("중복검사에 사용할 이메일은 필수입력 입니다.");
			return;
		}//end if
		
		/* 이메일의 형식이 올바른지 확인  */	
	     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	     if(!reg_email.test($.trim($("#email").val()))) {                            
         	alert("올바른 이메일이 아닙니다. 다시 확인해주세요.");      
         	$('input[name=email]').focus();
			return;
		 }//end if  
		
		//입력된 아이디를 서버로 보내서 ID가 사용 중 인지 확인한 후 사용가능 여부를 보여준다.
		location.href='chkDupEmail.do?email='+$.trim($("#email").val());

	});//click
	
	$("#useEmailBtn").click(function(){
		if($("#chkDulEmail").val() != null && $("#chkDulEmail").val() == "사용가능한 이메일입니다."){
			//사용이 눌려지면 자식창의 값을 부모창으로 전달한다.
			opener.window.document.frm.email.value=$("#email").val();
			//창을 닫는다.
			self.close();
		}//end if
	});//click
	
});//ready

</script>
<style type="text/css">
#idWrap{ width: 470px; height: 200px; margin: 0px auto; position: relative; }
#idFrm{ width: 450px; position: absolute; top: 70px; left: 60px; }

</style>
</head>
<body>
<div id="idWrap">
	<form name="cFrm">
	<div id="emailTitle" style="background-color: #4A6D3D; color:white; font-size: 20px; font-weight: bold">
	이메일 중복검사
	</div>
	<div id="idFrm">
		<label>이메일</label>
		<input type="hidden" name="chkDulEmail" id="chkDulEmail" value="${ is_dul_email }">
		<input type="text" style="width:160px" class="inputBox" name="email" id="email" value="${ param.email }" maxlength="50"/>
		<span id=btnDiv style="margin-top: 15%">
			<input type="button" value="중복검사"  id="chkDulEmailBtn" class="btn btn-success"/>
			<input type="button" value="사용" id="useEmailBtn" class="btn btn-success"/>
		</span>
		<div>${ is_dul_email }</div>
		<input type="text" style="width:200px; display : none"/><br/>
	</div>
	</form>
</div>
</body>
</html>