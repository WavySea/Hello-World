<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
			<div id="bg">ge&nbsp; background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li><a href="index.html">HOME</a></li>
						<li><a href="about.html">ABOUT</a></li>
						<li class="selected"><a href="welcome.html">LOGIN</a></li>
						
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>				</div>
				<div class="body">
					<div class="content">
					<h2><font color="#000000">Course List</font></h2>
								
						<%String username=session.getAttribute("username").toString();//teacher's name 
 
    //execute query and output result
   
    String sql="SELECT * FROM course where teacher='"+username+"'"; 
    //out.println(sql);
    ResultSet rs1=MyBean.executeQuery(sql);
    while(rs1.next()){
    	out.println("<table border=\"2\" cellspacing=\"2\" cellpadding=\"2\" > ");
    	out.println("<tr>");
    	out.println("<th>Course ID</th>");
    	out.println("<th>Course Name</th>");
    	out.println("<th>    </th>");
    	out.println("<th>    </th>");
    	out.println("</tr>");
    	out.println("<tr>");
    	out.println("<td>"+rs1.getString(1)+"</td>");
    	out.println("<td>"+rs1.getString(2)+"</td>");
    	out.println("<td><form name=\"choose\" method=\"post\" action=\"./teacherMenu.jsp\"><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseID\" value='"+rs1.getString(1)+"'/><input type=\"submit\" name=\"submit\" value=\"Enter\" /></form></td>");
    	out.println("<td><form name=\"choose\" method=\"post\" action=\"./deleteCourse.jsp\"><input type=\"hidden\" name=\"classid\" value='"+rs1.getString(3)+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseid\" value='"+rs1.getString(1)+"'/><input type=\"submit\" name=\"submit\" value=\"Delete\" /></form></td>");
    	
    	//out.println(rs1.getString(1));
    	out.println("</tr>");
    	out.println("</table>");
    }
    rs1.close();
  %>
					</div>
					<hr/>
					<b>Add A Course:</b><br/>
					<form name="addCourse" method="post" action="./addCourse" >
   						Course ID: <input type="text" name="courseid" /><br/>
   						Course Name: <input type="text" name="coursename" /><br/>
   						class: <input type="text" name="class" /><br/>
   						<% out.println("<input type=\"hidden\" name=\"teachername\" value='"+username+"' />");%>
   						<input type="submit" name="addCourse" value="add a course"/>
   						
   						
   						
   						
   						</form>
					
					<div class="footer">
						<ul>
							<li class="first"><a href="index.html">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="register.html">Register</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				</div>
			</div>
		</div>
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
