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
						
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						String question=request.getParameter("question").toString();
						
						
						String sql="select * from comment where qbid in(select qbid from qboard where question='"+question+"')order by time desc;";
						ResultSet rs0=MyBean.executeQuery(sql);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b>"+question+"</b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>comment</b></td>");
    out.println("<td><b>username</b></td>");
    out.println("<td><b>time</b></td>");
    //out.println("<td><b>reply</b></td>");
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs0.getString(3)+"</td>");
								 out.println("<td>"+rs0.getString(1)+"</td>");
								 out.println("<td>"+rs0.getString(2)+"</td>");
								//out.println("<td><form name=\"reply\" method=\"post\" action=\"./replyquestion.jsp\"><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseid\" value='"+rs0.getString(5)+"'/><input type=\"hidden\" name=\"question\" value='"+rs0.getString(3)+"'/><input type=\"submit\" name=\"submit\" value=\"Enter\" /></form></td>");
    	
	}
	out.println("</table>");
	rs0.close();
						
						out.println("<h2><font color=\"#000000\">Please put your reply here</h2></font>");
						//out.println(question);
						//out.println("<b><font color=\"#000000\">you can change the size of 'answer area' by dragging bottom right</font></b>");
						
						%> 
						<form name="reply" method="post" action="./replyq2.jsp" >
   						<textarea name="textarea" class=editable onkeydown ="if(event.keyCode==13) return false; " oninput="this.style.height=0px;this.style.height=(this.scrollHeight+px);" onpropertychange="this.style.height=(this.scrollHeight+px)" /></textarea>
   						<input type="submit" name="repquestion" value="submit answer"/>
   						
   						<% out.println("<input type=\"hidden\" name=\"question\" value='"+question+"'/>");%>
   						<% out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>");%>
   						<% out.println("<input type=\"hidden\" name=\"username\" value='"+username+"'/>");%>
   						
   						</form>					
<br>
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
