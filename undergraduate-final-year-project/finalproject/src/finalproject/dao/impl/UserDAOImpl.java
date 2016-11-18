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
        
       
        // 下面是针对数据库的具体操作   
        try{   
            // 连接数据库   
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ; 
            pstmt.setString(1,user.getUsername()) ;     
            // 进行数据库查询操作   
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){   
                // 查询出内容，之后将查询出的内容赋值给person对象   
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
            // 关闭数据库连接   
            dbc.close() ;   
        }   
		return flag;
	}
}
