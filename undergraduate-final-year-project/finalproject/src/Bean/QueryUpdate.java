package Bean;
import java.sql.*;
import Bean.Conn;
public class QueryUpdate {
//��ѯ�����룬���£�ɾ�����ݿ������ݵ���
	Statement stmt=null;
	Connection con=null;
	public QueryUpdate(){
		this.con=Conn.getMySQLConnect();//connect mysql database
	}
	public void executeUpdate(String sql){
		try{
			stmt=con.createStatement();//setup statement object
			stmt.executeUpdate(sql);
		}
		catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
	}
	
	public ResultSet executeQuery(String sql){//execute query, parameter is sql, return ResultSet
		ResultSet rs1=null;
		try{
			stmt=con.createStatement();
			rs1=stmt.executeQuery(sql);
		}
		catch(SQLException ex){
			System.err.println("executeQuery:"+ex.getMessage());
		}
		return rs1;
	}
	
	public void close(){//close connection
		try{
			stmt.close();
			con.close();
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
	}
}
