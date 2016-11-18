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

public class ViewRank extends HttpServlet {
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
		ArrayList recordID = new ArrayList();
		ArrayList recordScore = new ArrayList();
		ArrayList recordLevel = new ArrayList();
		//String username=session.getAttribute("username").toString();
		//user.setUsername(username);
		System.out.println(user.getUsername());
		
		try {
			//�������ݿ�
			Connection con;
			String DBDRIVER = "com.mysql.jdbc.Driver";
			String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
			String DBUSER = "root";
			String DBPASSWORD = "";
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql = "select idnumber, accumulatedscore, level from rank order by accumulatedscore desc limit 20;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, user.getUsername());
			
			ResultSet rs = pstmt.executeQuery();
			  while(rs.next()){   
	                  // ��ѯ�����ݣ�֮�󽫲�ѯ�������ݸ�ֵ��person����   
	                  
	                	 recordID.add(rs.getString("rank.idnumber"));
	                	 recordScore.add(rs.getString("rank.accumulatedscore"));   
	                	 recordLevel.add(rs.getString("rank.level"));
	                  
	              }  
	          rs.close() ;
			pstmt.close();
			con.close();
			
			flag=1;
			
			HttpSession session=req.getSession();   
			session.setAttribute("username", teachername);  
			session.setAttribute("recordID",recordID);
			session.setAttribute("recordScore",recordScore);
			session.setAttribute("recordLevel",recordLevel);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (flag == 1) {
			res.sendRedirect("./studentRank.jsp");
		}
		else{
			res.sendRedirect("./error.jsp"); 
		}
  
}
}
