package com.strutscrud.dao;

import java.util.List;

import com.strutscrud.domain.Student;

public interface StudentDao {
	public List<Student> showStudent();

	public void deleteStudent(Integer sid);
	public void insertStudent(Student stu);
	public Student getStudentById(Integer sid);
	public void updateStudent(Student stu);
	public List<Student> searchAction(String kw);
}
