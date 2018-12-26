package com.strutscrud.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.strutscrud.dao.StudentDao;
import com.strutscrud.dao.impl.StudentDaoImpl;
import com.strutscrud.domain.Student;

public class SearchAction extends ActionSupport implements RequestAware{
	private List<Student> list;
	private String kw;
	public List<Student> getList() {
		return list;
	}
	public void setList(List<Student> list) {
		this.list = list;
	}
	public String getKw() {
		return kw;
	}
	public void setKw(String kw) {
		this.kw = kw;
	}
	public String searchStudent(){
		StudentDao studentDao = new StudentDaoImpl();
		list = studentDao.searchAction(kw);
		request.put("list", list);
		return SUCCESS;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
		
	}
	
}
