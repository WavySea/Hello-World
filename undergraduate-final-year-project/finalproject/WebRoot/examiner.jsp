<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>examiner decision</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
   					  <%String username=session.getAttribute("username").toString();//student's name 
						String classid=session.getAttribute("classid").toString();//student's class 
						String courseid=session.getAttribute("courseid").toString();//student's courseID
						String level=session.getAttribute("level").toString();//student's level 
						
						out.println("Hello, "+username+", you are in level: "+level+"");
						String sql="";
						if(level.equals("medium")){
						sql="SELECT * FROM mockstore where status=\"waiting\" and question in (select question from mockexam where courseId='"+courseid+"' and level=\"easy\")  order by time asc limit 1;";
						 ResultSet rs0=MyBean.executeQuery(sql);
						 while(rs0.next()){
						 	out.println("<table border=\"2\" cellspacing=\"2\" cellpadding=\"2\" > ");
    						out.println("<tr>");
    						out.println("<th>question</th>");
    						out.println("<th>answer</th>");
    						out.println("<th>time</th>");
    						out.println("<th>decision</th>");
    						out.println("</tr>");
    						
    						out.println("<tr>");
    						out.println("<td>"+rs0.getString(1)+"</td>");
    						out.println("<td>"+rs0.getString(5)+"</td>");
    						out.println("<td>"+rs0.getString(4)+"</td>");
    						out.println("<td><form name=\"choose\" method=\"post\" action=\"./submitexaminer.jsp\"><input type=\"radio\" id=\"accept\" name=\"status\" value=\"accept\">accept<input type=\"radio\" id=\"reject\" name=\"status\" value=\"reject\">reject");
    						out.println("<input type=\"hidden\" name=\"question\" value='"+rs0.getString(1)+"'/><input type=\"hidden\" name=\"answer\" value='"+rs0.getString(5)+"'/><input type=\"hidden\" name=\"time\" value='"+rs0.getString(4)+"'/><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"level\" value='"+level+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseID\" value='"+courseid+"'/><input type=\"submit\" name=\"submit\" value=\"submit\" /></form></td>");
    						//out.println(rs1.getString(1));
    						out.println("</tr>");
    						out.println("</table>");
						 }
						}
						else{
						sql="SELECT * FROM mockstore where status=\"waiting\" and question in (select question from mockexam where courseId='"+courseid+"' and level=\"easy\" or level=\"medium\")  order by time asc limit 1;";
						 ResultSet rs0=MyBean.executeQuery(sql);
						 while(rs0.next()){
						 	out.println("<table border=\"2\" cellspacing=\"2\" cellpadding=\"2\" > ");
    						out.println("<tr>");
    						out.println("<th>question</th>");
    						out.println("<th>answer</th>");
    						out.println("<th>time</th>");
    						out.println("<th>decision</th>");
    						out.println("</tr>");
    						
    						out.println("<tr>");
    						out.println("<td>"+rs0.getString(1)+"</td>");
    						out.println("<td>"+rs0.getString(5)+"</td>");
    						out.println("<td>"+rs0.getString(4)+"</td>");
    						out.println("<td><form name=\"choose\" method=\"post\" action=\"./submitexaminer.jsp\"><input type=\"radio\" id=\"accept\" name=\"status\" value=\"accept\">accept</radio><input type=\"radio\" id=\"reject\" name=\"status\" value=\"reject\">reject</radio>");
    						out.println("<input type=\"hidden\" name=\"question\" value='"+rs0.getString(1)+"'/><input type=\"hidden\" name=\"answer\" value='"+rs0.getString(5)+"'/><input type=\"hidden\" name=\"time\" value='"+rs0.getString(4)+"'/><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"level\" value='"+level+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseID\" value='"+courseid+"'/><input type=\"submit\" name=\"submit\" value=\"Enter\" /></form></td>");
    						//out.println(rs1.getString(1));
    						out.println("</tr>");
    						out.println("</table>");
						 }
						}
						
						%>
						<div class="footer">
						<ul>
						<%session.setAttribute("username",username);
						  session.setAttribute("courseid",courseid); 
						   session.setAttribute("classid",classid);
						   %>
							<li class="first"><a href="studentMenu.jsp">main menu</a></li>
							<li><a href="welcomestudent.jsp">logout Course</a></li>
							<% String sql3="select level from rank where CourseId='"+courseid+"' and idnumber IN(select users.idnumber from users where users.username='"+username+"');";
							ResultSet rs3=MyBean.executeQuery(sql3);
								
								while(rs3.next()){
								
									if(rs3.getString("level").equals("easy")){
									out.println("<li>you have no right to be examiner</li>");
									}else{
									//out.println("you have no right to be examiner");
									//out.println(rs3.getString("level"));
									session.setAttribute("level",rs3.getString("level"));
									out.println("<li><a href=\"examiner.jsp\">see others' answers</a></li>");
									}
								}
							%>
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
						
  </body>
</html>
