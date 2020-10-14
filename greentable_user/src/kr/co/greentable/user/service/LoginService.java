package kr.co.greentable.user.service;

import kr.co.greentable.user.dao.LoginDAO;
import kr.co.greentable.user.vo.LoginVO;

public class LoginService {

	public String searchId(LoginVO lVO) {
		
		String id="";
		if((lVO.getId() !=null) && (lVO.getPassword() !=null) ) {//form Control  id&pass entered
		
			id= LoginDAO.getInstance().selectLogin(lVO);
			}//end if
			if(id==null) {//null error
				id="";
			System.out.println("id----->>"+id);
			}
			return id;
		}//searchId
		
		
			/*
			  String name="";
      if(lVO.getId() !=null){//HTML Form control에서 id와 비번이 입력되었을 때
    	  
    	  //비밀번호는 일방향 해쉬로 암호화
      lVO.setPass(DataEncrypt.messageDigest("MD5",lVO.getPass()));
      	//DAO 사용
      LoginDAO l_DAO=LoginDAO.getInstance();
      name=l_DAO.selectName(lVO);//암호화된 이름 나옴
 
      if(!"".equals(name)){//로그인 성공
      //scope객체에 값을 설정
      session.setAttribute("user_id",lVO.getId());
      
      DataDecrypt dd= new DataDecrypt("0123456789abcdef");
      
      session.setAttribute("user_name",dd.decryption(name));
      }else{
    	  %>
    	  
    	  <script type="text/javascript">
    	  alert("아이디나 비밀번호 확인");
    	  location.href="http://localhost/jsp_prj/index.html";
    	  </script>
    	  <%
      }//end if
      
      
      }//end if
      %>
      
      <div id="loginBox">
      <c:choose>
      <c:when test="${param.id ne '' and user_name ne null }"> <!-- 로그인성공 -->
           <strong><c:out value="${user_name}"/> </strong>님 로그인 하셨습니다.<br/>
      <a href="../calendar/calendar.jsp">일정관리</a>
      
      </c:when>
      <c:otherwise><!-- 로그인실패 -->
      
    
			 */
			
	
	
	
	
}//class
