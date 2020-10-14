
package kr.co.greentable.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.greentable.user.service.LoginService;
import kr.co.greentable.user.vo.LoginVO;

@SessionAttributes({"user_id"})
@Controller
public class LoginController {

	@RequestMapping(value="/login_frm.do")
	public String loginForm() {
		
		return "login/login_frm";
	}//loginForm
	
	@RequestMapping(value="/login_process.do", method=RequestMethod.POST)
	public String loginProcess(LoginVO lVO, Model model) {
		
		LoginService ls=new LoginService();
		String id=ls.searchId(lVO);
		
		model.addAttribute("user_id",id);
		
		return "login/login_process";
	}//loginForm
	
}//class
