package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import finalproject.vo.Course;
import finalproject.vo.User;

public class ViewQuestion extends HttpServlet {
	int flag = 0;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
			}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		User user = new User();
		Course course=new Course();
		user.setUsername(req.getParameter("username"));
		String teachername= req.getParameter("username");
		ArrayList recordCid = new ArrayList();
		ArrayList recordUsername = new ArrayList();
		ArrayList recordQuestion = new ArrayList();
		ArrayList recordTime = new ArrayList();
		//String username=session.getAttribute("username").toString();
		//user.setUsername(username);
		System.out.println(user.getUsername());
		
		try {
			//连接数据库
			Connection con;
			String DBDRIVER = "com.mysql.jdbc.Driver";
			String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
			String DBUSER = "root";
			String DBPASSWORD = "";
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql = "select coursenum, username, question,time from qboard where qboard.coursenum IN (select courseid from course where course.class IN (select classid from users where username=?)) order by time;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			
			ResultSet rs = pstmt.executeQuery();
			  while(rs.next()){   
	                  // 查询出内容，之后将查询出的内容赋值给person对象   
	                  
	                	 recordCid.add(rs.getString("qboard.coursenum"));
	                	 recordUsername.add(rs.getString("qboard.username"));
	                	 recordQuestion.add(rs.getString("qboard.question"));
	                	 recordTime.add(rs.getString("qboard.time"));
	                	 //movie.setTitle(rs.getString("movie.Title"));
	                	 //meb.setMembername(rs.getString("member.MemberName"));
	                	 
	                  
	              }  
	          rs.close() ;
			pstmt.close();
			con.close();
			
			flag=1;
			
			HttpSession session=req.getSession();   
			session.setAttribute("username", teachername);  
			session.setAttribute("recordCid",recordCid);
			session.setAttribute("recordUsername",recordUsername);
			session.setAttribute("recordQuestion",recordQuestion);
			session.setAttribute("recordTime",recordTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (flag == 1) {
			res.sendRedirect("./studentQuestion.jsp");
		}
		else{
			res.sendRedirect("./error.jsp"); 
		}
  
}
}
