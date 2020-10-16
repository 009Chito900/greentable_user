package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greentable.user.service.JoinMemberService;
import kr.co.greentable.user.vo.JoinMemberVO;
import kr.co.sist.util.cipher.DataEncrypt;


@Controller
public class JoinMemberController {
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/joinMemberForm.do", method = GET)
	public String joinMemberForm( ) {
		
		return "joinMember/joinMemberForm";
	}//joinMemberForm
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/chkDupIdForm.do", method = GET)
	public String chkDupIdForm( ) {
		
		return "joinMember/chkDupIdForm";
	}//chkDupIdForm
	
	/**
	 * 
	 * @param id 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/chkDupId.do", method = GET)
	public String chkDuplicateId(String id, Model model ) {
		
		String isDulId="";
		JoinMemberService jms=new JoinMemberService();
		isDulId=jms.searchId(id);
		
		//idDulId
		if(isDulId == null ) {
			isDulId="사용가능한 아이디입니다.";
		}else {
			isDulId="중복되는 아이디입니다. 타 아이디로 시도해주세요.";
		}//end else
		
		//model
		model.addAttribute("is_dul_id", isDulId);
		
		return "joinMember/chkDupIdForm";
	}//chkDuplicateId
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/chkDupEmailForm.do", method = GET)
	public String chkDupEmailForm(String email ) {
		
		
		return "joinMember/chkDupEmailForm";
	}//chkDupIdForm
	
	
	/**
	 * 
	 * @param email 
	 * @param model 
	 * @return
	 */
	@RequestMapping(value="/chkDupEmail.do", method = GET)
	public String chkDuplicateEmail(String email, Model model ) {
		int emailCnt=0;
		String isDulEmail="";
		JoinMemberService jms=new JoinMemberService();
		emailCnt=jms.searchEmail(email);
		
		//idDulEmail
		if(  emailCnt == 0) {
			isDulEmail="사용가능한 이메일입니다.";
		}else {
			isDulEmail="중복되는 이메일입니다. 타 이메일을 사용해주세요.";
		}//end else
		
		//model
		model.addAttribute("is_dul_email", isDulEmail);
		
		return "joinMember/chkDupEmailForm";
	}//chkDuplicateEmail
	
	/**
	 *
	 * @param jmVO 
	 * @param ip
	 * @return
	 */
	@RequestMapping(value="/addJoinMember.do", method = {GET, POST})
	public String addJoinMember(JoinMemberVO jmVO, HttpServletRequest request) {
		//cnt
		//ip
		jmVO.setIp(request.getRemoteAddr());
		
		
		try {
			jmVO.setPassword( DataEncrypt.messageDigest("MD5", jmVO.getPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}//end catch
		
		
		JoinMemberService jms=new JoinMemberService();
		jms.addJoinMember(jmVO);
		
		return "joinMember/successJoin";
	}//addJoinMember
	
}//class
