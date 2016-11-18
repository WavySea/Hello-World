package Bean;
import java.sql.*;
public class Conn {
	public static Connection getMySQLConnect(){//connet database
		Connection con=null;
		String driverName="com.mysql.jdbc.Driver";
		String userName="root";
		String userPasswd="";
		String dbName="finalproject";
		String conURL="jdbc:mysql://127.0.0.1:3306/"+dbName;
		try{
			Class.forName(driverName);
		}catch(ClassNotFoundException e){
			System.out.print("Error loading Mysql Driver");
		}
		try{
			con=DriverManager.getConnection(conURL,userName,userPasswd);
		}catch(SQLException e){
			System.err.println(e.getMessage());
		}
		return con;
	}
}
