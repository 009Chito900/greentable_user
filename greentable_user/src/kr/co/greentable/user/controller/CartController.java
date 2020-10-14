package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.greentable.user.domain.CartListDomain;
import kr.co.greentable.user.domain.OptionDomain;
import kr.co.greentable.user.service.CartService;

@SessionAttributes({"cart1"})
@Controller
public class CartController {
	
	/**
	 * 장바구니 목록 불러오기
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/cart_list.do", method = GET)
	public String cartList(HttpSession session, Model model) {
		
		OptionDomain od = new OptionDomain("opt_1", "중량: 700g", 8600, 2);
		// od1 = new OptionDomain("opt_2", "중량: 1500g", 850, 1);
		
		List<OptionDomain> list = new ArrayList<OptionDomain>();
		list.add(od);
		//list.add(od1);
		
		CartListDomain cld1 = new CartListDomain("레몬.gif", "썬키스트 팬시 레몬", "20201012", list);
		//CartListDomain cld2 = new CartListDomain("쌀잡곡 백미.png", "유기농 햅쌀", "20201012", list);
		
		session.setAttribute("cart1", cld1);
		//session.setAttribute("cart2", cld2);
		session.getAttribute("cart1");
		//session.getAttribute("cart2");
		
		model.addAttribute("list_data", list);
		model.addAttribute("cart1", cld1);
		//model.addAttribute("cart2", cld2);
		
		//CartService cs = new CartService();
		
		//session에 저장해두었던 userId
//		String user_id = (String)session.getAttribute("id");
		
		return "cart/cart_list";
	}//cartListForm
	 
	
	/**
	 * 장바구니 삭제
	 * @param session
	 * @param order_list_num
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/remove_cart.do", method = POST)
	public String removeCart(HttpSession session, String order_list_num , Model model) {
		
		CartService cs = new CartService();
		boolean flag = cs.removeCart(order_list_num);
		
		model.addAttribute("delFlag", flag); //삭제결과
		model.addAttribute("move_page", "del"); //이동한 페이지

		return "forward:cart_list.do";
	}//removeCart
	
	
}//class
