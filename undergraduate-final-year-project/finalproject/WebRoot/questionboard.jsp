<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %><%@ page import="java.text.*"%>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>question board</title>
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
					
			
 <%String username = (String)session.getAttribute("username");
 	String courseid= (String)request.getParameter("courseid"); 
 	String classid=(String)session.getAttribute("classid");
 	System.out.println("qb"+username);
 	session.setAttribute("username",username);
 	
 	session.setAttribute("classid",classid);
 	
 
	String sql="select * from qboard where coursenum='"+courseid+"'order by time desc;";
	ResultSet rs0=MyBean.executeQuery(sql);
	//out.println(sql);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>question</b></td>");
    out.println("<td><b>username</b></td>");
    out.println("<td><b>time</b></td>");
    out.println("<td><b>     </b></td>");
    
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
    							 out.println("<td>"+rs0.getString(3)+"</td>");
    							 out.println("<td>"+rs0.getString(2)+"</td>");
								 out.println("<td>"+rs0.getString(4)+"</td>");
								out.println("<td><form name=\"choose\" method=\"post\" action=\"./seecomment.jsp\"><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"courseID\" value='"+courseid+"'/><input type=\"hidden\" name=\"question\" value='"+rs0.getString(3)+"'/><input type=\"hidden\" name=\"qbid\" value='"+rs0.getString(1)+"'/><input type=\"submit\" name=\"submit\" value=\"see comments\" /></form></td>");
    							
	}
	out.println("</table>");
	rs0.close();
%>		
<form name="raisequestion" method="post" action="./raisequestion.jsp" >
   						<input type="text" name="question" />
   						<input type="submit" name="question" value="submit question"/>
   						<%Timestamp ts = new Timestamp(System.currentTimeMillis()); 
								String tsStr;
								DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
								tsStr = sdf.format(ts);%>
   						<% out.println("<input type=\"hidden\" name=\"time\" value='"+tsStr+"'/>");%>
   						<% out.println("<input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/>");%>
   						<% out.println("<input type=\"hidden\" name=\"username\" value='"+username+"'/>");%>
   						
   						</form>					

</div>

								</div>
							
						</div>
					</div>
					
					
					<div class="footer">
						<ul>
						
							<li class="first"><a href="studentMenu.jsp?courseID=<%=courseid %>">main menu</a></li>
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
