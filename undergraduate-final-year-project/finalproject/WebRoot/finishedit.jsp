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
 <%String courseid= (String)session.getAttribute("courseID");
 String testtype=request.getParameter("testtype").toString();
 session.setAttribute("username",username);
  	session.setAttribute("courseid",courseid);
  	System.out.println(testtype);
  	
  	String sql="";
  	if(testtype.equals("addMCQ")){
  	String topic=request.getParameter("topic").toString();
  	String question=request.getParameter("textarea").toString();
  	String optiona=request.getParameter("optiona").toString();
  	String optionb=request.getParameter("optionb").toString();
  	String optionc=request.getParameter("optionc").toString();
  	String optiond=request.getParameter("optiond").toString();
  	String answer=request.getParameter("answer").toString();
  	String level=request.getParameter("level").toString();
  	String picture=request.getParameter("picture").toString();
   sql = "insert into qexam (courseid,topic,item,picture,level,optionA,optionB,optionC,optionD,answer) values(\""+courseid+"\",\""+topic+"\",\""+question+"\",\""+picture+"\",\""+level+"\",\""+optiona+"\",\""+optionb+"\",\""+optionc+"\",\""+optiond+"\",\""+answer+"\";) ;";
	
 }else if(testtype.equals("deleteMCQ")){
   String question=request.getParameter("question");
   sql="delete from qexam where item='"+question+"'";
 }else if(testtype.equals("addmock")){
 	
  	String question=request.getParameter("textarea").toString();
  	
  	String picture2=request.getParameter("picture2").toString();
  	String level=request.getParameter("level").toString();
  	String picture=request.getParameter("picture").toString();
 sql = "insert into mockexam (Id,courseid,question,picture,picture2,level) values(?,\""+courseid+"\",\""+question+"\",\""+picture+"\",\""+picture2+"\",\""+level+"\";) ;";
	
 }else{
  String question=request.getParameter("question");
   sql="delete from mockexam where question='"+question+"'";
 }
 
 MyBean.executeUpdate(sql); 
 
 %>
 <b>you have succeed in editing.</b><br/>
 <div class="footer">
						<ul>
						<%session.setAttribute("username",username);
						  session.setAttribute("courseid",courseid); 
						  
						   %>
							<li class="first"><a href="teacherMenu.jsp">main menu</a></li>
							<li><a href="welcometeacher.jsp">logout Course</a></li>
							<li><a href="adItem.jsp">edit more questions</a></li>
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
  </body>
</html>
