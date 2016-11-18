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
			<div id="bg">&nbsp; background</div>
			<div class="page">
				<div class="sidebar">
					<div id="logo">
						<a href="index.html"><img src="images/logo2.png" alt=""/></a>
					</div>
					<ul>
						<li><a href="index.html">HOME</a></li>
						<li><a href="about.html">ABOUT</a></li>
						<li class="selected"><a href="welcome.jsp">LOGIN</a></li>
						
					</ul>
					<div class="connect">
						<a href="mailto:shy@bupt.edu.cn" class="email">email</a>						
					</div>				</div>
				<div class="body">
					<div class="content">
					<h2><font color="#000000">You Are...</font></h2>
								
						
   						<a href="studentlogin.html">student</a><br/><br/>
   						<a href="teacherlogin.html">teacher</a>
   						
					</div>
					<div class="footer">
						<ul>
							<li class="first"><a href="index.html">logout Course</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="register.html">Register</a></li>
							
						</ul>
						<p>Copyright &#169; 2011. Company name all rights reserved</p>
					</div>
				</div>
			</div>
		</div>
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>

</html>
