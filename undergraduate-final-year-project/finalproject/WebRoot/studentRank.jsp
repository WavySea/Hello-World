<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %><%@ page import="java.text.*"%>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>student rank</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
<body>
 <div class="background">
			
							<div>
								<h2><font color="#000000">Student's Ranks</font></h2>
					<div class="username-text">
			
 <%String username = (String)session.getAttribute("username");%> 
 <%String courseid= (String)session.getAttribute("courseID");
 session.setAttribute("username",username);
  	session.setAttribute("courseid",courseid);
 String sql = "select * from rank where CourseId='"+courseid+"' order by accumulatedscore desc limit 20;";
 ResultSet rs0=MyBean.executeQuery(sql);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>idnumber</b></td>");
    out.println("<td><b>accumulatedscore</b></td>");
    
    
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs0.getString(1)+"</td>");
								 out.println("<td>"+rs0.getString(2)+"</td>");
								
								
	}
	out.println("</table>");
	rs0.close();
%>	


								</div>
							
						</div>
					</div>
					<div class="footer">
						<ul>
						
							<li class="first"><a href="teacherMenu.jsp">main menu</a></li>
							<li><a href="welcometeacher.jsp">logout Course</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				</div>
			</div>
		</div>
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
