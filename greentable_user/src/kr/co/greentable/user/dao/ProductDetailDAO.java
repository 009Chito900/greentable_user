package kr.co.greentable.user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.greentable.user.domain.ProductDetailDomain;
import kr.co.greentable.user.domain.ProductDetailOptionDomain;

public class ProductDetailDAO {
	
	private static ProductDetailDAO pddDAO;
	private static SqlSessionFactory ssf;

	private ProductDetailDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // �����ڿ� myBatis�� �α׸� �ҷ����� �ڵ�(log4j)
		
	}// AdminAskDAO

	public static ProductDetailDAO getInstance() {
		if (pddDAO == null) {
			pddDAO = new ProductDetailDAO();
		}
		return pddDAO;
	}// get insatnce

	private SqlSessionFactory getSqlSessionFactory() throws IOException {
		if (ssf == null) { 
			String xmlConfig = "kr/co/greentable/user/dao/mybatis_config.xml";
			Reader reader = Resources.getResourceAsReader(xmlConfig);

			ssf = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} // end if
		return ssf;
	}// getSqlSessionFactory

	public SqlSession getSqlSession() {
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return ss;
	}// getSqlSession
	
	public ProductDetailDomain selectProductDetail(String productNum) {
		ProductDetailDomain pdd = null;
		
		SqlSession ss = getSqlSession();
		pdd = ss.selectOne("kr.co.greentable.productDetail.selectProductDetail", productNum);
		
		ss.close();
		return pdd;
	}
	
	public List<ProductDetailOptionDomain> selectProductOptionDetail(String productNum) {
		List<ProductDetailOptionDomain> pddodList = null;
		
		SqlSession ss = getSqlSession();
		pddodList = ss.selectList("kr.co.greentable.productDetail.selectOptionList", productNum);
		
		ss.close();
		return pddodList;
	}

	public static void main(String[] args) {
		System.out.println(ProductDetailDAO.getInstance().selectProductOptionDetail("pro_62").size());
		System.out.println(new ProductDetailDAO().selectProductDetail("pro_62"));
	}
	}
