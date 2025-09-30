package com.society.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnections {

	public static final String USER = "root";
	public static final String PASS = "root";
	public static final String URL = "jdbc:mysql://localhost:3306/society_management";
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static Connection con=null;
	
	public DBConnections() {
	}
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USER,PASS);
			System.out.println("DB Connection Success");
		}
		catch (ClassNotFoundException|SQLException e) {
			// TODO: handle exception
			System.out.println("DB Connection Issue: "+e.getMessage());
		}
		return con;
	}
	
	public static void main(String[] args) {
		getConnection();
	}
	
	

}
