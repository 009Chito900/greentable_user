package kr.co.greentable.user.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import kr.co.greentable.user.dao.AskDAO;
import kr.co.greentable.user.domain.AskDetailDomain;
import kr.co.greentable.user.domain.AskDomain;
import kr.co.greentable.user.vo.AskAddVO;
import kr.co.greentable.user.vo.AskDetailVO;

public class AskService {
	
	AskDAO aDao=AskDAO.getInstance();
	
	public List<AskDomain> searchAskList(String id) {
		List<AskDomain> list=null;
		AskDomain ad=new AskDomain();
		list=aDao.selectAskList(id);
		for(int i=0;i<list.size();i++) {
		if(list.get(i).getAsk_answer() == null) {
			
			list.get(i).setAsk_answer("답변대기");
		}else {
			list.get(i).setAsk_answer("답변완료");
			
			}//end else
//		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd hh:mm:ss a");
//		String date=sdf.format(list.get(i).getAsk_date());
//		list.get(i).setAsk_date(date);
		
		}//end for
		return list;
	}//searchAskList
	
	public AskDetailDomain searchAskDetail(String ask_num) {
		AskDetailDomain add=new AskDetailDomain();
		add=aDao.selectAskDetail(ask_num);
		
		if(add.getAsk_answer() == null) {
			add.setAsk_status("답변대기");
		}else {
			add.setAsk_status("답변완료");
		}
		
			return add;
	}//searchAskDeatil
	
	
	public int removeAsk(String ask_num) {
		int cnt=0;
	
		cnt=aDao.removeAsk(ask_num);
		
		return cnt;
	}//removeAsk
	
	public void addAsk(AskAddVO aaVO) {
		aDao.insertAsk(aaVO);
		
	}
	
	
	public static void main(String[] args){
		
		//AskDomain ad=new AskDomain();
	//	System.out.println(ad.getAsk_answer()); 
	}
	
}//class
