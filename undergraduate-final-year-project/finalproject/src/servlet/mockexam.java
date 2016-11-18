package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import finalproject.vo.Course;
import finalproject.vo.Item;
import finalproject.vo.User;

public class mockexam extends HttpServlet {

	int flag = 0;
	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException{
	 }
	
	 public void doPost(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException{
		 User user= new User();
		 Item item= new Item();
		 Course course=new Course();
		 user.setUsername(req.getParameter("username"));
		 course.setCourseID(req.getParameter("courseid"));
		 try {
				//连接数据库
				
				
				Connection con;
				String DBDRIVER = "com.mysql.jdbc.Driver";
				String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
				String DBUSER = "root";
				String DBPASSWORD = "";
				Class.forName(DBDRIVER);
				con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
				String sql = "select accumulatedscore from rank where CourseId='"+course.getCourseID()+"' and idnumber IN(select idnumber from users where username='"+user.getUsername()+"');";
				System.out.println(sql);
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user.getUsername());
					
					//pstmt.setInt(1, search2);
					//pstmt.setInt(2, search2);
					ResultSet rs =pstmt.executeQuery(sql);
					  while(rs.next()){   
			                  // 查询出内容，之后将查询出的内容赋值给person对象   
						  item.setAccumulatedscore(rs.getInt("accumulatedscore"));
							  
						  }
			                  	
					  
			          rs.close() ; 
		          con.close();
		        
		          HttpSession session=req.getSession();
				  session.setAttribute("username",req.getParameter("username"));
				  session.setAttribute("courseid",req.getParameter("courseid"));
				  session.setAttribute("classid",req.getParameter("classid"));
				  session.setAttribute("accumulatedscore", item.getAccumulatedscore());
				  flag=1;
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			
			if (flag == 1) {
				
				res.sendRedirect("./choosenumber.jsp");
				
				
			}
			else{
				res.sendRedirect("./error.jsp"); 
			}

		 
	 }
}
