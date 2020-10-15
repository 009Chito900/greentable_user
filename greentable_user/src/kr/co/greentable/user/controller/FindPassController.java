package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greentable.user.service.FindPassService;
import kr.co.greentable.user.vo.FindPassVO;
import kr.co.greentable.user.vo.UpdatePassVO;

@Controller
public class FindPassController {
	
	/**
	 * 비밀번호 찾기 폼: 비밀번호 찾기 클릭시 비밀번호 찾기 폼으로 이동시킴
	 * @return
	 */
	@RequestMapping(value = "/find_pass_frm.do", method = GET)
	public String findPassForm() {
		return "member/find_pass_frm";
	}//findPassForm


	/**
	 * 아이디 찾기 폼: 아이디 찾기 클릭시 아이디 찾기 폼으로 이동시킴
	 * @return
	 */
	@RequestMapping(value = "/find_id_frm.do", method = GET)
	public String findIdForm() {
		return "member/find_id_frm";
	}//findIdForm	

	
	/**
	 * 로그인 하기 버튼 클릭 시 로그인 페이지 이동 
	 * @return
	 */
	@RequestMapping(value = "/user_login.do", method = GET)
	public String loginForm() {
		return "member/user_login";
	}//loginForm	
	
	
	/**
	 * 비밀번호 찾기 
	 * @param fpVO
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/find_pass_process.do", method = POST)
	public String findPassProcess(HttpServletResponse response, FindPassVO fpVO, Model model) throws IOException {
		
		FindPassService fps = new FindPassService();
		model.addAttribute("pass", fps.selectMemberPass(response, fpVO));
		
		return "member/find_pass_process";
	}//findPassProcess
	
	
	/**
	 * 비밀번호 변경. 그럼 실행 을 다시 해주세요
	 * @param upVO
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/modify_pass.do", method = POST)
	public String ModifyPass(UpdatePassVO upVO, HttpSession session, Model model) {
		
		//Controller 비밀번호가 조회되면 (null아 어님) 이메일은 저장되어져있고, 
		//비밀번호를 새로 생성하여 DB table을 업데이트하고, 변경된 비밀번호를 
		//받아서 메일로 변경된 비밀번호를 보낸다.
		FindPassService fps = new FindPassService();
		boolean flag = fps.modifyPass(upVO);
		//false가 나올게 아닌데요. 이상하네
		model.addAttribute("updFlag", flag);
		model.addAttribute("move_page", "upd");
		
		return "forward:find_pass_success.do"; 
		
	}//ModifyPass
	
}//class
