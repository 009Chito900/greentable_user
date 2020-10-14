package kr.co.greentable.user.service;

import java.util.List;

import kr.co.greentable.user.dao.ProductListDAO;
import kr.co.greentable.user.domain.MainPLDomain;
import kr.co.greentable.user.domain.ProductListDomain;
import kr.co.greentable.user.domain.SubCtgDomain;
import kr.co.greentable.user.vo.CtgVO;

public class ProductListService {

	ProductListDAO pl_DAO=ProductListDAO.getInstance();
	
	public List<MainPLDomain> searchMain(){
		List <MainPLDomain> list=null;
		list=pl_DAO.selectMain();
		return list;
	}
		
	public List<ProductListDomain>searchMainCtgPL(CtgVO cVO){
		 List<ProductListDomain>list=null;
		 list=pl_DAO.selectMainCtgPL(cVO);
		 return list;
	}
	
	public List<ProductListDomain>searchSubCtgPL(String sub_flag){
		List<ProductListDomain>list=null;
		list=pl_DAO.selectSubCtgPL(sub_flag);
		return list;
	}
	
		
	public List<SubCtgDomain> searchSubCtg(String flag) {
		List<SubCtgDomain>subCtgList=null;
		subCtgList=pl_DAO.selectSubCtg(flag);
		return subCtgList;
	}
	
	
	
}//class
