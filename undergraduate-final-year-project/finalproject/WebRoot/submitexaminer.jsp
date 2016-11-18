<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>examiner</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
   					  <%String username=request.getParameter("username").toString();//student's name 
						String classid=request.getParameter("classid").toString();//student's class 
						String courseid=request.getParameter("courseID").toString();//student's courseID
						String level=request.getParameter("level").toString();//student's level 
						String time=request.getParameter("time").toString();//student's level 
						String decision=request.getParameter("status").toString();
						
						out.println("Hello, "+username+", you have submitted the decision");
						String sql0="update rank a set status='"+decision+"' and examiner='"+username+"' where time='"+time+"'";
						MyBean.executeUpdate(sql0);
						
						
					
						%>
						</div>
						<div class="footer">
						<ul>
						<%session.setAttribute("username",username);
						  //session.setAttribute("courseid",courseid); 
						   session.setAttribute("classid",classid);
						   %>
							<li class="first"><a href="studentMenu.jsp?courseID=<%=courseid %>">main menu</a></li>
							<li><a href="welcomestudent.jsp">logout Course</a></li>
							<% String sql3="select level from rank where CourseId='"+courseid+"' and idnumber IN(select users.idnumber from users where users.username='"+username+"');";
							ResultSet rs3=MyBean.executeQuery(sql3);
								
								while(rs3.next()){
								
									if(rs3.getString("level").equals("easy")){
									out.println("<li>you have no right to be examiner</li>");
									}else{
									//out.println("you have no right to be examiner");
									//out.println(rs3.getString("level"));
									session.setAttribute("level",rs3.getString("level"));
									out.println("<li><a href=\"examiner.jsp\">see others' answers</a></li>");
									}
								}
							%>
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
						
  </body>
</html>
