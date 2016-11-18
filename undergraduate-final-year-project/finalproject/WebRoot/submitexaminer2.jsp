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
   					  <%String position=request.getParameter("position").toString();//student's name  
						String username=session.getAttribute("username").toString();String courseid=session.getAttribute("courseid").toString(); 
						String time=request.getParameter("time").toString();//student's level  
						String decision=request.getParameter("status").toString(); 
						 
						out.println("Hello, "+username+", you have submitted the decision"); 
						String sql0="update rank a set status='"+decision+"' and examiner='"+position+"' where time='"+time+"'"; 
						MyBean.executeUpdate(sql0); 
						 
						 
					 
						%>
						</div>
						<div class="footer">
						<ul>
						<%session.setAttribute("username",username);
						  session.setAttribute("courseid",courseid); 
						   //session.setAttribute("classid",classid);
						   %>
							<li class="first"><a href="teacherMenu.jsp?username=<%=username %>courseid=<%=courseid %>">main menu</a></li>
							<li><a href="welcometeacher.jsp?username=<%=username %>courseid=<%=courseid %>">logout Course</a></li>
							
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
						
  </body>
</html>
