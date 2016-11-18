package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import finalproject.vo.User;

public class RegisterServlet extends HttpServlet {
	
	int flag = 0;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
			}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		User user = new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setID(req.getParameter("idnumber"));
		user.setSex(req.getParameter("sex"));
		user.setPosition(req.getParameter("position"));
		user.setClassid(req.getParameter("classid"));
		
		try {
			//连接数据库
			Connection con;
			String DBDRIVER = "com.mysql.jdbc.Driver";
			String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
			String DBUSER = "root";
			String DBPASSWORD = "";
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql = "insert into users (position,username,password,idnumber,classid,sex) values(?,?,?,?,?,?)";//在数据库中插入用户账户
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getPosition());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			if (user.getPosition()=="teacher"){
				pstmt.setString(4, null);	
			}else {
				pstmt.setString(4,user.getID());
			}
			
			
			pstmt.setString(5, user.getClassid());
			pstmt.setString(6, user.getSex());
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
			if(user.getPosition()=="teacher"){
			   flag=2;	
			}else{
				flag=3;
			}
			
			HttpSession session=req.getSession();   
			session.setAttribute("username", user.getUsername());  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (flag == 2) {
			res.sendRedirect("./teacherMenu.html");
		}else if(flag==3){
			res.sendRedirect("./studentMenu.html");
		}
		else{
			res.sendRedirect("./error.jsp"); 
		}
  
}
}
