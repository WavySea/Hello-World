<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>student register</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>		
 
</head>
<body>
 <div class="background">
			<div id="bg">background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li><a href="teacherMenu.html">Main Menu</a></li>
						<li class="selected"><a href="studentQuestion.jsp"">Student's Questions</a>
						
					   
						</li>
						<li><a href="studentRank.jsp">Ranks</a></li>
						
						<li><a href="adItem.jsp">Add/Delete item</a></li>
												
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>				</div>
				<div class="body">
					
						
							<div>
								<h2><font color="#000000">Student's Questions</font></h2>
					
			
 <%String username = (String)request.getParameter("username");
 	String courseid= (String)request.getParameter("courseid"); 
 	String classid=(String)request.getParameter("courseid");
 	String time=(String)request.getParameter("time");
 	String question=(String)request.getParameter("question");
 
	String sql="insert into qboard (qbid,,username,question,time,coursenum,answer) values(?,\""+username+"\",\""+question+"\",\""+time+"\",\""+courseid+"\",null);";
	MyBean.executeUpdate(sql);
	
	String sql1="select * from qboard where username='"+username+"' order by time desc";
	ResultSet rs1=MyBean.executeQuery(sql1);
		out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>question</b></td>");
    out.println("<td><b>time</b></td>");
    out.println("<td><b>answer</b></td>");
	out.println("</tr>");
	int i=0;
		while(rs1.next()){
								 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs1.getString(3)+"</td>");
								 out.println("<td>"+rs1.getString(4)+"</td>");
								 if(rs1.getString(6)==null){
								 out.println("<td>no answer</td>");
								 }else{
								 out.println("<td>"+rs1.getString(6)+"</td>");}
								 out.println("</tr>");
		}
	  out.println("</table>");
%>		


</div>

								</div>
							
						</div>
					</div>
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
		
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
