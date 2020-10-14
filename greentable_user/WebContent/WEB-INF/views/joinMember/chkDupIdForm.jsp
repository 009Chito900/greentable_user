<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디중복확인"
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

<title>아이디중복확인</title>
<style type="text/css">
#idWrap{ width: 470px; height: 200px; margin: 0px auto; position: relative; background-color: #FFFAF0}
#idFrm{ width: 450px; position: absolute; top: 70px; left: 60px; }

</style>
<!-- Google CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#chkDulIdBtn").click(function() {
		if($.trim($("[name='id']").val())==""){
			alert("중복검사에 사용할 아이디는 필수입력 입니다.");
			return;
		}//end if
		//입력된 아이디를 서버로 보내서 ID가 사용 중 인지 확인한 후 사용가능 여부를 보여준다.
		location.href='chkDupId.do?id='+$.trim($("[name='id']").val());

	});//click
	
	$("#useIdBtn").click(function(){
		if($("#chkDulId").val() != null && $("#chkDulId").val() == "사용가능한 아이디입니다."){
			//사용이 눌려지면 자식창의 값을 부모창으로 전달한다.
			opener.window.document.frm.id.value=$.trim($("[name='id']").val());
			//창을 닫는다.
			self.close();
		}//end if
	});//click
	
});//ready

</script>
</head>
<body>
<div id="idWrap">
	<form name="cFrm">
	<div id="idTitle" style="background-color: #4A6D3D; color:white; font-size: 20px; font-weight: bold">
	아이디 중복검사
	</div>
	<div id="idFrm">
		<label>아이디</label>
		<input type="hidden" name="chkDulId" id="chkDulId" value="${ is_dul_id }">
		<input type="text" name="id" class="inputBox" style="width:160px" value="${ param.id }" maxlength="10"/>
		<span id=btnDiv style="margin-top: 15%">
			<input type="button" value="중복검사"  id="chkDulIdBtn" class="btn btn-success"/>
			<input type="button" value="사용" id="useIdBtn" class="btn btn-success" />
		</span>
		<div>${ is_dul_id }</div>
		<input type="text" style="width:200px; display:none"/><br/>
	</div>
	</form>
</div>
</body>
</html>