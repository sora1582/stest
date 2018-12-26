package com.strutscrud.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	private static String driver="com.mysql.jdbc.Driver";
	private  static String  url="jdbc:mysql://localhost:3306/strutscrud";
	private static String user="root";
	private static String password="6666";
	//
	public  static Connection getConnection() {
		Connection connection=null;
		try {
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		return connection;
	}
	public static void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
