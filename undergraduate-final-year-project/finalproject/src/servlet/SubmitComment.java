package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import finalproject.vo.User;


public class SubmitComment extends HttpServlet {
	int flag = 0;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
			}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		HttpSession session=req.getSession(); 
	User user = new User();
	user.setUsername(req.getParameter("username").toString());
	user.setClassid(req.getParameter("classid").toString());
	String comment=req.getParameter("comment").toString();
	String qbid=req.getParameter("qbid").toString();
	String courseid=req.getParameter("courseid").toString();
	//System.out.println(req.getParameter("username1").toString());
	String question=req.getParameter("question").toString();
	
	try {
		//连接数据库
		Connection con;
		String DBDRIVER = "com.mysql.jdbc.Driver";
		String DBURL = "jdbc:mysql://127.0.0.1:3306/finalproject";
		String DBUSER = "root";
		String DBPASSWORD = "";
		Class.forName(DBDRIVER);
		con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		String sql = "insert into comment (username,time,comment,qbid) values(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		String tsStr="";
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		tsStr = sdf.format(ts);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, tsStr);
		pstmt.setString(3, comment);
		pstmt.setString(4, qbid);
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		flag=1;
		  
		//req.setAttribute("username",user.getUsername());
		session.setAttribute("username", user.getUsername()); 
		System.out.println(user.getUsername());
		session.setAttribute("qbid", qbid);
		session.setAttribute("courseid", courseid);  
		session.setAttribute("classid", user.getClassid());
		session.setAttribute("question", question);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if (flag == 1) {
		res.sendRedirect("./seecomment2.jsp");
	}
	else{
		res.sendRedirect("./error.jsp"); 
	}

}
}
