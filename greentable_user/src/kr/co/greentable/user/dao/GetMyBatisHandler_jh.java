package kr.co.greentable.user.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GetMyBatisHandler_jh {
	
	private static GetMyBatisHandler_jh gmbh;
	private static SqlSessionFactory ssf;
	
	private GetMyBatisHandler_jh() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
		
	}//ExamMyBatisDAO
	
	
	public static GetMyBatisHandler_jh getInstance() {
		if( gmbh == null ) {
			gmbh = new GetMyBatisHandler_jh();
		}//end if
		
		return gmbh;
	}//getInstance
	

	public SqlSession getSqlSession() {
	
		SqlSession ss = null;
		if( ssf == null ) {
			
			try {
				///1. Stream을 사용하여 xml과 연결 (mybatis_select_config.xml : 실행할 쿼리문을 가진 Mapper XML과 연결 )
				String xmlConfig = "kr/co/greentable/user/dao/mybatis_config_jh.xml";
				Reader reader = Resources.getResourceAsReader(xmlConfig);

				//2. MyBatisFramework 생성
				ssf = new SqlSessionFactoryBuilder().build(reader);
				reader.close(); //xml을 읽어들인 스트림을 끊는다.
	
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
		}//end if
		
		ss = ssf.openSession();
		
		return ss;
	}//getSqlSession
	
}//class
