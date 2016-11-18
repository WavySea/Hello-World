package finalproject.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import finalproject.db.DBConnect;
import finalproject.vo.User;
import finalproject.dao.UserDAO;

public class UserDAOImpl implements UserDAO{
	public int queryByAdminname(User user) throws Exception {
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from users where username=?";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
        
       
        // ������������ݿ�ľ������   
        try{   
            // �������ݿ�   
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ; 
            pstmt.setString(1,user.getUsername()) ;     
            // �������ݿ��ѯ����   
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){   
                // ��ѯ�����ݣ�֮�󽫲�ѯ�������ݸ�ֵ��person����   
                if(rs.getString("password").equals(user.getPassword())){
                	user.setClassid(rs.getString("classid"));
                	flag = 1;
                } 
            }   
            rs.close() ; 
            pstmt.close() ;   
        }catch (SQLException e){   
            System.out.println(e.getMessage());   
        }finally{   
            // �ر����ݿ�����   
            dbc.close() ;   
        }   
		return flag;
	}
}
