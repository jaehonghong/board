package board;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBTest {
	public Connection con;
	
	public DBTest(String driver, String add, String id, String password) {
		try {
			Class.forName(driver);//JDBC 드라이버 실행
			//주소, 아이디, 패스워드를 인수로 전달하면서 getConnection메소드로 db연동
			con = DriverManager.getConnection(add,id,password);
			
			System.out.println("연결 성공");
		}
		catch(Exception e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}
	}
	//연결해지하고 자원 반납
	public void close() {
		try {
			if(con!=null) con.close();
			System.out.println("연결 종료");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
