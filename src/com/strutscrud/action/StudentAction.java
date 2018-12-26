package com.strutscrud.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.strutscrud.dao.StudentDao;
import com.strutscrud.dao.impl.StudentDaoImpl;
import com.strutscrud.domain.Student;

public class StudentAction extends ActionSupport implements RequestAware{
	private Integer sid;
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}

	private List<Student> list;
	public List<Student> getList() {
		return list;
	}
	public void setList(List<Student> list) {
		this.list = list;
	}
	
	public String showStudent() {
		StudentDao studentDao = new StudentDaoImpl();
		list = studentDao.showStudent();
		
		
		return SUCCESS;
		
	}
	
	/*
	 * 
	 * 
	 */
	public String deleteStudent() {
		StudentDao sDao=new StudentDaoImpl();
		sDao.deleteStudent(sid);
		
		
		return SUCCESS;
		
	}
	private Student stu;
	
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public Map<String, Object> getRequest() {
		return request;
	}
	public String addStudent(){
		StudentDao sDao= new StudentDaoImpl();
		sDao.insertStudent(stu);
		
		return SUCCESS;
	}
	public String getStudentById(){
		StudentDao sDao= new StudentDaoImpl();
		stu = sDao.getStudentById(sid);
		
		request.put("stu", stu);
		return SUCCESS;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
		
	}
	public String updateStudent(){
		StudentDao sDao= new StudentDaoImpl();
		sDao.updateStudent(stu);
		return SUCCESS;
	}
}
