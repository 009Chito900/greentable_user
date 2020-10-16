package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyInfoController {

	@RequestMapping(value="/companyInfo.do", method = GET)
	public String companyInfo() {
		
		return "companyInfo/companyInfo";
	}//companyInfo

}//class
