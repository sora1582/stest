package com.strutscrud.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.strutscrud.dao.StudentDao;
import com.strutscrud.domain.Student;
import com.strutscrud.util.Connector;import com.sun.xml.internal.ws.api.ha.StickyFeature;

import sun.java2d.pipe.SpanClipRenderer;



public class StudentDaoImpl implements StudentDao{
	Connection connection;
	@Override
	public List<Student> showStudent() {
		// TODO Auto-generated method stub
		List<Student> list=new ArrayList<>();
		 connection=Connector.getConnection();
		String sql="select * from student";
		try {
			PreparedStatement pStatement=connection.prepareStatement(sql);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				Student student=new Student();
				student.setSid(rSet.getInt(1));
				student.setSname(rSet.getString(2));
				student.setSage(rSet.getInt(3));
				student.setSsex(rSet.getString(4));
				student.setSaddr(rSet.getString(5));
				list.add(student);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Connector.closeConnection(connection);
		}
		return list;
	}

	@Override
	public void deleteStudent(Integer sid) {
		 connection = Connector.getConnection();
		String sql = "delete from student where sid=?";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, sid);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Connector.closeConnection(connection);
	}

	@Override
	public void insertStudent(Student stu) {
		connection=Connector.getConnection();
		String sql="insert into student values(null,?,?,?,?)";
		try {
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, stu.getSname());
			pStatement.setInt(2, stu.getSage());
			pStatement.setString(3, stu.getSsex());
			pStatement.setString(4, stu.getSaddr());
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Connector.closeConnection(connection);
		}
		
	}

	@Override
	public Student getStudentById(Integer sid) {
		
		Student stu = new Student();
		connection=Connector.getConnection();
		String sql="select * from student where sid=?";
		try {
			PreparedStatement pstmt=connection.prepareStatement(sql);
			pstmt.setInt(1, sid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				
				stu.setSid(rs.getInt(1));
				stu.setSname(rs.getString(2));
				stu.setSage(rs.getInt(3));
				stu.setSsex(rs.getString(4));
				stu.setSaddr(rs.getString(5));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
		return stu;
	}

	@Override
	public void updateStudent(Student stu) {
		Connection connection=Connector.getConnection();
		String sql="update student set sname=?,sage=?,ssex=?,saddr=? where sid=?";
		try {
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, stu.getSname());
			pStatement.setInt(2, stu.getSage());
			pStatement.setString(3, stu.getSsex());
			pStatement.setString(4, stu.getSaddr());
			pStatement.setInt(5, stu.getSid());
			pStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			Connector.closeConnection(connection);
		}
	}

	@Override
	public List<Student> searchAction(String kw) {
		List<Student> list=new ArrayList<>();
		 connection=Connector.getConnection();
		 String sql="select * from student where sname like ?";
		 try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, "%"+kw+"%");
			ResultSet rSet=preparedStatement.executeQuery();
			while(rSet.next()){
				Student student=new Student();
				student.setSid(rSet.getInt(1));
				student.setSname(rSet.getString(2));
				student.setSage(rSet.getInt(3));
				student.setSsex(rSet.getString(4));
				student.setSaddr(rSet.getString(5));
				list.add(student);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			Connector.closeConnection(connection);
		}
		return list;
	}
		
	
	
}
