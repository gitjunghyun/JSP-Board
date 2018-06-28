package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DealDBBean { // static을 사용해 객체를 생성하면 객체 간의 전역 객체가 됨 //따라서, 이 객체는 단
							// 한번만 생성되고 객체들 간에 공유
	private static DealDBBean instance = new DealDBBean();

	public static DealDBBean getInstance() {
		return instance;
	}

	private DealDBBean() {
	}

	// 커넥션 풀에서 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	
	
}
