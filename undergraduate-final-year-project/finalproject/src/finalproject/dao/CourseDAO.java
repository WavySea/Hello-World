package finalproject.dao;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;


import finalproject.vo.Course;

public class CourseDAO {
	public void saveCourse(Course course){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://127.0.0.1:3306/finalproject";
			Connection conn=DriverManager.getConnection(url,"root","");
			String sql= "insert into course(courseid,coursename,class,teacher)values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,course.getCourseID());
			ps.setString(2,course.getCoursename());
			//ps.setString(3,course.getCourseID());
			//ps.setString(4,user.getUsername());
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
