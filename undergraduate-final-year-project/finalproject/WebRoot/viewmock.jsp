<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %><%@ page import="java.text.*"%>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>edit question</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
  
  <body>
    <%String username = (String)session.getAttribute("username");%>
  <%String courseid = (String)session.getAttribute("courseID");
  session.setAttribute(username,"username");
  session.setAttribute(courseid,"courseid");
  %>
  <br/><b>students' answers of mock exam:</b><br/>
  <% 
  String sqleasy="SELECT * FROM mockstore where courseId='"+courseid+"'order by time asc;";
  ResultSet rs0=MyBean.executeQuery(sqleasy);
  out.println("<table border=\"2\" cellspacing=\"2\" cellpadding=\"2\" > ");
    						out.println("<tr>");
    						out.println("<th>username</th>");
    						out.println("<th>question</th>");
    						out.println("<th>answer</th>");
    						out.println("<th>time</th>");
    						out.println("<th>decision</th>");
    						out.println("<th>change the decision</th>");
    						out.println("</tr>");
						 while(rs0.next()){
						 	
    						
    						out.println("<tr>");
    						out.println("<td>"+rs0.getString(2)+"</td>");
    						out.println("<td>"+rs0.getString(1)+"</td>");
    						out.println("<td>"+rs0.getString(5)+"</td>");
    						out.println("<td>"+rs0.getString(4)+"</td>");
    						out.println("<td>"+rs0.getString(3)+"</td>");
    						out.println("<td><form name=\"choose\" method=\"post\" action=\"./submitexaminer2.jsp\"><input type=\"radio\" id=\"accept\" name=\"status\" value=\"accept\">accept<input type=\"radio\" id=\"reject\" name=\"status\" value=\"reject\">reject");
    						out.println("<input type=\"hidden\" name=\"position\" value=\"teacher\"/><input type=\"hidden\" name=\"time\" value='"+rs0.getString(4)+"'/><input type=\"submit\" name=\"submit\" value=\"submit\" /></form></td>");
    						//out.println(rs1.getString(1));
    						out.println("</tr>");
    						
						 }
						 out.println("</table>");
						 rs0.close();
  %>
  
  
  </body>
</html>
