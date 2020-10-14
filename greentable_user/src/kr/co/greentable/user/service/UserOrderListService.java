package kr.co.greentable.user.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import kr.co.greentable.user.dao.UserOrderListDAO;
import kr.co.greentable.user.domain.UserProductDetailDomain;
import kr.co.greentable.user.domain.SelectUserOrderListDomain;
import kr.co.greentable.user.domain.SelectUserOrderNumDomain;
import kr.co.greentable.user.vo.ProductDetailVO;
import kr.co.greentable.user.vo.SearchUserOrderListVO;

public class UserOrderListService {
	
	/**
	 * 
	 * @param suolVO
	 * @return
	 */
	public int selectUserOrderCnt(SearchUserOrderListVO suolVO) {
		int totalCnt=0;
		
		UserOrderListDAO uolDAO=UserOrderListDAO.getInstance();
		totalCnt=uolDAO.SelectUserOrderCnt(suolVO);
		
		return totalCnt;
	}//selectUserOrderCnt
	
	/**
	 * 
	 * @return
	 */
	public int pageScale() {
		int pageScale=5;
		
		return pageScale;
	}//pageScale

	/**
	 * 
	 * @param totalCount
	 * @param pageScale
	 * @return
	 */
	public int totalPage( int totalCount, int pageScale) {
		
		int totalPage=(int)Math.ceil( (double)totalCount /pageScale);
		
		return totalPage;
	}//totalPage
	
	/**
	 * 
	 * @return
	 */
	public int startNum( int currentPage, int pageScale ) {
		int startNum= currentPage*pageScale-pageScale+1 ;
		return startNum;
	}//startNum
	
	/**
	 *  
	 * @return
	 */
	public int  endNum( int startNum, int pageScale ) {
		int endNum=startNum+pageScale-1;
		return endNum;
	}//endNum
	
	
	/**
	 * 
	 * @param suolVO
	 * @return
	 */
	public List<SelectUserOrderNumDomain> searchOrderNum(SearchUserOrderListVO suolVO){
		List<SelectUserOrderNumDomain> list=new ArrayList<SelectUserOrderNumDomain>();
		UserOrderListDAO uolDAO=UserOrderListDAO.getInstance();

		if(suolVO.getSearchPeriod() != null ||  suolVO.getSearchPeriod() != "") { //
			//
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			String today = format1.format(day.getTime());
	
			suolVO.setToday(today); //
			
			if(suolVO.getSearchPeriod() == "day") { //
				
				day.add(Calendar.DATE , -1);
				 String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
				 
				 suolVO.setSearchDate(beforeDate); //
			}else if(suolVO.getSearchPeriod() == "aWeek") { //
				
				Calendar week = Calendar.getInstance();
			    week.add(Calendar.DATE , -7);
			    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			    
			    suolVO.setSearchDate(beforeWeek); //
			}else if(suolVO.getSearchPeriod() == "aMonth") { //
				
				Calendar mon = Calendar.getInstance();
			    mon.add(Calendar.MONTH , -1);
			    String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
			    
			    suolVO.setSearchDate(beforeMonth); //
			}else if(suolVO.getSearchPeriod() == "threeMonths") { //
				
				Calendar mon3 = Calendar.getInstance();
			    mon3.add(Calendar.MONTH , -3);
			    String threeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon3.getTime());
			    
			    suolVO.setSearchDate(threeMonth); //
			}//end if 
			
		}//end if 
		
		list=uolDAO.selectOrderNum(suolVO);
		
		return list;
	}//searchOrderNum
	
	/**
	 * 
	 * @param suolVO
	 * @return
	 */
	public List<SelectUserOrderListDomain> searchOrderList(SearchUserOrderListVO suolVO){
		List<SelectUserOrderListDomain> list=new ArrayList<SelectUserOrderListDomain>();
		UserOrderListDAO uolDAO=UserOrderListDAO.getInstance();
		if(suolVO.getSearchPeriod() != null ||  suolVO.getSearchPeriod() != "") { //
			//
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			String today = format1.format(day.getTime());
	
			suolVO.setToday(today); //
			
		
			if("day".equals(suolVO.getSearchPeriod())) { //
				
				day.add(Calendar.DATE , -1);
				 String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
				 suolVO.setSearchDate(beforeDate); //
			}else if("aWeek".equals(suolVO.getSearchPeriod())) { //
				
				Calendar week = Calendar.getInstance();
			    week.add(Calendar.DATE , -7);
			    String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			    
			    suolVO.setSearchDate(beforeWeek); //
			}else if("aMonth".equals(suolVO.getSearchPeriod())) { //
				Calendar mon = Calendar.getInstance();
			    mon.add(Calendar.MONTH , -1);
			    String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
			    
			    suolVO.setSearchDate(beforeMonth); //
			}else if("threeMonths".equals(suolVO.getSearchPeriod())) { //
				
				Calendar mon3 = Calendar.getInstance();
			    mon3.add(Calendar.MONTH , -3);
			    String threeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon3.getTime());
			    
			    suolVO.setSearchDate(threeMonth); //
			}//end if 
			
		}//end if 
		
		list=uolDAO.selectOrderList(suolVO);
		
		//
		int total_price=0;
		if( list.size() != 0 ) {
			for( int i=0; i < list.size(); i++) {
				total_price=list.get(i).getQuantity()*list.get(i).getOption_price();
				list.get(i).setTotal_price(total_price);
			}//end for
		}//end if 
		
		return list;
	}//searchOrderList
	
	
	/**
	 * 
	 * @param orderListNum
	 * @return
	 */
	public UserProductDetailDomain searchOrderDetail(ProductDetailVO pdVO) {
		UserProductDetailDomain pdDomain=new UserProductDetailDomain();
		
		UserOrderListDAO uolDAO=UserOrderListDAO.getInstance();
		pdDomain=uolDAO.selectOrderDetail(pdVO);
		
		//
		int totalPrice=0;
		totalPrice=pdDomain.getOption_price()*pdDomain.getQuantity();
		pdDomain.setTotal_price(totalPrice);
		
		return pdDomain;
	}//searchOrderDetail
	
	
	 public static void main(String[] args) {
	
	 }//main
	
}// class
