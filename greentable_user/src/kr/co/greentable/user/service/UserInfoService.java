package kr.co.greentable.user.service;

import kr.co.greentable.user.dao.UserInfoDAO;
import kr.co.greentable.user.domain.SearchUserInfoDomain;
import kr.co.greentable.user.vo.ChkPassVO;
import kr.co.greentable.user.vo.ModifyUserInfoVO;

public class UserInfoService {
	
	/**
	 *
	 * @param cpVO
	 * @return
	 */
	public int searchChkPass(ChkPassVO cpVO) {
		int flag=0; //
		
		UserInfoDAO uiDAO=UserInfoDAO.getInstance();
		flag=uiDAO.searchChkPass(cpVO);
		
		if(flag > 1) { //
			flag=0; 
		}//end if 
		
		return flag;
	}//searchChkPass
	
	
	/**
	 * 
	 * @param 
	 * @return
	 */
	public SearchUserInfoDomain searchUserInfo(ChkPassVO cpVO) {
		SearchUserInfoDomain suiDomain=new SearchUserInfoDomain();
		
		UserInfoDAO uiDAO=UserInfoDAO.getInstance();
		suiDomain=uiDAO.searchUserInfo(cpVO);
		
		return suiDomain;
	}//searchUserInfo

	/**
	 * 
	 * @param email
	 * @return
	 */
	public String searchEmail(String email) {
		String isDulEmail="";
		
		UserInfoDAO uiDAO=UserInfoDAO.getInstance();
		isDulEmail=uiDAO.selectEmail(email);
		
		return isDulEmail;
	}//searchEmail
	
	/**
	 *
	 * @param muiVO
	 * @return
	 */
	public int modifyUserInfo(ModifyUserInfoVO muiVO) {
		int cnt=0;
		
		UserInfoDAO uiDAO=UserInfoDAO.getInstance();
		cnt=uiDAO.updateUserInfo(muiVO);
		
		return cnt;
	}//modifyUserInfo
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public int removeDropOut(String id) {
		int cnt=0;
		
		UserInfoDAO uiDAO=UserInfoDAO.getInstance();
		cnt=uiDAO.deleteDropOut(id);
		
		return cnt;
		
	}//removeDropOut
	
	
	
	
}// class
