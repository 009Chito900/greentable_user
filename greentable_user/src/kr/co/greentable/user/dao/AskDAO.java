package kr.co.greentable.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.domain.AskDetailDomain;
import kr.co.greentable.user.domain.AskDomain;
import kr.co.greentable.user.vo.AskAddVO;
import kr.co.greentable.user.vo.AskDetailVO;

public class AskDAO {

private static AskDAO ask_DAO;
	
	private AskDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();

	}
	
	public static AskDAO getInstance() {
		if(ask_DAO == null) {
			ask_DAO=new AskDAO();
		}
		return ask_DAO;
	}//getInstance
	
	public List<AskDomain> selectAskList(String id) {
		 List<AskDomain> list=null;
		 SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		list=ss.selectList("select_ask", id);
		
		ss.close();
		 return list;
	}//selectAskList
	
	public AskDetailDomain selectAskDetail(String ask_num) {
		AskDetailDomain add=null;
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		add=ss.selectOne("select_ask_detail", ask_num);
		
		ss.close();
		return add;
	}//selectAskDetailList
	
	

	public int removeAsk(String ask_num) {
		int cnt=0;
		
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		cnt=ss.delete("delete_ask", ask_num);
		ss.commit();
		
		ss.close();
		return cnt;
	}//removeAsk
	
	
	public  void insertAsk(AskAddVO aaVO) {
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		ss.insert("insert_ask",aaVO);
		ss.commit();
		
		ss.close();
	}//insertAsk
	
	
	
	
	public static void main(String[] args){
	
//		AskAddVO aaVO=new AskAddVO();
//		aaVO.setId("kim");
//		aaVO.setAsk_category("배송");
//		aaVO.setAsk_subject("들어가라");
//		aaVO.setAsk_content("제발 좀");
//		
//		AskDAO.getInstance().insertAsk(aaVO);
//		
		AskDAO.getInstance().removeAsk("ask_106");
	
	}
	
}//class
