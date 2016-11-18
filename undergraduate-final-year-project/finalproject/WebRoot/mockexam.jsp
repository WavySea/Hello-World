<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%@page import="java.util.*" %>

<%@ page import="java.text.*"%>

<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>mock exam</title>
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
						String ascore=session.getAttribute("score").toString();
						int score= Integer.parseInt(ascore);//student's accumulatedscore
						String anumber=session.getAttribute("i").toString();
						int number= Integer.parseInt(anumber);//student's question number
						//out.println(classid);
						
						out.println("<h2><font color=\"#000000\">Please answer these questions carefully...</h2></font>");
						out.println("<b><font color=\"#000000\">you can change the size of 'answer area' by dragging bottom right</font></b>");
						String sql="SELECT * FROM mockexam where Id='"+number+"'";
						ResultSet rs1=MyBean.executeQuery(sql);
						
							while(rs1.next()){
								out.println("<form name=\"mockexam\" method=\"post\" action=\"./submitmock.jsp\" >");
								out.println(rs1.getString("question"));
								session.setAttribute("question",rs1.getString("question"));
								if(rs1.getString("picture")!=null){
								out.println("<img src='"+rs1.getString("picture")+"' alt=\"\"/>");
								}else if (rs1.getString("picture2")!=null){
								out.println("<img src='"+rs1.getString("picture2")+"' alt=\"\"/>");
								}
								Timestamp ts = new Timestamp(System.currentTimeMillis()); 
								String tsStr;
								DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
								tsStr = sdf.format(ts);
								//out.println(tsStr);
								out.println("<br><br><textarea name=\"textarea\" class=editable onkeydown =\"if(event.keyCode==13) return false; \" oninput=\"this.style.height=0px;this.style.height=(this.scrollHeight+px);\" onpropertychange=\"this.style.height=(this.scrollHeight+px)\" /></textarea>"); 
								out.println("<td><input type=\"hidden\" name=\"username\" value='"+username+"'/><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"classid\" value='"+classid+"'/><input type=\"hidden\" name=\"courseid\" value='"+courseid+"'/><input type=\"hidden\" name=\"timestamp\" value='"+tsStr+"'/><input type=\"hidden\" name=\"ascore\" value='"+ascore+"'/></td>");
								out.println("<input type=\"submit\" name=\"submit\" value=\"submit my answer\" /></form>");
    							out.println("</form>");
							}
						rs1.close();
						%> <br>
</div>
  </body>
</html>
