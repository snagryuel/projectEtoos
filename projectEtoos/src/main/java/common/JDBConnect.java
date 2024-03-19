package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletContext;

public class JDBConnect {//기본 생성자
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	public JDBConnect() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url="jdbc:mariadb://localhost:3306/maria";
			String dbId = "root";
			String dbPwd = "1234";
			conn = DriverManager.getConnection(url, dbId, dbPwd);
			System.out.println("DB 연결 성공 : 기본 생성자");
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public JDBConnect(String driver, String url, String dbId, String dbPwd) {//직접 사용자가 입력하여 사용하는 부분
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPwd);
			System.out.println("DB 연결 성공 : 사용자 정의 생성자 1");
			}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect(ServletContext application){//xml의 환경설정에서 가져오는 부분
		try {
			String driver = application.getInitParameter("Driver");
			 Class.forName(driver);
			 String url = application.getInitParameter("URL");
			 String id = application.getInitParameter("dbId");
			 String pwd = application.getInitParameter("dbPwd");
			 conn = DriverManager.getConnection(url, id, pwd);
			 System.out.println("DB 연결 성공 : 환경설정 생성자");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void Close() {
		try {
			if(rs!=null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
			System.out.println("DB 연결 종료");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
