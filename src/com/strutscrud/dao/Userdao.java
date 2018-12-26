package com.strutscrud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.strutscrud.domain.Student;
import com.strutscrud.domain.Users;
import com.strutscrud.util.Connector;

public interface Userdao {
	public Users getPassByName(String name,String password);
	

	public boolean register(Users user);//注册

	public List<Users> getUserAll();//返回用户信息集合

	public boolean delete(int id) ;//根据id删除用户

	boolean update(int id, String name, String pwd, int authority);

	
	
}
