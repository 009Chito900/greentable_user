package kr.co.greentable.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.greentable.user.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@GetMapping("/product_detail.do")
	public String productDetail(String productNum, Model model) {
		ProductDetailService pdds = new ProductDetailService();
		
		model.addAttribute("pddd", pdds.selectProductDetail(productNum.trim()));
		
		return "detail/product_detail_frm";
	}
}
