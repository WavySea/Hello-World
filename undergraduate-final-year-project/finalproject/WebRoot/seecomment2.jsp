<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %><%@ page import="java.text.*"%>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>comment</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
<body>
   <div class="background">
			<div id="bg">&nbsp;background</div>
			<div class="page">
				
				</div>
				<div class="body">
					<div class="content">
					
						
							<div>
								<h2><font color="#000000">Student's Questions</font></h2>
   </div>
   <%String username = (String)session.getAttribute("username");
 	String courseid= (String)session.getAttribute("courseid"); 
 	String classid=(String)session.getAttribute("classid");
 	String qbid=(String)session.getAttribute("qbid");
 	String question=(String)session.getAttribute("question");
 	session.setAttribute("qbid",qbid);
 	session.setAttribute("question",question);
 	session.setAttribute("username",username);
 	request.setAttribute("courseid",courseid);
 	session.setAttribute("classid",classid);
 	String sql="select * from comment where qbid='"+qbid+"'order by time desc;";
	ResultSet rs0=MyBean.executeQuery(sql);
 	
 	//out.println("username:"+username);
 	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>comment</b></td>");
    out.println("<td><b>username</b></td>");
    out.println("<td><b>time</b></td>");
    
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
    							 
								 out.println("<td>"+rs0.getString(3)+"</td>");
								 out.println("<td>"+rs0.getString(1)+"</td>");
								 out.println("<td>"+rs0.getString(2)+"</td>");
								
	}
	out.println("</table>");
	rs0.close();
 	
 	
 	
 	%>
 	<form method="post" action="./comment">
 	<input type=text name=comment/>
 	<%out.println("<input type=hidden name=qbid value='"+qbid+"'/> ");
 	out.println("<input type=hidden name=question value='"+question+"'/> ");
 	out.println("<input type=hidden name=username value='"+username+"'/> ");
 	out.println("<input type=hidden name=classid value='"+classid+"'/> ");
 	out.println("<input type=hidden name=courseid value='"+courseid+"'/> ");%>
 	<input type=submit name=submit value="submit my comment"/></form>

								</div>
							
						</div>
					</div>
								
					
					
					<div class="footer">
						<ul>
						
							<li class="first"><a href="studentMenu.jsp?courseID=<%=courseid %>">main menu</a></li>
							<li><a href="welcomestudent.jsp">logout Course</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
		
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
