<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>choose topic</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
			<%			String username=session.getAttribute("username").toString();//student's name 
						String classid=session.getAttribute("classid").toString();//student's class 
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						//System.out.println("choosetopic courseid:"+courseid);
						%>
					<h2><font color="#000000">hello <%=username %>,you can start a test randomly, or you can choose a topic you like...</font></h2>
								
						<form name="randomtest" method="post" action="./onlineMCQ.jsp" >
						<% out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>");%>
   						
   						<% out.println("<input type=\"hidden\" name=\"topic\" value=\"\"/>");%>
						<input type="submit" name="randomtest" value="start a test with random questions"/>
						</form>
						<form name="topictest" method="post" action="./onlineMCQ.jsp" >
						<% out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>");%>
   						
   						
						
						<% out.println("<select id=\"topic\" name=\"topic\">"); 
						String sql="SELECT DISTINCT topic FROM qexam where courseid='"+courseid+"';"; 
						System.out.println(sql);
						 ResultSet rs=MyBean.executeQuery(sql);
     						while(rs.next()){
     						String topic = rs.getString("topic");
							out.println("<option value='"+topic+"'>"+topic+"</option>");
							}
							 rs.close();
							 out.println("</select>");
   						session.setAttribute(classid,"classid");
						session.setAttribute(username,"username"); %>
   						
   						<input type="submit" name="topictest" value="online MCQ"/>
   						</form>
					</div>
					<div class="footer">
						<ul>
							<li class="first"><a href="studentMenu.jsp">main menu</a></li>
							<li><a href="welcomestudent.jsp">logout Course</a></li>
							<li><a href="chooseMCQtopic.jsp">choose another topic</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
