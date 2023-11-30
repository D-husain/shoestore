package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ProjectConn {

	public static Connection createConnection(){
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoe_store","root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
