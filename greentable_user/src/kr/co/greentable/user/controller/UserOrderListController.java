package kr.co.greentable.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.greentable.user.domain.UserProductDetailDomain;
import kr.co.greentable.user.service.UserOrderListService;
import kr.co.greentable.user.vo.OrderPageRangeVO;
import kr.co.greentable.user.vo.ProductDetailVO;
import kr.co.greentable.user.vo.SearchUserOrderListVO;;

@Controller
public class UserOrderListController {
	
	/**
	 * 
	 * @param oprVO 
	 * @param date 
	 * @param session 
	 * @param model 
	 * @return
	 */
	@RequestMapping(value = "/user/orderList.do", method = {GET, POST} )
	public String orderList(String paramPage, SearchUserOrderListVO suolVO, HttpSession session, Model model) {
		String url="userOrderList/orderList";
		//
		String id=(String)session.getAttribute("user_id");
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {
			// 
			suolVO.setId(id);
			//service
			UserOrderListService uols=new UserOrderListService();
			//
			int totalCount=uols.selectUserOrderCnt(suolVO);
			//
			int pageScale=uols.pageScale();
			//
			int totalPage=uols.totalPage(totalCount, pageScale);
			//xxxController
			if( paramPage == null){
				paramPage="1";
			}//end if
			
			int currentPage=Integer.parseInt( paramPage );
			
			//
			int startNum=uols.startNum(currentPage, pageScale);
			
			//
			int endNum=uols.endNum(startNum,pageScale);
			
			//
			OrderPageRangeVO oprVO=new OrderPageRangeVO(startNum, endNum);
			
			//model
			model.addAttribute("order_num", uols.searchOrderNum(suolVO));
			model.addAttribute("order_list", uols.searchOrderList(suolVO));
			model.addAttribute("total_page", totalPage);
		}//end else
		
		return url;
	}//orderList
	
	/**
	 * 
	 * @param orderListNum
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/user/orderDetail.do", method = {GET, POST} )
	public String orderDetail(ProductDetailVO pdVO, HttpSession session, Model model) {
		String url="userOrderList/orderDetail";
		//
		String id=(String)session.getAttribute("user_id");
		if(id == null) {
			url="redirect:/user/loginForm.do"; //
		}else {
			
			//service
			UserOrderListService uols=new UserOrderListService();
			UserProductDetailDomain pdDomain=new UserProductDetailDomain();
			pdDomain=uols.searchOrderDetail(pdVO);
			
			model.addAttribute("order_date", pdVO.getOrder_date());
			model.addAttribute("order_num", pdVO.getOrder_num());
			model.addAttribute("order_detail", pdDomain);

			
		}//end else
		
		return url;
		
	}//orderList
	
	
}//class
