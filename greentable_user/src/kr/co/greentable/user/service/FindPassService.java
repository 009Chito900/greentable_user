package kr.co.greentable.user.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;

import kr.co.greentable.user.dao.FindPassDAO;
import kr.co.greentable.user.vo.FindPassVO;
import kr.co.greentable.user.vo.UpdatePassVO;

public class FindPassService {

	/**
	 * 임시 비밀번호 보여주는 일
	 * @param response
	 * @param fpVO
	 * @return
	 * @throws IOException
	 */
	public boolean selectMemberPass(HttpServletResponse response, FindPassVO fpVO) throws IOException {

		boolean returnFlag = false;

		FindPassDAO fpDAO = FindPassDAO.getInstance();

		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String pass = fpDAO.selectMemberPass(fpVO);

		returnFlag = pass == null;
		
		if (returnFlag) {
			out.println(returnFlag);
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			//변경된비번을 받는다 
			String createPass = createKey(6);

			//비밀번호로 업데이트를 수행

			//메일로 비밀번호를 보내준다. 
			try {
				sendMail( fpVO.getEmail() , "비밀번호를 잊으셨나요? 임시비밀번호가 새로 발급 되었습니다.", "새로 발급된 비밀번호는<strong> " + createPass + "</strong>" + "입니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
		}//end else
		return returnFlag;

	}//findPass

	
	/**
	 * 메일을 보내는 일
	 * @param email
	 * @param subject
	 * @param msg
	 * @throws Exception
	 */
	public void sendMail(String email, String subject, String msg) throws Exception {
		
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 	//SMTP 서버명
		String hostSMTPid = "parkjin105";		//네이버 아이디
		String hostSMTPpwd = "wlsgml7548!"; 	//네이버 비밀번호

		//보내는 사람
		String fromEmail = "parkjin105@naver.com";
		String fromName = "박진희";

		//email 전송
		try{
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); //SSL 

			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);

			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch

	}//sendMail


	/**
	 * 임시비밀번호 난수 생성하는 일
	 * @param length
	 * @return
	 */
	public static String createKey(int length) {
		
		int index = 0;

		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}//end for

		return sb.toString();
	}//createKey


	/**
	 * 비밀번호 업데이트
	 * @param upVO
	 * @return
	 */
	public boolean modifyPass(UpdatePassVO upVO) {
		
		boolean flag = false;

		FindPassDAO fpDAO = FindPassDAO.getInstance();
		flag = fpDAO.updateMemberPass(upVO) == 1; //한 행이 변경되면 false 아니면 true?
          
		return flag;
	}//modifyPass

}//class
