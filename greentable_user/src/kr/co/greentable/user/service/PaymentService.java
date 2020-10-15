package kr.co.greentable.user.service;

import kr.co.greentable.user.dao.PaymentDAO;
import kr.co.greentable.user.domain.MemberDomain;
import kr.co.greentable.user.vo.ReceiverVO;

public class PaymentService {

	public MemberDomain selectMember(String id) {
		
		MemberDomain md = null;
		
		PaymentDAO pDAO = PaymentDAO.getInstance();
		md = pDAO.selectMember(id);
		
		return md;
	}//selectMember
	
	public int addReceiver(ReceiverVO rVO) {

		int cnt = 0;
		
		PaymentDAO pDAO  = PaymentDAO.getInstance();
		String orderNum = pDAO.selectOrderNum();
		
		rVO.setOrder_num(orderNum);
		cnt = pDAO.insertTotalOrder(rVO);		
		cnt = pDAO.insertReceiver(rVO);
		cnt = pDAO.insertPayment(rVO);
		
		return cnt;
	}//addReceiver
	
}//class
