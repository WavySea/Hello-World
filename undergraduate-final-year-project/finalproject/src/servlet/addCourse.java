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

import finalproject.vo.Course;
import finalproject.vo.User;

public class addCourse extends HttpServlet {
	
	int flag = 0;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
			}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		User user = new User();
		user.setUsername(req.getParameter("teachername"));
		user.setClassid(req.getParameter("classid"));
		Course course=new Course();
		course.setCourseID(req.getParameter("courseid"));
		course.setCoursename(req.getParameter("coursename"));
		
		try {
			//连接数据库
			Connection con;
			String DBDRIVER = "com.mysql.jdbc.Driver";
			String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
			String DBUSER = "root";
			String DBPASSWORD = "";
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql = "insert into course (courseid,coursename,class,teacher) values(?,?,?,?,?,?)";//在数据库中插入用户账户
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(2, course.getCourseID());
			pstmt.setString(3, course.getCoursename());
			pstmt.setString(4, user.getClassid());
			pstmt.setString(5, user.getUsername());
			
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
			flag=1;
			
			HttpSession session=req.getSession();   
			session.setAttribute("username", user.getUsername());  
			//session.setAttribute("username", user.getUsername());  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (flag == 1) {
			res.sendRedirect("./welcometeacher.html");
		}
		else{
			res.sendRedirect("./error.jsp"); 
		}
  
}
}
