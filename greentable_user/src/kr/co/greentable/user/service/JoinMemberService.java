package kr.co.greentable.user.service;

import kr.co.greentable.user.dao.JoinMemberDAO;
import kr.co.greentable.user.vo.JoinMemberVO;

public class JoinMemberService {
	
	/**
	 * 
	 * @param id 
	 * @return
	 */
	public String searchId(String id) {
		String isDulId="";
		
		JoinMemberDAO jmDAO=JoinMemberDAO.getInstance();
		isDulId=jmDAO.selectId(id);
		
		return isDulId;
	}//searchId
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	public int searchEmail(String email) {
		int isDulEmail=0;
		
		JoinMemberDAO jmDAO=JoinMemberDAO.getInstance();
		isDulEmail=jmDAO.selectEmail(email);
		
		return isDulEmail;
	}//searchEmail
	
	/**
	 * 
	 * @param jmVO
	 * @return
	 */
	public int addJoinMember(JoinMemberVO jmVO) {
		int cnt=0;
		
		JoinMemberDAO jmDAO=JoinMemberDAO.getInstance();
		cnt=jmDAO.insertJoinMember(jmVO);
		
		return cnt;
	}//addJoinMember
	
	
	 
}// class
