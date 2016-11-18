

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
  	
  %>
				<div class="body">
				
								<h2><font color="#000000">Add MCQ Question</font></h2>
					<div class="username-text">
			<form method="post" action="./finishedit.jsp" enctype="multipart/form-data"><font face="Berlin Sans FB"> 
    Course ID : <input type="text" name="courseid"><br>
    Topic : <input type="text" name="topic"><br>
   Question: <textarea name="textarea" class=editable onkeydown ="if(event.keyCode==13) return false; " oninput="this.style.height=0px;this.style.height=(this.scrollHeight+px);" onpropertychange="this.style.height=(this.scrollHeight+px)" /></textarea>
   					<br>
   	Option A: <input type="text" name="optiona"><br>
   	Option B: <input type="text" name="optionb"><br>
   	Option C: <input type="text" name="optionc"><br>
   	 Option D: <input type="text" name="optiond"><br>
    Answer : <input type="text" name="answer"><br>
    level : <select name="level">
    <option value="easy">easy</option>
        <option value="medium">medium</option>
        <option value="hard">hard</option>
        </select><br/>
    picture :<input type="file" name="picture"/><br>
   
    <br>
    <%out.println("<input type=\"hidden\" name=\"username\" value='"+username+"'><input type=\"hidden\" name=\"testtype\" value=\"addMCQ\"><input type=\"hidden\" name=\"courseid\" value='"+courseid+"'>"); %>
    <input type="submit" name="submit1" value="submit"><br><br>
    </form> <br><br></div></font>
			
			
			<div>
								<h2><font color="#000000"> Delete MCQ Question</font></h2>
					<div class="username-text">
			
 <%
 session.setAttribute("username",username);
  	session.setAttribute("courseid",courseid);
 String sql = "select * from qexam where courseid='"+courseid+"' ;";
 ResultSet rs0=MyBean.executeQuery(sql);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>topic</b></td>");
    out.println("<td><b>question</b></td>");
    out.println("<td><b>picture</b></td>");
    out.println("<td><b>option A</b></td>");
    out.println("<td><b>option B</b></td>");
    out.println("<td><b>option C</b></td>");
    out.println("<td><b>option D</b></td>");
    out.println("<td><b>answer</b></td>");
    out.println("<td><b>level</b></td>");
    out.println("<td><b>     </b></td>");
    
	out.println("</tr>");
	int i=0;
	while(rs0.next()){
		 						 out.println("<tr>");
								 i=i+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs0.getString(3)+"</td>");
								 out.println("<td>"+rs0.getString(4)+"</td>");
								 out.println("<td>"+rs0.getString(5)+"</td>");
								 out.println("<td>"+rs0.getString(7)+"</td>");
								 out.println("<td>"+rs0.getString(8)+"</td>");
								  out.println("<td>"+rs0.getString(9)+"</td>");
								 out.println("<td>"+rs0.getString(10)+"</td>");
								  out.println("<td>"+rs0.getString(11)+"</td>");
								   out.println("<td>"+rs0.getString(6)+"</td>");
								 out.println("<td><form name=\"choose\" method=\"post\" action=\"./finishedit.jsp\"><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"testtype\" value=\"deleteMCQ\"/><input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/><input type=\"hidden\" name=\"question\" value='"+rs0.getString(4)+"'/><input type=\"submit\" name=\"submit\" value=\"Delete\" /></form></td>");
    	
	}
	out.println("</table>");
	rs0.close();
%>			



<h2><font color="#000000">Add MockExam Question</font></h2>
					<div class="username-text">
			<form method="post" action="./finishedit.jsp" enctype="multipart/form-data"><font face="Berlin Sans FB"> 
    Course ID : <input type="text" name="courseid"><br>
   
   Question: <textarea name="textarea" class=editable onkeydown ="if(event.keyCode==13) return false; " oninput="this.style.height=0px;this.style.height=(this.scrollHeight+px);" onpropertychange="this.style.height=(this.scrollHeight+px)" /></textarea>
   					<br>
   	
    level : <select name="level">
    <option value="easy">easy</option>
        <option value="medium">medium</option>
        <option value="hard">hard</option>
        </select><br/>
    picture :<input type="file" name="picture"/><br>
   picture2 :<input type="file" name="picture2"/><br>
    <br>
    <input type="hidden" name="username" value='"+username+"'/><input type="hidden" name="testtype" value="addmock"/><input type="hidden" name="courseid" value='"+courseid+"'/>
    <input type="submit" name="submit1" value="submit"><br><br>
    </form> <br></font></p><br>
		
		
		
		
		<div>
								<h2><font color="#000000"> Delete MockExam Question</font></h2>
					<div class="username-text">
			 
 <%
 String sql2 = "select * from mockexam where courseid='"+courseid+"' ;";
 ResultSet rs2=MyBean.executeQuery(sql2);
	out.println("<table border=\"10\" cellspacing=\"2\" cellpadding=\"5\" > ");
    out.println("<tr>");
    out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td><b>number</b></td>");
    out.println("<td><b>question</b></td>");
    out.println("<td><b>picture</b></td>");
    out.println("<td><b>picture2</b></td>");
    out.println("<td><b>level</b></td>");
    
	out.println("</tr>");
	int j=0;
	while(rs2.next()){
		 						 out.println("<tr>");
								 j=j+1;
    							 out.println("<td>"+i+"</td>");
								 out.println("<td>"+rs2.getString(3)+"</td>");
								 out.println("<td>"+rs2.getString(4)+"</td>");
								 out.println("<td>"+rs2.getString(5)+"</td>");
								 out.println("<td>"+rs2.getString(6)+"</td>");
								
								 out.println("<td><form name=\"choose\" method=\"post\" action=\"./finishedit.jsp\"><input type=\"hidden\" name=\"question\" value='"+rs2.getString(3)+"'/><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"testtype\" value=\"deletemock\"/><input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/><input type=\"submit\" name=\"submit\" value=\"Delete\" /></form></td>");
    	
	}
	out.println("</table>");
	rs2.close();
%>			
		
		
				
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

 
