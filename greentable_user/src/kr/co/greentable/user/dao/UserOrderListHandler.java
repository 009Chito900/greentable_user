package kr.co.greentable.user.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserOrderListHandler {

	private static UserOrderListHandler gmbhDAO;
	private static SqlSessionFactory ssf;

	private UserOrderListHandler() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging(); //
	}//ExamMyBatisDAO
	
	public static UserOrderListHandler getInstance() {
		if(gmbhDAO ==null) {
			gmbhDAO = new UserOrderListHandler();	
		}
		return gmbhDAO;
	}//get insatnce
	
	public SqlSession getSqlSession() {
		
		SqlSession ss=null;
		
		if(ssf ==null) {
			try {
				//1.Stream
				String xmlConfig="kr/co/greentable/user/dao/mybatis_userorderlist_config.xml";
				Reader reader=Resources.getResourceAsReader(xmlConfig);
				
				//2MyBatis Framework 
				ssf=new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			}catch(IOException ie) {
				ie.printStackTrace();
			}//end catch
		}//end if
		ss=ssf.openSession();
		return ss;
	}//getSqlSessionFactory
	
	
}//class