package kr.co.greentable.user.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.domain.MemberDomain;
import kr.co.greentable.user.vo.ReceiverVO;

public class PaymentDAO {
	
	private static PaymentDAO  pDAO;

	private PaymentDAO() {
	}//CartDAO

	public static PaymentDAO getInstance() {

		if(pDAO == null ) {
			pDAO = new PaymentDAO();
		}//end if

		return pDAO;
	}//getInstance
	
	
	/**
	 * 주문하시는 분의 이름, 휴대폰번호, 주소를 가져오는 일  
	 * @param id
	 * @return
	 */
	public MemberDomain selectMember(String id) {
		
		MemberDomain md = null;
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		md = ss.selectOne("selectMember", id);
		ss.close();
		
		return md;
	}//selectMember
	
	
	public String selectOrderNum() {
		
		String orderNum = null;
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		orderNum = ss.selectOne("selectOrderNum");
		
		return orderNum;
	}//selectOrderNum
	
	
	public int insertTotalOrder(ReceiverVO rVO) {
		
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		cnt = ss.insert("insertTotalOrder", rVO);
		
		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//insertTotalOrder
	
	
	/**
	 * 받으시는 분 정보를 받는 일
	 * @param rVO
	 * @return
	 * @throws SQLException
	 */
	public int insertReceiver(ReceiverVO rVO) {
		
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		cnt = ss.insert("insertReceiver", rVO);
		
		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//insertReceiver
	
	
	/**
	 * 결제정보를 받는 일
	 * @param rVO
	 * @return
	 */
	public int insertPayment(ReceiverVO rVO) {
		
		int cnt = 0;
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		cnt = ss.insert("insertPayment", rVO);
		
		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//insertPayment

	
}//class
