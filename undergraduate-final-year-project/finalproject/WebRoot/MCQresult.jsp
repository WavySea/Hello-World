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
					  <%String username=session.getAttribute("username").toString();//student's name 
						String classid=session.getAttribute("classid").toString();//student's class 
						String courseid=session.getAttribute("courseid").toString();//student's courseID 
						String topic=session.getAttribute("topic").toString();//student's topic
						System.out.println(courseid);
						%>
					<h2><font color="#000000">hello <%=username %>,you have finished a MCQ, here is your result...</font></h2>
								<%String[] answer=request.getParameterValues("answer");%>
						<%ArrayList question=(ArrayList)session.getAttribute("question");%>
						
						<%  
						ArrayList wrong = new ArrayList();
						ArrayList rightanswer = new ArrayList();
						int score=0;
						int rawscore=0;
						String sentence,level;
						for(int i=0;i<answer.length;i++){  
								String studentanswer=answer[i];
								
								String item=question.get(i).toString();								
								String sql="SELECT answer FROM qexam where item='"+item+"';"; 
 								ResultSet rs1=MyBean.executeQuery(sql);
 								while(rs1.next()){
 								//out.println(rs1.getString("answer"));
 								//out.println(studentanswer);
 								if(studentanswer.equals(rs1.getString("answer"))){
 								score=score+10;
 								//out.println("i have add");
 								}else{
 								wrong.add(question.get(i));
 								rightanswer.add(rs1.getString("answer"));
 								
 								}
 								}
 								rs1.close();
							}
						if(score<20){
						sentence="sorry, your score is too low, you have to take the test again.";
						}else{
						String sql2="SELECT accumulatedscore FROM rank where courseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"');"; 
 						ResultSet rs2=MyBean.executeQuery(sql2);
 						rawscore=score;
 						//System.out.println(username);
 						while(rs2.next()){
 						
 						score=score+Integer.parseInt(rs2.getString("accumulatedscore"));
 						System.out.println("accumulatedscore is:"+rs2.getString("accumulatedscore")+"rawscore is:"+rawscore);
 						}
 						if(score<500){
 						level="easy";
 						}else if(score<3000){
 						level="medium";
 						}else{
 						level="hard";
 						}
 						
 						String score1 = Integer.toString(score);
 						
 						String sql3= "update rank a set accumulatedscore='"+score1+"' and level='"+level+"' where CourseId='"+courseid+"' and idnumber IN(select idnumber from users where username='"+username+"');";
						System.out.println(sql3);
						MyBean.executeUpdate(sql3);
						sentence="you now have '"+score+"' accumulated scores, you are in '"+level+"' level";
						if(score<30){
						
						}
						}
						out.println("you got '"+rawscore+"' scores! "+sentence);
						out.println("<table border=\"0\" cellspacing=\"2\" cellpadding=\"5\" bgcolor=\"#008800\"> ");
    					out.println("<tr bgcolor=\"#ffffff\">");
    					out.println("<td colspan=\"11\"><div align=\"left\"><b> </b></div></td>");
    					out.println("</tr>");
    					out.println("<tr bgcolor=\"#cccccc\">");
    					out.println("<td>question</td>");
    					out.println("<td>right answer</td>");
    					out.println("</tr>");
    					for(int j=0;j<wrong.size();j++){
    					out.println("<tr bgcolor=\"ffff88\">");
    					out.println("<td>"+question.get(j)+"</td>");
    					out.println("<td>"+rightanswer.get(j)+"</td>");
    					out.println("</tr>");
    				    }
    				    					
   						 %>
   						 <%session.setAttribute(username, "username"); 
   						  session.setAttribute(classid, "classid"); 
   						   
   						    
   						   %>
   						
   						
					</div>
					<div class="footer">
						<ul>
						
							<li class="first"><a href="welcomestudent.jsp">logout Course</a></li>
							<li><a href="chooseMCQtopic.jsp?courseID=<%=courseid %>">do the test again</a></li>
							<li><a href="studentMenu.jsp?courseID=<%=courseid %>">student menu</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
