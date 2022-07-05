package board;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBTest {
	public Connection con;
	
	public DBTest(String driver, String add, String id, String password) {
		try {
			Class.forName(driver);//JDBC ����̹� ����
			//�ּ�, ���̵�, �н����带 �μ��� �����ϸ鼭 getConnection�޼ҵ�� db����
			con = DriverManager.getConnection(add,id,password);
			
			System.out.println("���� ����");
		}
		catch(Exception e) {
			System.out.println("���� ����");
			e.printStackTrace();
		}
	}
	//���������ϰ� �ڿ� �ݳ�
	public void close() {
		try {
			if(con!=null) con.close();
			System.out.println("���� ����");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
