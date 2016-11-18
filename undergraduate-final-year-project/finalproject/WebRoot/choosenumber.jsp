<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>please choose a number</title>
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
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						String ascore="";
						String sql0 = "select accumulatedscore from rank where CourseId='"+courseid+"' and idnumber IN(select idnumber from users where username='"+username+"');";
						ResultSet rs0=MyBean.executeQuery(sql0);
						while(rs0.next()){
						ascore= rs0.getString("accumulatedscore");
						}
						
						//String ascore=session.getAttribute("accumulatedscore").toString();
						int score= Integer.parseInt(ascore);//student's accumulatedscore
						
						if(score<200){
						out.println("<h2><font color=\"#000000\">Sorry, your accumulated score is too low to start the mock exam.Please do more MCQ test first.</font></h2>");
						out.println("<a href=\"studentMenu.jsp\">main Menu</a>");
						}else{
						out.println("<h2><font color=\"#000000\">Please choose a question...</h2></font>");
						String sql="SELECT * FROM mockexam where courseid= '"+courseid+"' AND mockexam.level =(select rank.level from rank where CourseId='"+courseid+"' AND rank.idnumber IN(select users.idnumber from users where users.username='"+username+"'));";  								
						
						ResultSet rs1=MyBean.executeQuery(sql);
						int i=0;
						int j=0;
							while(rs1.next()){
								j=j+1;
								session.setAttribute("username",username);
								session.setAttribute("courseid",courseid);
								session.setAttribute("classid",classid);
								session.setAttribute("score",score);
								i=rs1.getInt("Id");
								session.setAttribute("i",i);
								out.println("<a href=\"mockexam.jsp\">Question "+j+" </a><br>");
								
								//out.println(rs1.getString("level"));
								
							}
						rs1.close();
						}
						
						%> <br>
</div>
  </body>
</html>
