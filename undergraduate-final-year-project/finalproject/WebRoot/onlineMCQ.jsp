<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>online MCQ</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" />
		<![endif]-->
<jsp:useBean id="MyBean" scope="page" class="Bean.QueryUpdate"/>

</head>
<body>

						
						<%String username=session.getAttribute("username").toString();//student's name 
						String classid=session.getAttribute("classid").toString();//student's class 
						String courseid=request.getParameter("courseid").toString();//student's courseID 
						String topic = request.getParameter("topic").toString();
						request.setAttribute(topic,"topic");	
						String sql;
						if(topic!=""){
						sql="SELECT * FROM qexam where  topic='"+topic+"'and courseid= '"+courseid+"'AND qexam.level =(select rank.level from rank where CourseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"'))order by rand() limit 3;"; 
 						
 						//out.println(topic);
						}else{
						sql="SELECT * FROM qexam where courseid= '"+courseid+"' AND qexam.level =(select rank.level from rank where CourseId='"+courseid+"' and rank.idnumber IN(select users.idnumber from users where users.username='"+username+"'))order by rand() limit 3;"; 
 						}
 						out.println("<form name=\"choose\" method=\"post\" action=\"./MCQresult.jsp\">");
    //out.println(sql);
    ResultSet rs1=MyBean.executeQuery(sql);
    	 ArrayList question = new ArrayList();
    	 %>


<div style="position: absolute; width: 1126px; height: 484px; z-index: 1; left: 10px; top: 15px" id="layer1">
	
	<div style="position: absolute; width: 1046px; height: 188px;z-index: 3; left: 38px; top: 203px" id="layer4">
	<% int i=1; ArrayList answer = new ArrayList();%>
		<%   while(rs1.next()){%>
		<table border="0" width="100%">
		
			<tr>
			
				<td width="4%" bordercolor="#FFFFFF"><% out.println(i);i=i+1; %></td>
				<td  width="94%" bordercolor="#FFFFFF">
				<font color="#800000"><% out.println(rs1.getString(4));
    									question.add(rs1.getString(4)); %></font></td>
			</tr>
			<tr>
			<%if(rs1.getString(5)!=null){
    			out.println("<td>"+"<img src='"+rs1.getString(5)+"' alt=\"\"/></td>");    		}%>
			</tr>
			<tr>
				<td bordercolor="#FFFFFF"><%out.println("<input type=\"checkbox\" name=\"answer\" value=\"A\"/>");%>A.<%=rs1.getString(7)%></td>
			</tr>
			<tr>
				<td  bordercolor="#FFFFFF"><%out.println("<input type=\"checkbox\" name=\"answer\" value=\"B\"/>");%>B.<%=rs1.getString(8)%></td>
			</tr>
			<tr>
				<td bordercolor="#FFFFFF"><%out.println("<input type=\"checkbox\" name=\"answer\" value=\"C\"/>");%>C.<%=rs1.getString(9)%></td>
			</tr>
			<tr>
				<td bordercolor="#FFFFFF"><%out.println("<input type=\"checkbox\" name=\"answer\" value=\"D\"/>");%>D.<%=rs1.getString(10)%></td>
			</tr>
			<%session.setAttribute("topic",rs1.getString(3)); session.setAttribute("username",username);session.setAttribute("courseid",courseid); session.setAttribute("classid",classid);%></td>
			
			
		</table>
		<br/><br/><%}out.println("<input type=\"submit\" name=\"submit\" value=\"submit my answer\" /></form><br/><br/>");
    		session.setAttribute("question", question);
   			 rs1.close();%><hr><br/>
	</div>
	<div style="position: absolute; width: 1043px; height: 40px; z-index: 1; left: 40px; top: 81px" id="layer2">
		<p style="margin-top: 3px; margin-bottom: 3px; line-height:150%"><b><u>
		<i>
		<font size="2" face="Malgun Gothic">Attention:</font></i></u></b></p>
		<p style="margin-top: 3px; margin-bottom: 3px">
		<font size="2" face="Malgun Gothic">You have 3 questions to answer, and 
		please make sure that you have answer each question carefully.</font></p>
		<p style="margin-top: 3px; margin-bottom: 3px">
		<font size="2" face="Malgun Gothic">If your answer is right, you will 
		get 10 scores for that question.</font></p>
		<p style="margin-top: 3px; margin-bottom: 3px">
		<font size="2" face="Malgun Gothic">If your total score is lower than 20 
		scores, you will be required to take another MCQ test again.</font></p>
		<hr>
		<p style="margin-top: 3px; margin-bottom: 3px">¡¡</div>
	<div style="position: absolute; width: 1126px; height: 79px; z-index: 2; left: 0px; top: 0px" id="layer3">
		<p align="center"><font face="GungsuhChe" size="4">MCQ Test</font></p>
		<p align="center"><font face="Meiryo" size="2">Total score: 30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		Pass score: 20</font></p>
		<hr>
		<p align="center">¡¡</div>
	<p>
	¡¡</div>



					
					
</html>
