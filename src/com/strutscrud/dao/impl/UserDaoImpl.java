package com.strutscrud.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import com.strutscrud.dao.Userdao;
import com.strutscrud.domain.Student;
import com.strutscrud.domain.Users;
import com.strutscrud.util.Connector;
import com.strutscrud.util.DBconn;


public class UserDaoImpl implements Userdao{
/*
 * 方法的形参name是页面传过来的用户名
 * 查询用户名数据库，对应密码将至返回
 * (non-Javadoc)
 * @see com.strutscrud.dao.Userdao#getPassByName(java.lang.String)
 */
	Connection connection;
	@Override
	public Users getPassByName(String name,String password) {
		Users users=null;
		Connection connection=Connector.getConnection();
		String sql="select * from users where username=? and password=?";
		try {
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, name);
			pStatement.setString(2, password);
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()){
				users=new Users();
				users.setUid(rSet.getInt(1));
				users.setUsername(rSet.getString(2));
				users.setPassword(rSet.getString(3));
				users.setAuthority(rSet.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	/*public static void main(String[] args) {
		Userdao userdao=new UserDaoImpl();
		System.out.println(userdao.getPassByName("tom","123"));
	}*/
	@Override
	public boolean register(Users user) {
		boolean flag = false;

		DBconn.init();

		int i =DBconn.addUpdDel("insert into user(name,pwd,sex,home,info) " +

		"values('"+user.getUsername()+"','"+user.getUid()+"')");

		if(i>0){

		flag = true;

		}

		DBconn.closeConn();

		return flag;

		
	}
	@Override
	public List<Users> getUserAll() {
	

		List<Users> list = new ArrayList<Users>();

		try {

		DBconn.init();

		ResultSet rs = DBconn.selectSql("select * from user");

		while(rs.next()){

		Users user = new Users();

		user.setUid(rs.getInt("id"));

		user.setUsername(rs.getString("name"));

		user.setPassword(rs.getString("pwd"));

		

		user.setAuthority(rs.getInt("authority"));

		list.add(user);

		}

		DBconn.closeConn();

		return list;

		} catch (SQLException e) {

		e.printStackTrace();

		}

		return null;

		}
	@Override
	public boolean delete(int id) {
		boolean flag = false;

		DBconn.init();

		String sql = "delete from user where id="+id;

		int i =DBconn.addUpdDel(sql);

		if(i>0){

		flag = true;

		}

		DBconn.closeConn();

		return flag;

		}

		
	
	@Override
	public boolean update(int id, String name, String pwd, int authority) {
		boolean flag = false;

		DBconn.init();

		String sql ="update user set name ='"+name

		+"' , pwd ='"+pwd

		

		+"' , authority ='"+authority+"' where id = "+id;

		int i =DBconn.addUpdDel(sql);

		if(i>0){

		flag = true;

		}

		DBconn.closeConn();

		return flag;

	}
	
}
