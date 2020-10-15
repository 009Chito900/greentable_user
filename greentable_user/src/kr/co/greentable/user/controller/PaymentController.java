package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.greentable.user.domain.CartListDomain;
import kr.co.greentable.user.domain.MemberDomain;
import kr.co.greentable.user.domain.OptionDomain;
import kr.co.greentable.user.service.PaymentService;
import kr.co.greentable.user.vo.ReceiverVO;

@SessionAttributes({"cart1"})
@Controller
public class PaymentController {
	
	/**
	 * 주문하기 버튼 클릭 시 결제하기 페이지에 장바구니 리스트를 보여주는 일
	 * @return
	 */
	@RequestMapping(value = "/user_payment_frm.do", method = GET)
	public String PaymentForm(HttpSession session, Model model) {
		
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
		
		String[] bankArr= {"국민은행","농협은행","신한은행","우리은행"};
		model.addAttribute("bankList", bankArr);
		
		
		////////////////////// session이 없으므로 고정된 값으로 테스트(변경예정) ///////////////////////////////////////////
//		String user_id = (String)session.getAttribute("id");
		String user_id = "hong";
		
		PaymentService ps = new PaymentService();
		MemberDomain md = ps.selectMember(user_id);
		model.addAttribute("member", md);
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		return "payment/user_payment_frm";
	}//PaymentForm
	
	
	@RequestMapping(value = "/user_payment_process.do", method = POST)
	public String Payment(HttpSession session, ReceiverVO rVO, Model model) {
		
		//////////////////////session이 없으므로 고정된 값으로 테스트(변경예정) ///////////////////////////////////////////
		//String user_id = (String)session.getAttribute("id");
		String user_id = "hong";
		rVO.setId(user_id);	
		///////////////////////////////////
		
		PaymentService ps = new PaymentService();
		ps.addReceiver(rVO);
		model.addAttribute("receiverInfo", rVO);
		model.addAttribute("order_date", new Date());
		
		return "payment/user_payment_success";
	}//Payment 
	
	
	/**
	 * 결제완료 페이지에서 홈으로 이동 버튼 클리 시 main페이지 이동
	 * @return
	 */
	@RequestMapping(value = "/user_main.do", method = GET)
	public String UserMainForm() {
		
		return "main/user_main";
	}//UserMainForm

	
}//class
