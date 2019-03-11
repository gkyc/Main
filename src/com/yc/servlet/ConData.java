package com.yc.servlet;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConData {
	private final static String DRIVER="com.mysql.jdbc.Driver";
	private final static String URL="jdbc:mysql://localhost:3306/yc_database?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
	private final static String ROOT="root";
	private final static String PASSWORD="123456";
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName(DRIVER);//加载驱动
			conn =  DriverManager.getConnection(URL, ROOT, PASSWORD);//获取链接
			//System.out.println("=====获取链接成功=====");
		} catch (Exception e) {
			System.out.println("=====获取链接失败=====");
			e.printStackTrace();
		}
		return conn;		
	}
	public static  void closeConnection(Connection conn){
		try {
			//System.out.println("=====关闭链接成功=====");
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Connection conn = getConnection();
		
		closeConnection(conn);
	}
}
