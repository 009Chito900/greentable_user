package kr.co.greentable.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.greentable.user.domain.MainPLDomain;
import kr.co.greentable.user.domain.ProductListDomain;
import kr.co.greentable.user.domain.SubCtgDomain;
import kr.co.greentable.user.vo.CtgVO;
import kr.co.greentable.user.vo.LoginVO;

public class ProductListDAO {


	private static ProductListDAO pl_DAO;
	
	private ProductListDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();

	}
	
	public static ProductListDAO getInstance() {
		if(pl_DAO == null) {
			pl_DAO=new ProductListDAO();
		}
		return pl_DAO;
	}//getInstance
	
	public List <MainPLDomain> selectMain() {
		List <MainPLDomain> list=null;
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		list=ss.selectList("select_main_product");
		return list;
	}
	
	public List<ProductListDomain> selectMainCtgPL(CtgVO cVO){
		List<ProductListDomain> list=null;
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		
		String temp="바다와 강";
		if( "fruits".equals(cVO.getFlag()) ) {
			temp="과수원";
		}
		if( "grains".equals(cVO.getFlag()) ) {
			temp="쌀 잡곡";
		}
		
		cVO.setFlag(temp);
		
		System.out.println("-----------------"+ cVO);
		list=ss.selectList("select_main_ctg_product",cVO);
		return list;
	}
	
	public List<ProductListDomain> selectSubCtgPL(String sub_flag){
		List<ProductListDomain> list=null;
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		list=ss.selectList("select_sub_ctg_product",sub_flag);
		return list;
	}//selectSubCtgPL
	
	public List<SubCtgDomain> selectSubCtg(String flag) {
	List<SubCtgDomain> subCtgList=null;
		SqlSession ss=MJ_GetMyBatisHandler.getInstance().getSqlSession();
		
		String temp="바다와 강";
		if( "fruits".equals(flag) ) {
			temp="과수원";
		}
		if( "grains".equals(flag) ) {
			temp="쌀 잡곡";
		}
		
		flag=temp;
		subCtgList=ss.selectList("select_sub_category",flag);
		return subCtgList;
	}
	
	
	public static void main(String[] args) {
//		System.out.println(ProductListDAO.getInstance().selectMainCtgPL("grains"));
//		System.out.println(ProductListDAO.getInstance().selectSubCtg("fruits"));
		System.out.println(ProductListDAO.getInstance().selectSubCtgPL("FrImported"));
	}
	
}//class
