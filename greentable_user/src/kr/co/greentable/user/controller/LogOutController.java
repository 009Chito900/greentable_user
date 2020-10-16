package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/logOut.do", method = GET)
	public String joinMemberForm( HttpSession session ) {
		
		session.removeAttribute("user_id");
		
		return "logOut/successLogOut";
	}//joinMemberForm
	
	
	
}//class
