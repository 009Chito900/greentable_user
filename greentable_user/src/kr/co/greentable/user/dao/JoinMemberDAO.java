package kr.co.greentable.user.dao;

import org.apache.ibatis.session.SqlSession;
import kr.co.greentable.user.vo.JoinMemberVO;


public class JoinMemberDAO {

private static JoinMemberDAO jmDAO;
	
	private JoinMemberDAO() {
		
	}//JoinMemberDAO
	
	public static JoinMemberDAO getInstance() {
		if( jmDAO == null) {
			jmDAO=new JoinMemberDAO();
		}//end if 
		return jmDAO;
	}//getInstance

	/**
	 * 
	 * @return 
	 */
	public String selectId(String id) {
		String isDulId=""; //

		//SQL
		SqlSession ss=JoinMemberHandler.getInstance().getSqlSession();
		isDulId=ss.selectOne("kr.co.greentable.user.joinMember.selectId", id);
		
		return isDulId;
	}//selectId
	
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	public int selectEmail(String email) {
		int isDulEmail=0; //
		
		//SQL
		SqlSession ss=JoinMemberHandler.getInstance().getSqlSession();
		isDulEmail=ss.selectOne("kr.co.greentable.user.joinMember.selectEmail", email);

		return isDulEmail;
	}//selectEmail
	
	
	public int insertJoinMember(JoinMemberVO jmVO){
		int cnt=0;
		//SQL
		SqlSession ss=JoinMemberHandler.getInstance().getSqlSession();
		cnt=ss.insert("kr.co.greentable.user.joinMember.insertJoinMember", jmVO);
		
		//transaction  
		if( cnt == 1 ) { //insert
			ss.commit();
		}//end if 
				
		//MyBatis Handler 
		ss.close();
		
		return cnt;
	}//insertJoinMember
	
	
	
	 public static void main(String[] args) {
		 JoinMemberDAO jmDAO=JoinMemberDAO.getInstance();
		 System.out.println(jmDAO.selectId("lee2"));
	 }//main
	 
	
}// class 
