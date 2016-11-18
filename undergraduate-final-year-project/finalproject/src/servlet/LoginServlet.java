package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import finalproject.dao.UserDAO;
import finalproject.dao.impl.UserDAOImpl;
import finalproject.vo.User;

public class LoginServlet extends HttpServlet {
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException{
	 }
	
	 public void doPost(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException{
		 	User user = new User();
		 	
		 	user.setUsername(req.getParameter("username"));
		 	user.setPassword(req.getParameter("password"));
		 	user.setClassid(req.getParameter("classid"));
		    System.out.print(user.getClassid());
		 	//�ȶ�������Ƿ���ѧ��
		 	if(req.getParameter("position").equals("student")){
		 		UserDAO dao = new UserDAOImpl();   
		 		int flag = 0;
		 		try {
		 			flag = dao.queryByAdminname(user);
		 			
		 		} catch (Exception e) {
				// TODO Auto-generated catch block
		 			e.printStackTrace();
				} 
		 		//�ȶԺ���ת���û�����
		 		if(flag == 1){   
		 			HttpSession session=req.getSession();   
		 			session.setAttribute("username", user.getUsername()); 
		 			session.setAttribute("classid", user.getClassid());
		 			res.sendRedirect("./welcomestudent.jsp");
		 		} else {   
		 			res.sendRedirect("./error.jsp");
		 		}
		 }
		 	//�ȶ�������Ƿ�����ʦ
		 	if(req.getParameter("position").equals("teacher")){
		 		UserDAO dao = new UserDAOImpl();   
		 		int flag = 0;
		 		try {
		 			flag = dao.queryByAdminname(user);
		 		} catch (Exception e) {
				// TODO Auto-generated catch block
		 			e.printStackTrace();
				} 
		 		//�ȶԺ���ת���û�����
		 		if(flag == 1){   
		 			HttpSession session=req.getSession();   
		 			session.setAttribute("username", user.getUsername());   
		 			res.sendRedirect("./welcometeacher.jsp");
		 		} else {   
		 			res.sendRedirect("./error.jsp");
		 		}
		 	}
		 
		 
	 }
}
