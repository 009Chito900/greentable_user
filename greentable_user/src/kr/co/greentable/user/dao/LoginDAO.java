package kr.co.greentable.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.vo.LoginVO;

public class LoginDAO {


	private static LoginDAO login_DAO;
	
	private LoginDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();

	}
	
	public static LoginDAO getInstance() {
		if(login_DAO == null) {
			login_DAO=new LoginDAO();
		}
		return login_DAO;
	}//getInstance
	
	public String selectLogin(LoginVO lVO) {
		String id="";
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		id=ss.selectOne("select_login",lVO);
		
		ss.close();
		return id;
	}//selectLogin
	
	
	public static void main(String[] args) {
		
		LoginVO lvo=new LoginVO();
		lvo.setId("kim1");
		lvo.setPassword("1234");		
		System.out.println(LoginDAO.getInstance().selectLogin(lvo) );
		
	}
	
}//class
