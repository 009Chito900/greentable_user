package kr.co.greentable.user.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AjaxDAO {

	private static AjaxDAO ajDAO;
	private static SqlSessionFactory ssf;

	private AjaxDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging(); // �����ڿ� myBatis�� �α׸� �ҷ����� �ڵ�(log4j)
	}// AdminAskDAO

	public static AjaxDAO getInstance() {
		if (ajDAO == null) {
			ajDAO = new AjaxDAO();
		}
		return ajDAO;
	}// get insatnce

	private SqlSessionFactory getSqlSessionFactory() throws IOException {
		if (ssf == null) {
			// 1.Stream�� ����Ͽ� xml�� ����
			String xmlConfig = "kr/co/greentable/user/dao/mybatis_config.xml";
			Reader reader = Resources.getResourceAsReader(xmlConfig);

			// 2MyBatis Framework ����
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

	 }// class 
