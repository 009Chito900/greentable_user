package kr.co.greentable.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.vo.FindPassVO;
import kr.co.greentable.user.vo.UpdatePassVO;

public class FindPassDAO {

	private static FindPassDAO  fpDAO;

	private FindPassDAO() {
	}//Select5DAO

	public static FindPassDAO getInstance() {

		if(fpDAO == null ) {
			fpDAO = new FindPassDAO();
		}//end if

		return fpDAO;
	}//getInstance
	
	
	public String selectMemberPass(FindPassVO fpVO) {
		
		String findPass = null; 
		
		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		findPass = ss.selectOne("selectMemberPass", fpVO);
		ss.close();
		
		return findPass;
	}//selectMemberPass


	public int updateMemberPass(UpdatePassVO upVO) {

		int cnt = 0;

		SqlSession ss = GetMyBatisHandler_jh.getInstance().getSqlSession();
		cnt = ss.update("updateMemberPass", upVO);

		if(cnt == 1) {
			ss.commit();
		}//end if
		ss.close();

		return cnt;
	}//updateMemberPass
	
}//class
