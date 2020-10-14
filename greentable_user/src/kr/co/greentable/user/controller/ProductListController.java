package kr.co.greentable.user.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greentable.user.domain.ProductListDomain;
import kr.co.greentable.user.domain.SubCtgDomain;
import kr.co.greentable.user.service.ProductListService;
import kr.co.greentable.user.vo.CtgVO;

@Controller
public class ProductListController {
	
	ProductListService pls=new ProductListService();
	
	@RequestMapping("/main.do")
	public String mainPL(Model model) {
	
		model.addAttribute("pro_list",pls.searchMain());
		
		return "product_list/main";
	}
	
	@RequestMapping("/main_ctg.do")
	public String mainCtgPL(Model model, CtgVO cVO) {
		
		List<SubCtgDomain>subCtgList=pls.searchSubCtg(cVO.getFlag());
	
		 List<ProductListDomain> list=pls.searchMainCtgPL(cVO);
		 
//		 if(!"".equals(sub_flag)) {
//		 List<ProductListDomain> sub_ctg_PL_list=pls.searchSubCtgPL(sub_flag);
//			
//			model.addAttribute("s_ctg_pl_list",sub_ctg_PL_list);
//		 }//enb fi
		 
		 model.addAttribute("subCtgNameList",subCtgList);
		model.addAttribute("m_ctg_list",list);
		
		return "product_list/main_ctg";
	}//mainCtgPL
	
//	
//	@RequestMapping("/sub_ctg.do")
//	public String subCtgPL(Model model, String sub_flag, String flag) {
//		
//		List<SubCtgDomain>subCtgList=pls.searchSubCtg(flag);
//		
//		List<ProductListDomain> sub_ctg_PL_list=pls.searchSubCtgPL(sub_flag);
//		
//		model.addAttribute("s_ctg_pl_list",sub_ctg_PL_list);
//		
//		model.addAttribute("subCtgNameList",subCtgList);
//		
//		return "product_list/sub_ctg";
//		
//	}//subCtgPL
//	

}
