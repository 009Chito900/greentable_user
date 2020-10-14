package kr.co.greentable.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.domain.UserProductDetailDomain;
import kr.co.greentable.user.domain.SelectUserOrderListDomain;
import kr.co.greentable.user.domain.SelectUserOrderNumDomain;
import kr.co.greentable.user.vo.ChkPassVO;
import kr.co.greentable.user.vo.OrderPageRangeVO;
import kr.co.greentable.user.vo.ProductDetailVO;
import kr.co.greentable.user.vo.SearchUserOrderListVO;

public class UserOrderListDAO {

private static UserOrderListDAO uolDAO;
	
	private UserOrderListDAO() {
		
	}//UserInfoDAO
	
	public static UserOrderListDAO getInstance() {
		if( uolDAO == null) {
			uolDAO=new UserOrderListDAO();
		}//end if 
		return uolDAO;
	}//getInstance

	
	/**
	 * 
	 * @return
	 */
	public int SelectUserOrderCnt( SearchUserOrderListVO suolVO ) {
		int totalCnt=0;
		
		//SQL
		SqlSession ss=UserOrderListHandler.getInstance().getSqlSession();
		totalCnt=ss.selectOne("kr.co.greentable.user.userOrderList.selectOrderCnt", suolVO);
				
		return totalCnt;
	}//SelectUserOrderCnt
	
	
	/**
	 * 
	 * @param suolVO
	 * @return
	 */
	public List<SelectUserOrderNumDomain> selectOrderNum(SearchUserOrderListVO suolVO){
		List<SelectUserOrderNumDomain> list=new ArrayList<SelectUserOrderNumDomain>();
		
		//SQL
		SqlSession ss=UserOrderListHandler.getInstance().getSqlSession();
		list=ss.selectList("kr.co.greentable.user.userOrderList.selectOrderNum", suolVO);
		
		return list;
	}//selectOrderNum
	
	
	/**
	 * 
	 * @param suolVO
	 * @return
	 */
	public List<SelectUserOrderListDomain> selectOrderList(SearchUserOrderListVO suolVO){
		List<SelectUserOrderListDomain> list=new ArrayList<SelectUserOrderListDomain>();
		
		//SQL
		SqlSession ss=UserOrderListHandler.getInstance().getSqlSession();
		list=ss.selectList("kr.co.greentable.user.userOrderList.selectOrderList", suolVO);
				
		return list;
	}//selectOrderList
	
	/**
	 * 
	 * @param orderListNum 
	 * @return
	 */
	public UserProductDetailDomain selectOrderDetail(ProductDetailVO pdVO) {
		UserProductDetailDomain pdDomain=new UserProductDetailDomain();
		
		//SQL
		SqlSession ss=UserOrderListHandler.getInstance().getSqlSession();
		pdDomain=ss.selectOne("kr.co.greentable.user.userOrderList.selectOrderDetail", pdVO);
		
		return pdDomain;
	}//selectOrderDetail
	
	
	
	

	 public static void main(String[] args) {

	 }//main
	
	
}// class 
