<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    
    <title>teacher Menu</title>
    
	
	<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
 
						
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  </head>
  
  <body>
  
  <%String username = (String)request.getParameter("username");%>
  <%String courseID = (String)request.getParameter("courseID");
  	session.setAttribute("username",username);
  	session.setAttribute("courseID",courseID);
  %>
 <div class="background">
			<div id="bg">background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li class="selected"><a href="teacherMenu.html">Main Menu</a></li>
						<li><a href="studentQuestion.jsp">Student's Questions</a></li>
						<li><a href="studentRank.jsp">Ranks</a></li>
						<li><a href="adItem.jsp">Add/Delete Question</a></li>
						<li><a href="viewmock.jsp">Mock Exam</a></li>
										
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>	</div>
				<div class="body">
					<div class="content">
						
								<h2><font color="#000000">Hello, <%=username %>, you are in course <%=courseID %></font></h2>
					
						
						
						<ul>
							<li class="first">
								
								<img src="images/studentQuestion.png" alt=""/>
								<span><a href="studentQuestion.jsp">View Student's Questions</a></span>
								<p> When students start revising their courses, they may face a lot of questions and can't solve them well. This functionality is to provide
								students with your keen help by giving your comments/answers to their questions so that they can improve their efficiency and get to know 
								the truth of the knowledge.</p>
							</li>
							<li>
								
								<img src="images/rankft.png" alt=""/>
								<span><a href="studentRank.jsp">view ranks</a></span>
								<p>In this functionality, you can view students' ranks. For example, you can know which students behave active in this website, which questions
								are easily got wrong by students. You can also give your tips to students according to their behaviors.</p>
							</li>
							<li>
								
								<img src="images/edititem.png" alt=""/>
								<span><a href="adItem.jsp">Add/Delete items</a></span>
								<p>The question items that are showed on this website depends on the items you provide.  So we are strongly recommend you to provide more questions
								so that students can get abundant resources. You can add the items or delete the old items according to the current situation.</p>
							</li>
						</ul>
					</div>
					</div>
					
				</div>
			</div>
		
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
