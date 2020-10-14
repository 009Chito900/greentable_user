package kr.co.greentable.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.domain.SearchUserInfoDomain;
import kr.co.greentable.user.vo.ChkPassVO;
import kr.co.greentable.user.vo.JoinMemberVO;
import kr.co.greentable.user.vo.ModifyUserInfoVO;


public class UserInfoDAO {

private static UserInfoDAO uiDAO;
	
	private UserInfoDAO() {
		
	}//UserInfoDAO
	
	public static UserInfoDAO getInstance() {
		if( uiDAO == null) {
			uiDAO=new UserInfoDAO();
		}//end if 
		return uiDAO;
	}//getInstance

	
	
	/**
	 * 
	 * @param cpVO
	 * @return
	 */
	public int searchChkPass(ChkPassVO cpVO) {
		int flag=0; //ȸ
		
		//SQL
		SqlSession ss=UserInfoHandler.getInstance().getSqlSession();
		flag=ss.selectOne("kr.co.greentable.user.userInfo.selectChkPass", cpVO);
		
		return flag;
	}//searchChkPass
	
	/**
	 * 
	 * @return 
	 */
	public SearchUserInfoDomain searchUserInfo(ChkPassVO cpVO) {
		SearchUserInfoDomain suiDomain=new SearchUserInfoDomain();

		//SQL
		SqlSession ss=UserInfoHandler.getInstance().getSqlSession();
		suiDomain=ss.selectOne("kr.co.greentable.user.userInfo.selectUserInfo", cpVO);
		
		return suiDomain;
	}//searchUserInfo
	
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	public String selectEmail(String email) {
		String isDulEmail=""; //
		
		//SQL
		SqlSession ss=UserInfoHandler.getInstance().getSqlSession();
		isDulEmail=ss.selectOne("kr.co.greentable.user.userInfo.selectEmail", email);
		
		return isDulEmail;
	}//selectEmail
	
	/**
	 * 
	 * @param muiVO
	 * @return
	 */
	public int updateUserInfo(ModifyUserInfoVO muiVO) {
		int cnt=0;
		
		SqlSession ss=UserInfoHandler.getInstance().getSqlSession();
		cnt=ss.update("kr.co.greentable.user.userInfo.updateUserInfo", muiVO);
		
		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//updateUserInfo
	
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public int deleteDropOut(String id) {
		int cnt=0;
		
		SqlSession ss=UserInfoHandler.getInstance().getSqlSession();
		cnt=ss.update("kr.co.greentable.user.userInfo.deleteDropOut", id);
		
		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//deleteDropOut

	
	 public static void main(String[] args) {
		
	 }//main
	 
	
}// class 
