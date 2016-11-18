<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
 <script type="text/javascript">
							function mySubmit(){
							document.studentquestion.submit();//表单提交action="register.jsp"
							}
						</script>
						
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  </head>
  
  <body>
  
  <%String username = (String)session.getAttribute("username");%>
 <div class="background">
			<div id="bg">background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li class="selected"><a href="teacherMenu.html">Main Menu</a></li>
						<li><a onclick="mySubmit()">Student's Questions</a>
						<form name="studentquestion" method="post" action="./viewquestion" >					     
					    <input type="hidden" name="username" value="t2"/>
					    </form>
					   
						</li>
						<li><a href="rankft.html">Ranks</a></li>
						<li><a href="edititem.html">Add/Delete item</a></li>
						<li><a href="courseRegister.html">Add/Delete a course</a></li>					
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>				</div>
				<div class="body">
					<div class="content">
						<div id="about">
							<div>
								
								<h2><font color="#000000">Hello, <%=username %></font></h2>
								
					
			
			 
			
			 	<div>	
							<p><span><a>This page aims to illustrate the functionality that provide for each teacher.</p>
							
							<p>It is also a good website for teachers to know more about students. You can know how students active in the learning website and what is
							the most difficult point for students to revise their course. However, teachers are also given a platform to communicate more with students 
							conveniently.</p>
						</div>
						<ul>
							<li class="first">
								<a href="studentQuestion.html">
								<img src="images/studentQuestion.png" alt=""/></a>
								<span><a href="studentQuestion.html">View Student's Questions</a></span>
								<p> When students start revising their courses, they may face a lot of questions and can't solve them well. This functionality is to provide
								students with your keen help by giving your comments/answers to their questions so that they can improve their efficiency and get to know 
								the truth of the knowledge.</p>
							</li>
							<li>
								<a href="rankft.html">
								<img src="images/rankft.png" alt=""/></a>
								<span><a href="index.html">view ranks</a></span>
								<p>In this functionality, you can view students' ranks. For example, you can know which students behave active in this website, which questions
								are easily got wrong by students. You can also give your tips to students according to their behaviors.</p>
							</li>
							<li>
								<a href="edititem.html">
								<img src="images/edititem.png" alt=""/></a>
								<span><a href="edititem.html">Add/Delete items</a></span>
								<p>The question items that are showed on this website depends on the items you provide.  So we are strongly recommend you to provide more questions
								so that students can get abundant resources. You can add the items or delete the old items according to the current situation.</p>
							</li>
						</ul>
					</div>
							
						</div>
					</div>
					<div class="footer">
						<ul>
							<li class="first"><a href="index.html">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="register.html">Register</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				</div>
			</div>
		</div>
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

  </body>
</html>
