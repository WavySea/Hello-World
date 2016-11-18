<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>student menu</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
			<div id="bg">&nbsp; background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li><a href="index.html">HOME</a></li>
						<li><a href="about.html">ABOUT</a></li>
						<li class="selected"><a href="studentlogin.html">LOGIN</a></li>
						
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>				</div>
				<div class="body">
					<div class="content">
					<%String username = (String)session.getAttribute("username");
  							String courseid = (String)request.getParameter("courseID");
  							String classid = (String)session.getAttribute("classid");
  					//out.println(classid);
  					 String level="";
   String sql0="select rank.level from rank where CourseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"')";
   ResultSet rs0=MyBean.executeQuery(sql0);
    while(rs0.next()){
   level=rs0.getString("level");
   }
   rs0.close();
   out.println("<b>Your level now is "+level+". </b><br>");%>
					<h2><font color="#000000">Hello, <%=username %>, you are in course <%=courseid %>,You Want...</font></h2>
						 <%session.setAttribute(username, "username"); 
   						   session.setAttribute(classid, "classid"); 
   						  //request.setAttribute(courseid, "courseid");
   						  System.out.println("courseid in studentMenu is"+courseid);
   						   %>		
						
   						<form name="MCQ" method="post" action="./chooseMCQtopic.jsp" >
   						  <%out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>"); %>
   						   <input type="submit" name="MCQ" value="online MCQ"/>
   						</form>
   						
   						<form name="mockexam" method="post" action="./choosenumber.jsp" >
   						 <%out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>"); %>
   						<input type="submit" name="mockexam" value="mock exam"/>
   						
   						
   						</form>
   						
   						<form name="questionboard" method="post" action="./questionboard.jsp" >
   						 <%out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>"); %>
   						<input type="submit" name="qboard" value="question board"/>
   						
   						
   						</form>
   						
					</div>
					<div class="footer">
						<ul>
							<li class="first"><a href="index.html">logout Course</a></li>
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
