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
	 * �ӽ� ��й�ȣ �����ִ� ��
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
			out.println("alert('���Ե� ���̵� �����ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			//����Ⱥ���� �޴´� 
			String createPass = createKey(6);

			//��й�ȣ�� ������Ʈ�� ����

			//���Ϸ� ��й�ȣ�� �����ش�. 
			try {
				sendMail( fpVO.getEmail() , "��й�ȣ�� �����̳���? �ӽú�й�ȣ�� ���� �߱� �Ǿ����ϴ�.", "���� �߱޵� ��й�ȣ��<strong> " + createPass + "</strong>" + "�Դϴ�.");
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
		}//end else
		return returnFlag;

	}//findPass

	
	/**
	 * ������ ������ ��
	 * @param email
	 * @param subject
	 * @param msg
	 * @throws Exception
	 */
	public void sendMail(String email, String subject, String msg) throws Exception {
		
		//Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 	//SMTP ������
		String hostSMTPid = "parkjin105";		//���̹� ���̵�
		String hostSMTPpwd = "wlsgml7548!"; 	//���̹� ��й�ȣ

		//������ ���
		String fromEmail = "parkjin105@naver.com";
		String fromName = "������";

		//email ����
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
	 * �ӽú�й�ȣ ���� �����ϴ� ��
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
	 * ��й�ȣ ������Ʈ
	 * @param upVO
	 * @return
	 */
	public boolean modifyPass(UpdatePassVO upVO) {
		
		boolean flag = false;

		FindPassDAO fpDAO = FindPassDAO.getInstance();
		flag = fpDAO.updateMemberPass(upVO) == 1; //�� ���� ����Ǹ� false �ƴϸ� true?
          
		return flag;
	}//modifyPass

}//class
