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
	

	public boolean register(Users user);//ע��

	public List<Users> getUserAll();//�����û���Ϣ����

	public boolean delete(int id) ;//����idɾ���û�

	boolean update(int id, String name, String pwd, int authority);

	
	
}
