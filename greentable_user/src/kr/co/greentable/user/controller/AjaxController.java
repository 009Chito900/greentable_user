package kr.co.greentable.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.greentable.admin.service.AjaxService;

@Controller
public class AjaxController {

	@GetMapping("/select_subCtg.do")//장바구니로넘김
	public String selectProductCtg(String mainCtg, Model model) {
		//JSONObect �ޱ�
		AjaxService as= new AjaxService();
		String json=as.productJson(mainCtg); 
		model.addAttribute("json",json);
		
		return "ajax/output_json";
	}
	
}
