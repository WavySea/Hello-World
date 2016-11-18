<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>

<%@ page import="java.text.*"%>

<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>reply question</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
    <%String username=request.getParameter("username").toString();//student's name 
						String answer=request.getParameter("textarea").toString();
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						String question=request.getParameter("question").toString();
						
						//out.println(question);
						//out.println(courseid);
						
						out.println("<h2><font color=\"#000000\">You have submitted the reply successfully</h2></font>");
						//out.println("<b><font color=\"#000000\">you can change the size of 'answer area' by dragging bottom right</font></b>");
						String sql="update qboard a set answer='"+answer+"' where coursenum='"+courseid+"' and question='"+question+"'";
						MyBean.executeUpdate(sql);
						String sql1="select answer from qboard where answer='"+answer+"'; ";
						ResultSet rs0=MyBean.executeQuery(sql1);
						if(rs0.next()){
						session.setAttribute("username",username);
						  session.setAttribute("courseid",courseid); 
						  // session.setAttribute("classid",classid);
						 %><a href="studentQuestion.jsp"></a>
						<%}	
						rs0.close();
						%> <br>
</div>
	<div class="footer">
						<ul>
							<li class="first"><a href="studentMenu.jsp?courseID=<%=courseid %>username=<%=username %>">Main Menu</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="register.html">Register</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
  </body>
</html>
