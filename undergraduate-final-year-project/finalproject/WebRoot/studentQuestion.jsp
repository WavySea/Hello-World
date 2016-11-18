<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>student question</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
<body>
 <div class="background">
			<div id="bg">background</div>
			
				<div class="body">
					
							<div>
								<h2><font color="#000000">Student's Questions</font></h2>
					<div class="username-text">
			<table border="2" cellspacing="2" cellpadding="2" >  
 <%String username = (String)session.getAttribute("username");
 	String courseID= (String)session.getAttribute("courseID"); 
 
	String sql="select * from qboard where coursenum='"+courseID+"'order by time desc;";
	ResultSet rs0=MyBean.executeQuery(sql);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>question</b></td>");
    out.println("<td><b>username</b></td>");
    out.println("<td><b>time</b></td>");
    out.println("<td><b>reply</b></td>");
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs0.getString(3)+"</td>");
								 out.println("<td>"+rs0.getString(2)+"</td>");
								 out.println("<td>"+rs0.getString(4)+"</td>");
								out.println("<td><form name=\"reply\" method=\"post\" action=\"./replyquestion.jsp\"><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseid\" value='"+rs0.getString(5)+"'/><input type=\"hidden\" name=\"question\" value='"+rs0.getString(3)+"'/><input type=\"submit\" name=\"submit\" value=\"Enter\" /></form></td>");
    	
	}
	out.println("</table>");
	rs0.close();
%>							

</table></div></div>

						
					
					<div class="footer">
						<ul>
							<li class="first"><a href="studentMenu.jsp?courseID=<%=courseID %>username=<%=username %>">Main Menu</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="register.html">Register</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				</div>
			</div>
		
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
