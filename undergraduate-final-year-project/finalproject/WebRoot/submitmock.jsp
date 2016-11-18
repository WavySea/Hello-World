<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>exam result</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
    <%String username=request.getParameter("username").toString();//student's name 
						String classid=request.getParameter("classid").toString();//student's class 
						String courseid=request.getParameter("courseid").toString();//student's courseID
						String time=request.getParameter("timestamp").toString();//student's submit time 
						String answer=request.getParameter("textarea").toString();//student's answer 
						String ascore=request.getParameter("ascore").toString();
						int score= Integer.parseInt(ascore);//student's accumulatedscore
						String question=session.getAttribute("question").toString();
						//out.println(number);
						
						//store the answer into the database
						
						String c2="waiting";
						
						String c5=null;
						
						//String s= ""+question+"+",+username+""+","+""+c2+""+""+time+""+""+answer+c5+courseid;
						String sql0="insert into mockstore (question,username,status,time,answer,examiner,courseId) values(\""+question+"\",\""+username+"\",\""+c2+"\",\""+time+"\",\""+answer+"\",null,\""+courseid+"\");";
						MyBean.executeUpdate(sql0);
						//out.println(sql0);
						out.println("<h2><font color=\"#000000\">Congratulations "+username+", you have submit the answer successfully! Your accumulated score is "+score+"</h2></font>");
						
						out.println("<b><font color=\"#000000\">Status of your answers:</font></b>");
						//read the accepted answers
						String sql1="SELECT * FROM mockstore where courseId='"+courseid+"' and username='"+username+"'order by time desc ;";
						//out.println(sql1);
						ResultSet rs1=MyBean.executeQuery(sql1);
						
						out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    							 out.println("<tr>");
    							 out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    							 out.println("</tr>");
    							 out.println("<tr>");
    							 out.println("<td><b>number</b></td>");
    							 out.println("<td><b>question</b></td>");
    							 out.println("<td><b>your answer</b></td>");
    							 out.println("<td><b>submit time</b></td>");
    							 out.println("<td><b>status</b></td>");
    							 out.println("<td><b>who is the examiner</b></td>");
								 out.println("</tr>");
							int i=0;
							while(rs1.next()){
							
							
								 
								 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs1.getString(1)+"</td>");
								 out.println("<td>"+rs1.getString(5)+"</td>");
								 out.println("<td>"+rs1.getString(4)+"</td>");
								 out.println("<td>"+rs1.getString(3)+"</td>");
								
								 if(rs1.getString(6)==null){
								 out.println("<td>no one has mark your answer</td>");
								 }else{
								 out.println("<td>"+rs1.getString(6)+"</td>");
								 }
									out.println("</tr>");
							
						}
						rs1.close();
						
						%> <br>
						
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
  </body>
</html>
