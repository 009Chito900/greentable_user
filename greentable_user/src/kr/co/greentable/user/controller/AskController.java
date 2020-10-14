package kr.co.greentable.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.greentable.user.domain.AskDetailDomain;
import kr.co.greentable.user.domain.AskDomain;
import kr.co.greentable.user.service.AskService;
import kr.co.greentable.user.vo.AskAddVO;
import kr.co.greentable.user.vo.AskDetailVO;

@SessionAttributes({"user_id"})
@Controller
public class AskController {

	AskService as=new AskService();

	@RequestMapping(value="/ask_list.do")
	public String askList(Model model, HttpSession session ) {
		
	String id=(String)session.getAttribute("user_id");
		//String id="kim";
		List<AskDomain> list=as.searchAskList(id); 
		
		model.addAttribute("ask_list",list);
		
		return "ask/ask_list";
		
	}//askList
	

	@RequestMapping("/ask_detail.do")
	public String askDetail(Model model, String ask_num) {

		AskDetailDomain add=as.searchAskDetail(ask_num);
		model.addAttribute("ask_detail",add);
		
		return "ask/ask_detail";
	}//askDetail
	
	@RequestMapping("/ask_delete.do")
	public String askDelete(Model model, String ask_num ) {

		int cnt=as.removeAsk(ask_num);
		
		model.addAttribute("remove_flag",cnt);
		 model.addAttribute("page_flag","del");
		
		return "forward:ask_list.do";
	}//askDelete
	
	
	@RequestMapping("/ask_add_frm.do")
	public String askAdd() {

		return "ask/ask_add";
	}//askAdd
	
	@RequestMapping("/ask_add_insert.do")
	public String askAddInsert(AskAddVO aaVO,HttpSession session) {
		String id=(String)session.getAttribute("user_id");
		aaVO.setId(id);
		as.addAsk(aaVO);
		return "forward:ask_list.do";
	}//askAdd
	
	
	
	
}//class
