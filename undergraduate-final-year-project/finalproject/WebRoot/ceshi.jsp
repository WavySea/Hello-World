<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>
 <div class="background">
			
					<h2><font color="#000000">Please Answer Carefully...(you should type A,B,C,D in each blank)</font></h2>
						
						<%String username=request.getParameter("username").toString();//student's name 
						String classid=request.getParameter("classid").toString();//student's class 
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						String topic = request.getParameter("topic").toString();
						request.setAttribute(topic,"topic");	
						String sql;
						if(topic!=""){
						sql="SELECT * FROM qexam where  topic='"+topic+"'and courseid= '"+courseid+"'AND qexam.level =(select rank.level from rank where CourseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"'))order by rand() limit 3;"; 
 						
 						out.println(topic);
						}else{
						sql="SELECT * FROM qexam where courseid= '"+courseid+"' AND qexam.level =(select rank.level from rank where CourseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"'))order by rand() limit 3;"; 
 						}
 						out.println("<form name=\"choose\" method=\"post\" action=\"./MCQresult.jsp\">");
    //out.println(sql);
    ResultSet rs1=MyBean.executeQuery(sql);
    	 ArrayList question = new ArrayList();
     while(rs1.next()){
    out.println("<table border=\"0\" cellspacing=\"2\" cellpadding=\"5\" bgcolor=\"#008800\"> ");
    	out.println("<tr bgcolor=\"#ffffff\">");
    	out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    	out.println("</tr>");
    	out.println("<tr bgcolor=\"#cccccc\">");
    	out.println("<td>question</td>");
    	
    	if(rs1.getString(5)!=null){
    	out.println("<td>image</td>");
    	}
    	out.println("<td>optionA</td>");
    	out.println("<td>optionB</td>");
    	out.println("<td>optionC</td>");
    	out.println("<td>optionD</td>");
    	out.println("<td>your answer</td>");
    	out.println("</tr>");
   
    	out.println("<tr bgcolor=\"ffff88\">");
    	out.println("<td>"+rs1.getString(4)+"</td>");
    	question.add(rs1.getString(4));
    	if(rs1.getString(5)!=null){
    	out.println("<td>"+"<img src=images/"+rs1.getString(5)+"/></td>");
    	}
    	out.println("<td>"+rs1.getString(7)+"</td>");
    	out.println("<td>"+rs1.getString(8)+"</td>");
    	out.println("<td>"+rs1.getString(9)+"</td>");
    	out.println("<td>"+rs1.getString(10)+"</td>");
    	out.println("<td><input type=\"text\" name=\"answer\"/></td>");
    	session.setAttribute("username",username);
		session.setAttribute("courseid",courseid); 
		session.setAttribute("classid",classid);
    	//out.println("<td><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/></td>");
    	//out.println(rs1.getString(1));
    	out.println("</tr>");
    	out.println("</table>");
    	
    }
    out.println("<input type=\"submit\" name=\"submit\" value=\"submit my answer\" /></form>");
    session.setAttribute("question", question);
    rs1.close();
    
  %>
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
