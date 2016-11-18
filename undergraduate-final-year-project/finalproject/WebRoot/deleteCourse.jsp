<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %><%@ page import="java.text.*"%>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>deleteCourse</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
<body>
 <div class="background">
			
							<div>
								<h2><font color="#000000">course list</font></h2>
					<div class="username-text">
			
 <%String username = (String)request.getParameter("username");%> 
 <%String courseid= (String)request.getParameter("courseid");
 session.setAttribute("username",username);
  	session.setAttribute("courseid",courseid);
 String sql="delete from course where courseid='"+courseid+"'";
 //out.println(sql);
 MyBean.executeUpdate(sql);
 String sql1="SELECT * FROM course where teacher='"+username+"'";
 ResultSet rs1=MyBean.executeQuery(sql1);
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
    	//out.println("<td><form name=\"choose\" method=\"post\" action=\"./deleteCourse.jsp\"><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseid\" value='"+rs1.getString(1)+"'/><input type=\"submit\" name=\"submit\" value=\"Delete\" /></form></td>");
    	
    	//out.println(rs1.getString(1));
    	out.println("</tr>");
    	out.println("</table>");
    }
    rs1.close();
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
